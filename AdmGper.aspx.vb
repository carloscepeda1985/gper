Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class AdmGper
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Label7.Text = Session("nombr_pro")
        Label8.Text = Session("apelli_pro")
        Label9.Text = Session("mail_pro")
        Label10.Text = Session("tele_pro")
        Label11.Text = Session("sitio_pro")
        Label12.Text = Session("depto_pro")
    End Sub
    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Response.Redirect("frm_nuevo.aspx?dato=" + Session("rut_pro"))
    End Sub

End Class
