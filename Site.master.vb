
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Administrador.aspx")
    End Sub

   
    Protected Sub NavigationMenu_MenuItemClick(sender As Object, e As System.Web.UI.WebControls.MenuEventArgs) Handles NavigationMenu.MenuItemClick

    End Sub
End Class

