Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_edita_bloqueados
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

                DropDownList1.Items.Insert(0, "Bloqueo Vignete")
                DropDownList1.Items.Insert(1, "Desbloqueado")


                Dim dt As New DataTable()

                conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
                conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
                conector += "Pwd=90VEporefi;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "SELECT rut, nombre, apellido, motivo, estado FROM prohibidos where rut = '" & lbl_rut.Text & "'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()
                I = 0
                If (dr.Read()) Then

                    TextBox7.Text = dr.GetValue(0).ToString()
                    TextBox1.Text = dr.GetValue(1).ToString()
                    TextBox2.Text = dr.GetValue(2).ToString()
                    TextBox3.Text = dr.GetValue(3).ToString()
                    DropDownList1.SelectedIndex() = dr.GetValue(4).ToString() - 1

                End If
            End If
      
    End Sub
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE prohibidos set rut = '" & TextBox7.Text & "', nombre = '" & TextBox1.Text() & "', apellido = '" & TextBox2.Text & "', motivo = '" & TextBox3.Text & "', estado = '" & DropDownList1.SelectedIndex() + 1 & "', updates = '1' where rut = '" & lbl_rut.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_prohibidos.aspx")
      
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
      
      
        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE prohibidos set estado = '2' where rut = '" & lbl_rut.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_prohibidos.aspx")
     
    End Sub
End Class
