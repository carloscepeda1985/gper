
Partial Class MasterGper
    Inherits System.Web.UI.MasterPage

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Session.Abandon()
        Response.Redirect("Default.aspx")
    End Sub
End Class

