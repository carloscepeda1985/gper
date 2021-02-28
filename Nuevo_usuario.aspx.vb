Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class Nuevo_usuario
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        TextBox1.Text = Request.QueryString("nombres")
        TextBox2.Text = Request.QueryString("apellidos")
        TextBox4.Text = Request.QueryString("telefono")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "Update usuario_terreno Set clave='" & TextBox7.Text & "', nombres='" & TextBox1.Text & "', apellidos='" & TextBox2.Text & "', telefono='" & TextBox4.Text & "', estado='1' Where rut='" & Request.QueryString("rut") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()
        Response.Redirect("ChecklistGper.aspx?rut=" + Request.QueryString("rut") + "&codigo=" + Request.QueryString("codigo"))


    End Sub
End Class
