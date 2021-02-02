Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class ReportesGper
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
        sql = "SELECT id, fecha, rut_usuario, porcentaje, comentario FROM checklists_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" ID ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
                dt.Columns.Add(" Rut Usuario ", GetType(String))
                dt.Columns.Add(" Porcentaje ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" ID ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
                dt.Columns.Add(" Rut Usuario ", GetType(String))
                dt.Columns.Add(" Porcentaje ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()

            dt.Rows.Add(NewRow)
            GridView1.DataSource = dt
            GridView1.DataBind()
        Else
            GridView1.DataSource = dt
            GridView1.DataBind()

        End If

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

        '_________________________________________________________-


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
                dt2.Columns.Add(" N° Equipo ", GetType(String))
                dt2.Columns.Add(" Fecha ", GetType(String))
                dt2.Columns.Add(" Rut Empresa ", GetType(String))
                dt2.Columns.Add(" Nombre Empresa ", GetType(String))
                dt2.Columns.Add(" Tipo ", GetType(String))
                dt2.Columns.Add(" Descripción ", GetType(String))
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
                dt2.Columns.Add(" N° Equipo ", GetType(String))
                dt2.Columns.Add(" Fecha ", GetType(String))
                dt2.Columns.Add(" Rut Empresa ", GetType(String))
                dt2.Columns.Add(" Nombre Empresa ", GetType(String))
                dt2.Columns.Add(" Tipo ", GetType(String))
                dt2.Columns.Add(" Descripción ", GetType(String))
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

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim id, fecha, rut_usuario, porcentaje, comentario As String

        x = GridView1.SelectedIndex()

        id = GridView1.Rows(x).Cells(1).Text
        fecha = GridView1.Rows(x).Cells(2).Text
        rut_usuario = GridView1.Rows(x).Cells(3).Text
        porcentaje = GridView1.Rows(x).Cells(4).Text
        comentario = GridView1.Rows(x).Cells(5).Text

        Response.Redirect("HomeCheck.aspx?id=" + id + "&fecha=" + fecha + "&rut_usuario=" + rut_usuario + "&porcentaje=" + porcentaje + "&comentario=" + comentario)
    End Sub


End Class
