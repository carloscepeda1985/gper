
Partial Class frm_fotoacceso
    Inherits System.Web.UI.Page

    Dim dato As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Button2.Attributes.Add("onclick", "history.back(); return false;")
        dato = Request.QueryString("dato")

        Image1.ImageUrl = dato



    End Sub


    Protected Sub Image1_Unload(sender As Object, e As System.EventArgs) Handles Image1.Unload

        Label1.Text = sender.ToString


        Image1.ImageUrl = dato

    End Sub
End Class
