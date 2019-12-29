
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Dim dato As String

        dato = TextBox1.Text

        Response.Redirect("HomeCheck.aspx?usuario=" + dato + "&codigo=" + Request.QueryString("codigo"))

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub
End Class
