Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_editar_visita
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        If (IsPostBack = False) Then

            Button2.Attributes.Add("onclick", "history.back(); return false;")
            TextBox1.Text = Request.QueryString("dato")
            lbl_rut.Text = TextBox1.Text

            DropDownList1.Items.Insert(0, "Autorizado")
            DropDownList1.Items.Insert(1, "No Autorizado")

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut, nombre, apellido, relacion, creacion, estado FROM personas_t where rut_p = '" & Session("rut_pro") & "' and deleted = '1' and rut = '" & TextBox1.Text & "' and tipo = 'Visita'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            If (dr.Read()) Then

                TextBox2.Text = dr.GetValue(1).ToString()
                TextBox3.Text = dr.GetValue(2).ToString()
                TextBox4.Text = dr.GetValue(3).ToString()
                DropDownList1.SelectedIndex() = dr.GetValue(5).ToString() - 1

            End If

        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE personas_t set rut = '" & TextBox1.Text & "', nombre = '" & TextBox2.Text() & "', apellido = '" & TextBox3.Text & "', relacion = '" & TextBox4.Text & "', estado = '" & DropDownList1.SelectedIndex() + 1 & "', updates = '0' where rut_p = '" & Session("rut_pro") & "' and rut = '" & lbl_rut.Text & "' and tipo = 'Visita'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_visitas.aspx")
      
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If


        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE personas_t set deleted = '2', updates = '0' where rut_p = '" & Session("rut_pro") & "' and rut = '" & lbl_rut.Text & "' and tipo = 'Visita'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_visitas.aspx")
        
    End Sub
End Class
