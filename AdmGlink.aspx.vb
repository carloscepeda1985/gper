Imports Telerik.Web.UI

Partial Class AdmGper
    Inherits System.Web.UI.Page

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

        Response.Redirect("frm_nuevoEspacioUrbano.aspx?dato=" + Session("rut_pro"))
    End Sub

End Class
