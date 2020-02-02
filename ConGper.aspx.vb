Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class ConGper
    Inherits System.Web.UI.Page

    Private Sub ConGper_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("rut_contratista") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Label7.Text = Session("rut_contratista")
        Label8.Text = Session("nombre_contratista")
        Label9.Text = Session("contacto_contratista")
        Label10.Text = Session("telefono_contratista")
        Label11.Text = Session("email_contratista")

    End Sub
End Class
