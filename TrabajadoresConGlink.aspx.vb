﻿Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class TrabajadoresCon
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Dim dt As New DataTable()

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dt.Clear()
        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
        sql = "SELECT rut,nombre,apellido,telefono,direccion,funcion,CDT,CAFP,AFC,INP,CCAF FROM trabajadores_contratista_m where estado = '1' and id_contratista='" & Session("id_contratista") & "'"
        comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            Dim CDT, CAFP, AFC, INP, CCAF As String


        dt.Columns.AddRange(New DataColumn(10) {New DataColumn("Rut"), New DataColumn("Nombre"), New DataColumn("Apellido"), New DataColumn("Numero"), New DataColumn("Direc"), New DataColumn("Cargo"), New DataColumn("CDT"), New DataColumn("CAFP"), New DataColumn("AFC"), New DataColumn("INP"), New DataColumn("CCAF")})

        While (dr.Read())
            If dr.GetValue(6).ToString() = "no" Then
                CDT = "A"
            Else
                CDT = "P"
            End If
            If dr.GetValue(7).ToString() = "no" Then
                CAFP = "A"
            Else
                CAFP = "P"
            End If
            If dr.GetValue(8).ToString() = "no" Then
                AFC = "A"
            Else
                AFC = "P"
            End If
            If dr.GetValue(9).ToString() = "no" Then
                INP = "A"
            Else
                INP = "P"
            End If
            If dr.GetValue(10).ToString() = "no" Then
                CCAF = "A"
            Else
                CCAF = "P"
            End If

            dt.Rows.Add(dr.GetValue(0).ToString(), dr.GetValue(1).ToString(), dr.GetValue(2).ToString(), dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), dr.GetValue(5).ToString(), CDT, CAFP, AFC, INP, CCAF)
        End While

        GridView1.DataSource = dt
            GridView1.DataBind()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()



    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("id_mall") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim dato As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(1).Text

        Response.Redirect("EditarTrabajadorConGlink.aspx?dato=" + dato)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Session("id_mall") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        If TextBox6.Text = "" Then
            Exit Sub
        End If

        separa_Rut(TextBox6.Text)

        If valRutError = False Then
            TextBox6.Focus()
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "alertIns", "alert('El Rut Ingresado no es Válido');", True)
            Exit Sub
        Else
            TextBox6.Text = mRutguion

            If TextBox6.Text = "" Then
                TextBox6.Focus()
                Exit Sub
            Else
                If TextBox2.Text = "" Then
                    TextBox2.Focus()
                    Exit Sub
                Else
                    If TextBox3.Text = "" Then
                        TextBox3.Focus()
                        Exit Sub
                    Else
                        If TextBox4.Text = "" Then
                            TextBox4.Focus()
                            Exit Sub
                        Else
                            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                            conector += "Database=w230416_glink;User=w230416_glink;"
                            conector += "Pwd=Gorilla1985;Option=3;"

                            conn = New OdbcConnection(conector)
                            conn.Open()
                            sql = "insert Into trabajadores_contratista_m(id_condominio, id_contratista, rut, nombre, apellido, telefono, direccion, funcion, empresa, CDT, CAFP, AFC, INP, CCAF, estado, updates, deleted) Values('" & Session("id_mall") & "','" & Session("id_contratista") & "','" & TextBox6.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & TextBox1.Text & "','" & TextBox7.Text & "','" & TextBox8.Text & "','no','no','no','no','no','1','2','1')"
                            comm = New OdbcCommand(sql, conn)
                            dr = comm.ExecuteReader()

                            conn.Close()
                            dr.Close()

                            'Response.Redirect("TrabajadoresConGlink.aspx?rut=" & Request.QueryString("rut"))
                            ' Response.Redirect("TrabajadoresTieGlink.aspx?rut=" & Request.QueryString("rut"))
                            'https://lipis.github.io/bootstrap-sweetalert/
                            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)
                        End If
                    End If
                End If
            End If
        End If
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

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        dt.Clear()
        GridView1.DataSource = dt

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut,nombre,apellido,telefono,direccion,funcion,CDT,CAFP,AFC,INP,CCAF FROM trabajadores_contratista_m where estado = '1' and id_contratista='" & Session("id_contratista") & "' and nombre Like '%" & TextBox5.Text & "%'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        Dim CDT, CAFP, AFC, INP, CCAF As String


        While (dr.Read())
            If dr.GetValue(6).ToString() = "no" Then
                CDT = "A"
            Else
                CDT = "P"
            End If
            If dr.GetValue(7).ToString() = "no" Then
                CAFP = "A"
            Else
                CAFP = "P"
            End If
            If dr.GetValue(8).ToString() = "no" Then
                AFC = "A"
            Else
                AFC = "P"
            End If
            If dr.GetValue(9).ToString() = "no" Then
                INP = "A"
            Else
                INP = "P"
            End If
            If dr.GetValue(10).ToString() = "no" Then
                CCAF = "A"
            Else
                CCAF = "P"
            End If

            dt.Rows.Add(dr.GetValue(0).ToString(), dr.GetValue(1).ToString(), dr.GetValue(2).ToString(), dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), dr.GetValue(5).ToString(), CDT, CAFP, AFC, INP, CCAF)
        End While

        GridView1.DataSource = dt
        GridView1.DataBind()

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

    End Sub
    Protected Sub GridView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging

        Me.GridView1.PageIndex = e.NewPageIndex
        With Me.GridView1
            .DataSource = dt
            .DataBind()
        End With

    End Sub

End Class
