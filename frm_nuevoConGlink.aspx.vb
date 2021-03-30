Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_nuevo
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim x As String = "1"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Button2.Attributes.Add("onclick", "history.back(); return false;")
        Session("rut_pro") = Request.QueryString("dato")

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, id_mall, rut, nombre, contacto, telefono, email, pass, D1, D2, D3, D4, D5, estado FROM contratistas_m where rut = '" & Session("rut_contratista") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then

            TextBox1.Text = dr.GetValue(2).ToString()
            TextBox2.Text = dr.GetValue(3).ToString()
            TextBox3.Text = dr.GetValue(4).ToString()
            TextBox4.Text = dr.GetValue(5).ToString()
            TextBox5.Text = dr.GetValue(6).ToString()
            TextBox7.Text = dr.GetValue(7).ToString()

        End If

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If TextBox1.Text = "" Then
            TextBox1.Focus()
            Exit Sub
        End If
        If TextBox2.Text = "" Then
            TextBox2.Focus()
            Exit Sub
        End If
        If TextBox3.Text = "" Then
            TextBox3.Focus()
            Exit Sub
        End If
        If TextBox4.Text = "" Then
            TextBox4.Focus()
            Exit Sub
        End If
        If TextBox5.Text = "" Then
            TextBox5.Focus()
            Exit Sub
        End If

        If TextBox7.Text = "" Then
            TextBox7.Focus()
            Exit Sub
        End If


        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE contratistas_m set rut = '" & TextBox1.Text & "', nombre = '" & TextBox2.Text & "', contacto = '" & TextBox3.Text & "', telefono = '" & TextBox4.Text & "', email = '" & TextBox5.Text & "', pass = '" & TextBox7.Text & "' where rut = '" & Session("rut_contratista") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

        Session("nombre_contratista") = TextBox2.Text
        Session("contacto_contratista") = TextBox3.Text
        Session("telefono_contratista") = TextBox4.Text
        Session("email_contratista") = TextBox5.Text

        ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)



    End Sub

    Protected Sub TextBox3_TextChanged(sender As Object, e As System.EventArgs) Handles TextBox3.TextChanged
        Dim Cooki As HttpCookie = New HttpCookie("YouSoftKey")
        Dim exp As New Date
        exp = Date.Now
        exp = exp.AddDays(30.0)
        Cooki.Values.Add("Rut", Session("rut_pro"))
        Cooki.Values.Add("Mail", TextBox3.Text)
        Cooki.Expires = exp
        Response.Cookies.Add(Cooki)
    End Sub




End Class
