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

        Session("rut_pro") = Request.QueryString("dato")

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, rut, status, email, id_condominio, nombre, apellido_p, departamento, sitio, telefono, clave FROM propietario_m where rut = '" & Session("rut_pro") & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then

            Session("rut_pro") = dr.GetValue(1).ToString()
            Session("mail_pro") = dr.GetValue(3).ToString()
            Session("idcond_pro") = dr.GetValue(4).ToString()
            Session("nombr_pro") = dr.GetValue(5).ToString()
            Session("apelli_pro") = dr.GetValue(6).ToString()
            Session("depto_pro") = dr.GetValue(7).ToString()
            Session("sitio_pro") = dr.GetValue(8).ToString()
            Session("tele_pro") = dr.GetValue(9).ToString()
            Session("clave_pro") = dr.GetValue(10).ToString()
            Session.Timeout = 50

        End If

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

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
        If TextBox6.Text = "" Then
            TextBox6.Focus()
            Exit Sub
        End If

        If TextBox7.Text = "" Then
            TextBox7.Focus()
            Exit Sub
        End If


            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
        sql = "UPDATE propietario_m set nombre = '" & TextBox1.Text & "', apellido_p = '" & TextBox2.Text & "', email = '" & TextBox3.Text & "', telefono = '" & TextBox4.Text & "', sitio = '" & TextBox5.Text & "', departamento = '" & TextBox6.Text & "', clave = '" & TextBox7.Text & "', status = '2', updates = '0' where rut = '" & Session("rut_pro") & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()

            'Acceso Propietarios

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
        sql = "SELECT id, rut, status, email, id_condominio, nombre, apellido_p, departamento, sitio, telefono, clave FROM propietario_m where rut = '" & Session("rut_pro") & "' and email = '" & TextBox3.Text & "' and deleted = '1'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            If (dr.Read()) Then

                Session("rut_pro") = dr.GetValue(1).ToString()
                Session("mail_pro") = dr.GetValue(3).ToString()
                Session("idcond_pro") = dr.GetValue(4).ToString()
                Session("nombr_pro") = dr.GetValue(5).ToString()
                Session("apelli_pro") = dr.GetValue(6).ToString()
                Session("depto_pro") = dr.GetValue(7).ToString()
                Session("sitio_pro") = dr.GetValue(8).ToString()
            Session("tele_pro") = dr.GetValue(9).ToString()
            Session("clave_pro") = dr.GetValue(10).ToString()
                Session.Timeout = 50

            End If

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()


        Response.Redirect("AdmEspacioUrbano.aspx")


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete

        TextBox1.Text = Session("nombr_pro")
        TextBox2.Text = Session("apelli_pro")
        TextBox3.Text = Session("mail_pro")
        TextBox4.Text = Session("tele_pro")
        TextBox5.Text = Session("sitio_pro")
        TextBox6.Text = Session("depto_pro")
        TextBox7.Text = Session("clave_pro")
      
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
