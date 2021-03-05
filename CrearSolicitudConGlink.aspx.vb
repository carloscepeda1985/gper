Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class CrearSolicitudGper
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Dim conn2 As OdbcConnection
    Dim comm2 As OdbcCommand
    Dim dr2 As OdbcDataReader
    Dim conector2 As String
    Dim sql2 As String
    Dim I2 As Integer
    Dim dt As New DataTable()
    Dim dt2 As New DataTable()

    Protected Sub myBtn_Click(sender As Object, e As System.EventArgs) Handles myBtn.Click

        Dim valores, sql_tra As String

        valores = Mid(Htra.Value, 1, Len(Htra.Value) - 1)

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql_tra = "insert Into trabajador_solicitud(id_mall,id_contratista,id_solicitud,rut,estado) Values" & valores
        comm = New OdbcCommand(sql_tra, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT * FROM encargado_m WHERE rut = '" & Hrutenc.Value & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If dr.Read() Then
            conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector2 += "Database=w230416_glink;User=w230416_glink;"
            conector2 += "Pwd=Gorilla1985;Option=3;"

            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "UPDATE encargado_m SET rut='" & Hrutenc.Value & "',nombre='" & Hnomenc.Value & "',apellido='" & Hapeenc.Value & "',mutual='" & Hmutenc.Value & "',celular='" & Hcelenc.Value & "',email='" & Hemaenc.Value & "'"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()
        Else
            conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector2 += "Database=w230416_glink;User=w230416_glink;"
            conector2 += "Pwd=Gorilla1985;Option=3;"

            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "insert Into encargado_m(rut,nombre,apellido,mutual,celular,email,estado) Values('" & Hrutenc.Value & "','" & Hnomenc.Value & "','" & Hapeenc.Value & "','" & Hmutenc.Value & "','" & Hcelenc.Value & "','" & Hemaenc.Value & "','1')"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()
        End If

        conn2.Close()
        dr2.Close()
        conn.Close()
        dr.Close()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        Dim fecha_ini, fecha_dia, fecha_mes, fecha_ano, fecha_fin As String

        fecha_dia = Mid(Hfecini.Value, 1, 2)
        fecha_mes = Mid(Hfecini.Value, 4, 2)
        fecha_ano = Mid(Hfecini.Value, 7, 4)

        fecha_ini = fecha_mes + "-" + fecha_dia + "-" + fecha_ano

        fecha_dia = Mid(Hfecfin.Value, 1, 2)
        fecha_mes = Mid(Hfecfin.Value, 4, 2)
        fecha_ano = Mid(Hfecfin.Value, 7, 4)

        fecha_fin = fecha_mes + "-" + fecha_dia + "-" + fecha_ano

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE solicitud_m set id_encargado= '" & Hrutenc.Value & "',empresa_contratista='" & Hempcon.Value & "',resumen_trabajo='" & Hrestra.Value & "',lugar='" & Hlug.Value & "',fecha_inicio='" & fecha_ini & "',fecha_fin='" & fecha_fin & "',hora_entrada='" & Hhorent.Value & "',duracion='" & Hdur.Value & "',telefono_emergencia='" & Hteleme.Value & "',email='" & Hema.Value & "', estado='0' WHERE id='" & Label9.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()

        Response.Redirect("SolicitudesConGlink.aspx")

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then

            'Crear Solicitud

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "insert Into solicitud_m(id_mall,id_contratista,fecha_creacion,estado) Values('" & Session("id_mall") & "','" & Session("id_contratista") & "','" & Now() & "','-1')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()

            'Buscar ID

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id FROM solicitud_m ORDER BY id DESC LIMIT 1"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            If dr.Read() Then
                Label9.Text = dr.GetValue(0).ToString()
                LabelIdMall.Text = Session("id_mall")
                LabelIdContratista.Text = Session("id_contratista")
            End If

            conn.Close()
            dr.Close()

            'Buscar Trabajadores

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut,nombre,apellido,telefono,funcion,CDT,CAFP,AFC,INP,CCAF FROM trabajadores_contratista_m where estado = '1' and id_contratista = '" & Session("id_contratista") & "'"
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

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("ConGlink.aspx")
    End Sub
End Class
