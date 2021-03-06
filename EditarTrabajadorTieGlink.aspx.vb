﻿Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class EditarTrabajadorContratista
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        If (IsPostBack = False) Then

            TextBox8.Text = Request.QueryString("dato")

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut,nombre,apellido,telefono,direccion,funcion,empresa FROM trabajadores_tienda_m where rut = '" & Request.QueryString("dato") & "' and deleted = '1' and id_contratista='" & Session("id_contratista") & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            If (dr.Read()) Then

                TextBox1.Text = dr.GetValue(1).ToString()
                TextBox2.Text = dr.GetValue(2).ToString()
                TextBox3.Text = dr.GetValue(3).ToString()
                TextBox6.Text = dr.GetValue(4).ToString()
                TextBox4.Text = dr.GetValue(5).ToString()
                TextBox5.Text = dr.GetValue(6).ToString()

            End If

            conn.Close()
            dr.Close()
            dt.Clear()
            comm.Dispose()
            conn.Dispose()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT CDT,CAFP,AFC,INP,CCAF FROM trabajadores_tienda_m where rut = '" & Request.QueryString("dato") & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            Dim Estado As String

            dt.Columns.AddRange(New DataColumn(2) {New DataColumn("Estado"), New DataColumn("Codigo"), New DataColumn("Detalle")})

            While (dr.Read())
                If dr.GetValue(0).ToString() = "no" Then
                    Estado = "A"
                    dt.Rows.Add(Estado, "CDT", "Contrato de Trabajo Vigente")
                Else
                    Estado = "P"
                    dt.Rows.Add(Estado, "CDT", "Contrato de Trabajo Vigente")
                End If

                If dr.GetValue(1).ToString() = "no" Then
                    Estado = "A"
                    dt.Rows.Add(Estado, "CAFP", "Planillas de cotización de las distintas AFPs")
                Else
                    Estado = "P"
                    dt.Rows.Add(Estado, "CAFP", "Planillas de cotización de las distintas AFPs")
                End If

                If dr.GetValue(2).ToString() = "no" Then
                    Estado = "A"
                    dt.Rows.Add(Estado, "AFC", "Planillas de cotización del Seguro de Cesantía AFC")
                Else
                    Estado = "P"
                    dt.Rows.Add(Estado, "AFC", "Planillas de cotización del Seguro de Cesantía AFC")
                End If

                If dr.GetValue(3).ToString() = "no" Then
                    Estado = "A"
                    dt.Rows.Add(Estado, "INP", "Planillas de cotización del INP")
                Else
                    Estado = "P"
                    dt.Rows.Add(Estado, "INP", "Planillas de cotización del INP")
                End If

                If dr.GetValue(4).ToString() = "no" Then
                    Estado = "A"
                    dt.Rows.Add(Estado, "CCAF", "Planillas de cotización de la respectiva C.C.A.F, si procede")
                Else
                    Estado = "P"
                    dt.Rows.Add(Estado, "CCAF", "Planillas de cotización de la respectiva C.C.A.F, si procede")
                End If
            End While

            GridView1.DataSource = dt
            GridView1.DataBind()

            conn.Close()
            dr.Close()
            dt.Clear()
            comm.Dispose()
            conn.Dispose()

        End If
    End Sub
    Private Sub Submit6_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Submit6.ServerClick

        If Not File6.PostedFile Is Nothing And File6.PostedFile.ContentLength > 0 Then

            Dim fn As String = System.IO.Path.GetExtension(File6.PostedFile.FileName)
            System.IO.Directory.CreateDirectory(Server.MapPath("Data\" & Request.QueryString("dato") & "\Doc\"))
            Dim SaveLocation As String = Server.MapPath("Data") & "\" & Request.QueryString("dato") & "\Doc\CDT" & fn
            Try
                File6.PostedFile.SaveAs(SaveLocation)

                'Response.Write("The file has been uploaded.")

                conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "Update trabajadores_tienda_m Set CDT='CDT" & fn & "' Where rut='" & Request.QueryString("dato") & "'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                conn.Close()
                dr.Close()

                ' Response.Redirect("EditarTrabajadorTieGlink.aspx?dato=" + Request.QueryString("dato"))

                Dim datoTrabajador = Request.QueryString("dato")
                Dim textoFinal = datoTrabajador

                'https://lipis.github.io/bootstrap-sweetalert/
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert2('" & textoFinal & "','El archivo ha sido guardado correctamente');", True)


            Catch Exc As Exception
                Response.Write("Error: " & Exc.Message)
            End Try
        Else
            'Response.Write("Please select a file to upload.")
            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)
        End If

    End Sub

    Protected Sub Submit7_ServerClick(sender As Object, e As System.EventArgs) Handles Submit7.ServerClick
        If Not File7.PostedFile Is Nothing And File7.PostedFile.ContentLength > 0 Then

            Dim fn As String = System.IO.Path.GetExtension(File7.PostedFile.FileName)
            System.IO.Directory.CreateDirectory(Server.MapPath("Data\" & Request.QueryString("dato") & "\Doc\"))
            Dim SaveLocation As String = Server.MapPath("Data") & "\" & Request.QueryString("dato") & "\Doc\CAFP" & fn
            Try
                File7.PostedFile.SaveAs(SaveLocation)
                ' Response.Write("The file has been uploaded.")

                conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "Update trabajadores_tienda_m Set CAFP='CAFP" & fn & "' Where rut='" & Request.QueryString("dato") & "'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                conn.Close()
                dr.Close()
                'Response.Redirect("EditarTrabajadorTieGlink.aspx?dato=" + Request.QueryString("dato"))
                Dim datoTrabajador = Request.QueryString("dato")
                Dim textoFinal = datoTrabajador

                'https://lipis.github.io/bootstrap-sweetalert/
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert2('" & textoFinal & "','El archivo ha sido guardado correctamente');", True)

            Catch Exc As Exception
                Response.Write("Error: " & Exc.Message)
            End Try
        Else
            'Response.Write("Please select a file to upload.")
            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        Response.Redirect("TrabajadoresTieGlink.aspx?rut=" & Request.QueryString("rut"))

    End Sub


    Protected Sub Submit8_ServerClick(sender As Object, e As System.EventArgs) Handles Submit8.ServerClick
        If Not File8.PostedFile Is Nothing And File8.PostedFile.ContentLength > 0 Then

            Dim fn As String = System.IO.Path.GetExtension(File8.PostedFile.FileName)
            System.IO.Directory.CreateDirectory(Server.MapPath("Data\" & Request.QueryString("dato") & "\Doc\"))
            Dim SaveLocation As String = Server.MapPath("Data") & "\" & Request.QueryString("dato") & "\Doc\AFC" & fn
            Try
                File8.PostedFile.SaveAs(SaveLocation)
                ' Response.Write("The file has been uploaded.")

                conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "Update trabajadores_tienda_m Set AFC='AFC" & fn & "' Where rut='" & Request.QueryString("dato") & "'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                conn.Close()
                dr.Close()
                'Response.Redirect("EditarTrabajadorTieGlink.aspx?dato=" + Request.QueryString("dato"))
                Dim datoTrabajador = Request.QueryString("dato")
                Dim textoFinal = datoTrabajador

                'https://lipis.github.io/bootstrap-sweetalert/
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert2('" & textoFinal & "','El archivo ha sido guardado correctamente');", True)

            Catch Exc As Exception
                Response.Write("Error: " & Exc.Message)
            End Try
        Else
            'Response.Write("Please select a file to upload.")
            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)
        End If
    End Sub

    Protected Sub Submit9_ServerClick(sender As Object, e As System.EventArgs) Handles Submit9.ServerClick
        If Not File9.PostedFile Is Nothing And File9.PostedFile.ContentLength > 0 Then

            Dim fn As String = System.IO.Path.GetExtension(File9.PostedFile.FileName)
            System.IO.Directory.CreateDirectory(Server.MapPath("Data\" & Request.QueryString("dato") & "\Doc\"))
            Dim SaveLocation As String = Server.MapPath("Data") & "\" & Request.QueryString("dato") & "\Doc\INP" & fn
            Try
                File9.PostedFile.SaveAs(SaveLocation)
                'Response.Write("The file has been uploaded.")

                conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "Update trabajadores_tienda_m Set INP='INP" & fn & "' Where rut='" & Request.QueryString("dato") & "'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                conn.Close()
                dr.Close()

                'Response.Redirect("EditarTrabajadorTieGlink.aspx?dato=" + Request.QueryString("dato"))
                Dim datoTrabajador = Request.QueryString("dato")
                Dim textoFinal = datoTrabajador

                'https://lipis.github.io/bootstrap-sweetalert/
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert2('" & textoFinal & "','El archivo ha sido guardado correctamente');", True)
            Catch Exc As Exception
                Response.Write("Error: " & Exc.Message)
            End Try
        Else
            'Response.Write("Please select a file to upload.")
            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)
        End If
    End Sub

    Protected Sub Submit10_ServerClick(sender As Object, e As System.EventArgs) Handles Submit10.ServerClick
        If Not File10.PostedFile Is Nothing And File10.PostedFile.ContentLength > 0 Then

            Dim fn As String = System.IO.Path.GetExtension(File10.PostedFile.FileName)
            System.IO.Directory.CreateDirectory(Server.MapPath("Data\" & Request.QueryString("dato") & "\Doc\"))
            Dim SaveLocation As String = Server.MapPath("Data") & "\" & Request.QueryString("dato") & "\Doc\CCAF" & fn
            Try
                File10.PostedFile.SaveAs(SaveLocation)
                ' Response.Write("The file has been uploaded.")

                conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "Update trabajadores_tienda_m Set CCAF='CCAF" & fn & "' Where rut='" & Request.QueryString("dato") & "'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                conn.Close()
                dr.Close()

                'Response.Redirect("EditarTrabajadorTieGlink.aspx?dato=" + Request.QueryString("dato"))
                Dim datoTrabajador = Request.QueryString("dato")
                Dim textoFinal = datoTrabajador

                'https://lipis.github.io/bootstrap-sweetalert/
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert2('" & textoFinal & "','El archivo ha sido guardado correctamente');", True)
            Catch Exc As Exception
                Response.Write("Error: " & Exc.Message)
            End Try
        Else
            'Response.Write("Please select a file to upload.")
            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert();", True)
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_contratista") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim codigo As String

        x = GridView1.SelectedIndex()

        codigo = GridView1.Rows(x).Cells(2).Text

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT " & codigo & " FROM trabajadores_tienda_m where rut = '" & Request.QueryString("dato") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0

        While (dr.Read())
            If dr.GetValue(0).ToString() <> "no" Then
                Dim urldoc As String
                urldoc = "https://glink.cl/login/Data/" & Request.QueryString("dato") & "/Doc/" & dr.GetValue(0).ToString()
                Response.Write("<script>window.open('" & urldoc & "','_blank');</script>")
            End If

        End While


        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "Update trabajadores_tienda_m Set nombre='" & TextBox1.Text() & "', apellido='" & TextBox2.Text() & "',telefono='" & TextBox3.Text() & "',direccion='" & TextBox6.Text() & "', funcion='" & TextBox4.Text() & "', empresa='" & TextBox5.Text() & "' Where rut='" & Request.QueryString("dato") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()

        'Response.Redirect("EditarTrabajadorTieGlink.aspx?dato=" + Request.QueryString("dato"))
        Dim datoTrabajador = Request.QueryString("dato")
        Dim textoFinal = datoTrabajador

        'https://lipis.github.io/bootstrap-sweetalert/
        ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "successalert2('" & textoFinal & "','Los cambios han sido guardados correctamente');", True)
    End Sub
End Class
