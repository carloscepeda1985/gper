
Partial Class frm_apertura_exitosa
    Inherits System.Web.UI.Page

    Protected Sub Timer1_Tick(sender As Object, e As System.EventArgs) Handles Timer1.Tick
        Response.Redirect("frm_menuprincipal.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub
End Class
