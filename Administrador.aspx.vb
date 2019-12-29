Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class Administrador
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
    
        'Acceso Administrador

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, nombre FROM users_m where username = '" & TextBox1.Text & "' and password = '" & TextBox2.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then

            Session("id_con") = dr.GetValue(0).ToString()
            Session.Timeout = 50
            Session("nombre") = dr.GetValue(1).ToString()
            Session.Timeout = 50
            Response.Redirect("frm_propietarios.aspx")
            ' Response.Redirect("Test.aspx")

        End If
            conn.Close()

    End Sub



End Class
