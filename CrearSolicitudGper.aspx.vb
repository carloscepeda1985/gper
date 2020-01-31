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



        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "insert Into solicitud_m(id_mall,id_contratista,id_encargado,empresa_contratista,resumen_trabajo,lugar,fecha_inicio,fecha_fin,hora_entrada,duracion,telefono_emergencia,email,estado) Values('" & Session("idcond_pro") & "','1','1','" & Hempcon.Value & "','" & Hrestra.Value & "','" & Hlug.Value & "','" & Hfecini.Value & "','" & Hfecfin.Value & "','" & Hhorent.Value & "','" & Hdur.Value & "','" & Hteleme.Value & "','" & Hema.Value & "','0')"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()

        Response.Redirect("SolicitudGper.aspx")


    End Sub


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut,nombre,apellido,telefono,funcion,CDT,CAFP,AFC,INP,CCAF FROM trabajadores_m where estado = '1' and id_condominio='1'"
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

    End Sub
End Class
