﻿Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class FichaContratista
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Label10.Text = Request.QueryString("nombre")
            Label1.Text = Request.QueryString("rut")
            Label2.Text = Request.QueryString("contacto")
            Label3.Text = Request.QueryString("telefono")
            Label4.Text = Request.QueryString("email")

            TextBox8.Text = Request.QueryString("nombre")

            If Request.QueryString("nombre") = "Calderas Anwo" Then
                Image1.ImageUrl = "anwo_logo.png"
            Else
                If Request.QueryString("nombre") = "Ascensores Schindler" Then
                    Image1.ImageUrl = "logo_schindler.png"
                Else
                    Image1.ImageUrl = "default_logo.png"
                End If
            End If
            





            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut,nombre,apellido,telefono,funcion,CDT,CAFP,AFC,INP,CCAF FROM trabajadores_contratista_m where estado = '1'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            Dim CDT, CAFP, AFC, INP, CCAF As String

            Dim dt As New DataTable()
            dt.Columns.AddRange(New DataColumn(9) {New DataColumn("Rut"), New DataColumn("Nombre"), New DataColumn("Apellido"), New DataColumn("Numero"), New DataColumn("Cargo"), New DataColumn("CDT"), New DataColumn("CAFP"), New DataColumn("AFC"), New DataColumn("INP"), New DataColumn("CCAF")})

            While (dr.Read())
                If dr.GetValue(5).ToString() = "no" Then
                    CDT = "A"
                Else
                    CDT = "P"
                End If
                If dr.GetValue(6).ToString() = "no" Then
                    CAFP = "A"
                Else
                    CAFP = "P"
                End If
                If dr.GetValue(7).ToString() = "no" Then
                    AFC = "A"
                Else
                    AFC = "P"
                End If
                If dr.GetValue(8).ToString() = "no" Then
                    INP = "A"
                Else
                    INP = "P"
                End If
                If dr.GetValue(9).ToString() = "no" Then
                    CCAF = "A"
                Else
                    CCAF = "P"
                End If

                dt.Rows.Add(dr.GetValue(0).ToString(), dr.GetValue(1).ToString(), dr.GetValue(2).ToString(), dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), CDT, CAFP, AFC, INP, CCAF)
            End While

            GridView1.DataSource = dt
            GridView1.DataBind()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()


        End If

    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim dato As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(1).Text

        Response.Redirect("Editar_TrabajadorGper.aspx?dato=" + dato + "&desde=ficha" + "&nombre=" + Request.QueryString("nombre") + "&rut=" + Request.QueryString("rut") + "&contacto=" + Request.QueryString("contacto") + "&telefono=" + Request.QueryString("telefono") + "&email=" + Request.QueryString("email"))
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Response.Redirect("ContratistasGper.aspx")
    End Sub
End Class