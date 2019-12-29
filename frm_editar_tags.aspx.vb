Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_editar_tags
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        
        If (IsPostBack = False) Then

            Button2.Attributes.Add("onclick", "history.back(); return false;")
            lbl_rut.Text = Request.QueryString("dato")

            DropDownList1.Items.Insert(0, "Activado")
            DropDownList1.Items.Insert(1, "Desactivado")

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id_tag, rut_p, patente, marca, color, estado FROM vehiculo_m where id_tag = '" & lbl_rut.Text & "' and deleted = '1' and id_condominio = '" & Session("id_con") & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            If (dr.Read()) Then

                TextBox7.Text = dr.GetValue(0).ToString()
                TextBox1.Text = dr.GetValue(1).ToString()
                TextBox2.Text = dr.GetValue(2).ToString()
                TextBox3.Text = dr.GetValue(3).ToString()
                TextBox4.Text = dr.GetValue(4).ToString()
                DropDownList1.SelectedIndex() = dr.GetValue(5).ToString() - 1

            End If
            End If
       
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE vehiculo_m set deleted = '2' where id_tag = '" & lbl_rut.Text & "' and id_condominio = '" & Session("id_con") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_tags.aspx")
       
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE vehiculo_m set id_tag = '" & TextBox7.Text & "', rut_p = '" & TextBox1.Text() & "', patente = '" & TextBox2.Text & "', marca = '" & TextBox3.Text & "', color = '" & TextBox4.Text & "', estado = '" & DropDownList1.SelectedIndex() + 1 & "', updates = '1' where id_tag = '" & lbl_rut.Text & "' and id_condominio = '" & Session("id_con") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_tags.aspx")

       
    End Sub
End Class
