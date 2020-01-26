Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class SolicitudGper
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

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

   
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

        '____________________________________________________________-


        conector2 = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector2 += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector2 += "Pwd=90VEporefi;Option=3;"

        conn2 = New OdbcConnection(conector2)
        conn2.Open()
        sql2 = "SELECT id_equipo, fecha, rut_empresa, nombre_empresa, tipo, SUBSTR( descripcion, 1, 20 ) FROM mantenciones_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1' ORDER BY fecha DESC"
        comm2 = New OdbcCommand(sql2, conn2)
        dr2 = comm2.ExecuteReader()
        I2 = 0
        While (dr2.Read())

            If dt2.Columns.Count = 0 Then
                dt2.Columns.Add(" Fecha ", GetType(String))
                dt2.Columns.Add(" Rut ", GetType(String))
                dt2.Columns.Add(" Nombre  ", GetType(String))
                dt2.Columns.Add(" Apellido ", GetType(String))
                dt2.Columns.Add(" Estado ", GetType(String))
            End If


            Dim NewRow As DataRow = dt2.NewRow()
            NewRow(0) = dr2.GetValue(0).ToString()
            NewRow(1) = dr2.GetValue(1).ToString()
            NewRow(2) = dr2.GetValue(2).ToString()
            NewRow(3) = dr2.GetValue(3).ToString()
            NewRow(4) = dr2.GetValue(4).ToString()
            NewRow(5) = dr2.GetValue(5).ToString() & "..."
            dt2.Rows.Add(NewRow)

            I2 = I2 + 1
        End While

        If I2 = 0 Then

            If dt2.Columns.Count = 0 Then
                dt2.Columns.Add(" Fecha ", GetType(String))
                dt2.Columns.Add(" Rut ", GetType(String))
                dt2.Columns.Add(" Nombre  ", GetType(String))
                dt2.Columns.Add(" Apellido ", GetType(String))
                dt2.Columns.Add(" Estado ", GetType(String))
            End If

            Dim NewRow As DataRow = dt2.NewRow()

            dt2.Rows.Add(NewRow)
            GridView2.DataSource = dt2
            GridView2.DataBind()


        Else
            GridView2.DataSource = dt2
            GridView2.DataBind()



        End If


        conn2.Close()
        dr2.Close()
        comm2.Dispose()
        conn2.Dispose()





    End Sub
End Class
