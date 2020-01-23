﻿Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class _Default
    Inherits System.Web.UI.Page

    Dim conn As OdbcConnection
    Dim comm, comm2 As OdbcCommand
    Dim dr, dr2 As OdbcDataReader
    Dim conector As String
    Dim sql, sql2 As String

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If TextBox1.Text = "" Then
            Exit Sub
        End If

        'Acceso Propietarios


        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, rut, status, email, id_condominio, nombre, apellido_p, departamento, sitio, telefono, clave FROM propietario_m where email = '" & TextBox1.Text & "' and clave = '" & TextBox2.Text & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then

            Dim Cooki As HttpCookie = New HttpCookie("YouSoftKey02")
            Dim exp As New Date
            exp = Date.Now
            exp = exp.AddDays(30.0)
            Cooki.Values.Set("Email", TextBox1.Text)
            Cooki.Values.Set("Contraseña", TextBox2.Text)
            Cooki.Expires = exp
            Response.Cookies.Add(Cooki)

            If Label1.Text <> "" Then
                sql2 = "UPDATE propietario_m set imei = '" & Label1.Text & "' where rut = '" & TextBox1.Text & "'"
                comm2 = New OdbcCommand(sql2, conn)
                dr2 = comm2.ExecuteReader()
            End If


            If dr.GetValue(2).ToString() = "1" Then
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
                Response.Redirect("frm_nuevo.aspx")
            Else
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

                Response.Redirect("AdmGper.aspx")


            End If

        Else
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "alertIns", "alert('Rut, Mail o Clave No Coinciden');", True)
            End If

        conn.Close()
        dr.Close()

    End Sub

    Public Sub separa_Rut(ByVal cedula As String)
        Try
            Dim pistola, pr1, pr2, pr3 As String
            Dim larg, larg1 As Integer

            ' se elimina el gion que netraga la cedula nueva y se quita un espacio
            pistola = Replace(cedula, "-", "")
            pistola = Replace(pistola, ".", "")
            larg1 = Len(pistola)

            If larg1 = 9 Or larg1 = 8 Then
                ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                ' rut solo sin digito este valida cuando un rut se ingresa manual
                Dim v1 As Integer
                dv_p = Mid(pistola, Len(pistola), 1) 'extraigo el digito validador
                msRutSinDig = Mid(pistola, 1, Len(pistola) - 1) ' rut sin digito validador y guardo el rut, variable global 
                pr1 = Mid(msRutSinDig, Len(msRutSinDig) - 2, 3) 'rut sin digito, ultimos 3 numeros
                pr2 = Mid(msRutSinDig, Len(msRutSinDig) - 5, 3)
                v1 = Len(pr1) + Len(pr2)
                larg = Len(msRutSinDig) - v1

                If larg = 2 Then
                    pr3 = Mid(msRutSinDig, Len(msRutSinDig) - 7, 2)
                Else
                    pr3 = Mid(msRutSinDig, Len(msRutSinDig) - 6, 1) ' lee rut con 1 digito de inicio
                End If

                ' msApe = "SIN APELLIDO" 'apellido
                ' msRutSinDig = pr3 & pr2 & pr1 'rut sin digito validador
                ' msRut = pr3 & "." & pr2 & "." & pr1 & "-" & valida_cedula(msRutSinDig) 'rut completo con puntuaciones
                mRutguion = pr3 & "" & pr2 & "" & pr1 & "-" & dv_p
                ' dv_p = valida_cedula(msRutSinDig)
                If dv_p <> valida_cedula(msRutSinDig) Then
                    valRutError = False
                Else
                    If IsNumeric(CInt(msRutSinDig)) And Len(msRutSinDig) = 8 Or IsNumeric(CInt(msRutSinDig)) And Len(msRutSinDig) = 7 Then
                        valRutError = True
                    Else
                        valRutError = False
                    End If
                End If
               
            End If

        Catch ex As Exception

        End Try

    End Sub

    Public Function valida_cedula(ByVal cedula As String) As String ' entrega digito validador

        Dim Srut As String
        Dim Factor As Integer
        Dim Suma As Integer
        Dim Rut As Long
        Dim Dv As Integer
        Dim I As Integer
        Dim DVRUT1 As String
        Rut = Val(cedula) 'convierto la cadena a entero
        Srut = Trim(Str(Rut))
        Factor = 2
        Suma = 0
        For I = Len(Srut) To 1 Step -1
            Suma = Suma + Val(Mid$(Srut, I, 1)) * Factor
            Factor = Factor + 1
            If Factor > 7 Then
                Factor = 2
            End If
        Next
        Dv = 11 - Suma Mod 11
        DVRUT1 = Trim(Str(Dv))
        If Dv = 10 Then
            DVRUT1 = "K"
        End If
        If Dv = 11 Then
            DVRUT1 = "0"
        End If
        va = DVRUT1
        Return va
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Label1.Text = Request.QueryString("dato")

        If Not Request.Cookies("YouSoftKey02") Is Nothing Then
            TextBox1.Text = Request.Cookies("YouSoftKey02").Item("Email").ToString.Trim
            TextBox2.Text = Request.Cookies("YouSoftKey02").Item("Contraseña").ToString.Trim

        End If

    End Sub

    Protected Sub TextBox2_TextChanged(sender As Object, e As System.EventArgs) Handles TextBox2.TextChanged

        Dim Cooki As HttpCookie = New HttpCookie("YouSoftKey02")
        Dim exp As New Date
        exp = Date.Now
        exp = exp.AddDays(-60)
        Cooki.Expires = exp
        Response.Cookies.Add(Cooki)

    End Sub

   
End Class
