
Partial Class ComprobanteChecklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Label1.Text = Request.QueryString("porcentaje")
    End Sub
End Class
