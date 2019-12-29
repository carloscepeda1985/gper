Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_menuprincipal
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm, comm2 As OdbcCommand
    Dim dr, dr2 As OdbcDataReader
    Dim conector As String
    Dim sql, sql2 As String
    Dim apertura, boton As String


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Response.Redirect("frm_familia.aspx")
       
    End Sub

    Protected Sub Page_Error(sender As Object, e As System.EventArgs) Handles Me.Error
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()

        sql2 = "SELECT apertura, boton FROM users_m where id = '" & Session("idcond_pro") & "'"
        comm2 = New OdbcCommand(sql2, conn)
        dr2 = comm2.ExecuteReader()

        If (dr2.Read()) Then

            apertura = dr2.GetValue(0).ToString()
            boton = dr2.GetValue(1).ToString()

            If apertura = "no" Then
                Button4.Visible = False
                Button5.Visible = False
            End If

            If boton = "no" Then
                Button6.Visible = False
            End If

        End If

        conn.Close()
        dr2.Close()
        comm2.Dispose()
        conn.Dispose()

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT nombre,nombre_admin,telefono_admin,rut_cond,ctc_condominio,mail_cond FROM users_m where id = '" & Session("idcond_pro") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then

            Label1.Text = dr.GetValue(0).ToString()
            Label2.Text = dr.GetValue(1).ToString()
            Label3.Text = dr.GetValue(2).ToString()
            Label4.Text = dr.GetValue(5).ToString()
            Label5.Text = dr.GetValue(3).ToString()
            Label6.Text = dr.GetValue(4).ToString()
            Label7.Text = Session("nombr_pro")
            Label8.Text = Session("apelli_pro")
            Label9.Text = Session("mail_pro")
            Label10.Text = Session("tele_pro")
            Label11.Text = Session("sitio_pro")
            Label12.Text = Session("depto_pro")

        End If

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()
       

    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Response.Redirect("frm_nuevo.aspx")
       
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Response.Redirect("frm_acceso_personas.aspx")
       
    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
    
            If Session("rut_pro") = "" Then
                Response.Redirect("Default.aspx")
                Exit Sub
            End If



            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "Insert Into apertura_m(id_condominio, tipo, rut, fecha, updates) Values('" & Session("idcond_pro") & "','Entrada','" & Session("rut_pro") & "','" & Now & "','0')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()

        Response.Redirect("frm_apertura_exitosa.aspx")

    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If


        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "Insert Into apertura_m(id_condominio, tipo, rut, fecha, updates) Values('" & Session("idcond_pro") & "','Salida','" & Session("rut_pro") & "','" & Now & "','0')"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()

       Response.Redirect("frm_apertura_exitosa.aspx")
       
    End Sub

    Protected Sub Button6_Click(sender As Object, e As System.EventArgs) Handles Button6.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If


        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "Insert Into boton_m(id_condominio, tipo, rut, fecha, updates) Values('" & Session("idcond_pro") & "','Alerta Emergencia','" & Session("rut_pro") & "','" & Now & "','0')"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()

        Response.Redirect("frm_apertura_exitosa.aspx")

    End Sub
End Class
