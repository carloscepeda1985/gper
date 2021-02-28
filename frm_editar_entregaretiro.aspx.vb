Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_editar_entregaretiro
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
      
       
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If


        If (IsPostBack = False) Then

            Button2.Attributes.Add("onclick", "history.back(); return false;")
            lbl_rut.Text = Request.QueryString("dato")



            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id, empresa, tipo, descripcion, start, end FROM trabajos_m where rut_p = '" & Session("rut_pro") & "' and deleted = '1' and id = '" & lbl_rut.Text & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            If (dr.Read()) Then

                TextBox1.Text = dr.GetValue(1).ToString()
                TextBox2.Text = dr.GetValue(2).ToString()
                TextBox3.Text = dr.GetValue(3).ToString()
                TextBox4.Text = dr.GetValue(4).ToString()
                TextBox5.Text = dr.GetValue(5).ToString()

            End If

            End If

       
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Response.Redirect("frm_entregaretiro.aspx")

    
    End Sub
End Class
