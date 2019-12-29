Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_editar_trabajadorcond
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Dim fileOK As Boolean = False


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim path As String = Server.MapPath("~/UploadedImages/")

            If FileUpload1.HasFile Then
                Dim fileExtension As String
                fileExtension = System.IO.Path. _
                    GetExtension(FileUpload1.FileName).ToLower()
                Dim allowedExtensions As String() = _
                    {".jpg", ".jpeg", ".png", ".gif"}
                For i As Integer = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(i) Then
                        fileOK = True

                    End If
                Next
                If fileOK Then
                    Try
               
                        FileUpload1.PostedFile.SaveAs(path & lbl_rut.Text & ".png")

                    Catch ex As Exception

                    End Try
                Else

                End If
            End If
        End If

        If (IsPostBack = False) Then

            Button2.Attributes.Add("onclick", "history.back(); return false;")
            lbl_rut.Text = Request.QueryString("dato")

            DropDownList1.Items.Insert(0, "Autorizado")
            DropDownList1.Items.Insert(1, "No Autorizado")

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut, nombre, apellido, telefono, funcion, empresa , estado FROM trabajadores_m where rut = '" & lbl_rut.Text & "' and deleted = '1'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            If (dr.Read()) Then

                TextBox7.Text = dr.GetValue(0).ToString()
                TextBox1.Text = dr.GetValue(1).ToString()
                TextBox2.Text = dr.GetValue(2).ToString()
                TextBox3.Text = dr.GetValue(3).ToString()
                TextBox4.Text = dr.GetValue(5).ToString()
                TextBox5.Text = dr.GetValue(4).ToString()
                DropDownList1.SelectedIndex() = dr.GetValue(6).ToString() - 1

            End If
        End If
      
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click


        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE trabajadores_m set rut = '" & TextBox7.Text & "', nombre = '" & TextBox1.Text() & "', apellido = '" & TextBox2.Text & "', telefono = '" & TextBox3.Text & "', funcion = '" & TextBox5.Text & "', empresa = '" & TextBox4.Text & "', estado = '" & DropDownList1.SelectedIndex() + 1 & "', updates = '1' where rut = '" & lbl_rut.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_trabajadorescond.aspx")
    
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
    
            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "UPDATE trabajadores_m set deleted = '2' where rut = '" & lbl_rut.Text & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            Response.Redirect("frm_trabajadorescond.aspx")
     
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Response.Redirect("frm_trabajadorescond.aspx")
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Dim link As String
    
        link = "~/UploadedImages/" & lbl_rut.Text & ".png"

        Response.Redirect("frm_fotoacceso.aspx?dato=" + link)

    End Sub

End Class
