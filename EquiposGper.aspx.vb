Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class EquiposGper
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String

    Dim conn2 As OdbcConnection
    Dim comm2 As OdbcCommand
    Dim dr2 As OdbcDataReader
    Dim conector2 As String
    Dim sql2 As String

    Dim I As Integer

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id,tipo, ubicacion, fecha_instalacion, ultima_mantencion, ultimo_checklist FROM equipos_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Ficha ", GetType(String))
                dt.Columns.Add(" Tipo Equipo ", GetType(String))
                dt.Columns.Add(" Ubicación ", GetType(String))
                dt.Columns.Add(" Instalación ", GetType(String))
                dt.Columns.Add(" Última Mantencion ", GetType(String))
                dt.Columns.Add(" Mantencion Cada ", GetType(String))
                dt.Columns.Add(" Último Checklist ", GetType(String))
                dt.Columns.Add(" Checklist Cada ", GetType(String))
            End If

            conector2 = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector2 += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector2 += "Pwd=90VEporefi;Option=3;"

            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "SELECT des10, des11 FROM ficha_m where estado = '1' and tipo='" & dr.GetValue(1).ToString() & "'"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()

            If dr2.Read() Then

                Dim NewRow As DataRow = dt.NewRow()
                NewRow(0) = dr.GetValue(0).ToString()
                NewRow(1) = dr.GetValue(1).ToString()
                NewRow(2) = dr.GetValue(2).ToString()
                NewRow(3) = dr.GetValue(3).ToString()
                NewRow(4) = dr.GetValue(4).ToString()
                NewRow(5) = dr2.GetValue(0).ToString()
                NewRow(6) = dr.GetValue(5).ToString()
                NewRow(7) = dr2.GetValue(1).ToString()
                dt.Rows.Add(NewRow)

            End If

            conn2.Close()
            dr2.Close()
            comm2.Dispose()
            conn2.Dispose()

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Equipo ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Ubicación ", GetType(String))
                dt.Columns.Add(" Instalación ", GetType(String))
                dt.Columns.Add(" Última Mantencion ", GetType(String))
                dt.Columns.Add(" Mantencion Cada ", GetType(String))
                dt.Columns.Add(" Último Checklist ", GetType(String))
                dt.Columns.Add(" Checklist Cada ", GetType(String))
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

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim id, tipo, ubicacion, instalacion As String

        x = GridView1.SelectedIndex()

        id = GridView1.Rows(x).Cells(1).Text
        tipo = GridView1.Rows(x).Cells(2).Text
        ubicacion = GridView1.Rows(x).Cells(3).Text
        instalacion = GridView1.Rows(x).Cells(4).Text
        Response.Redirect("FichaAlc.aspx?id=" & id & "&tipo=" & tipo & "&ubicacion=" & ubicacion & "&instalacion=" & instalacion)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        If DropDownList1.SelectedValue = "" Then
            DropDownList1.Focus()
            Exit Sub
        End If
        If TextBox4.Text = "" Then
            TextBox4.Focus()
            Exit Sub
        End If
        If RadDatePicker2.SelectedDate.ToString() = "" Then
            RadDatePicker2.Focus()
        End If

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "insert Into equipos_m(id_mall,tipo,foto,ubicacion,fecha_instalacion,ultima_mantencion,ultimo_checklist,estado) Values('" & Session("idcond_pro") & "','" & DropDownList1.SelectedValue.ToString() & "','no','" & TextBox4.Text & "','" & RadDatePicker2.SelectedDate.ToString() & "','','','1')"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()

        Response.Redirect("EquiposGper.aspx")

    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id,tipo, ubicacion, fecha_instalacion, ultima_mantencion, ultimo_checklist FROM equipos_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1' and ubicacion Like '%" & TextBox5.Text & "%'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Ficha ", GetType(String))
                dt.Columns.Add(" Tipo Equipo ", GetType(String))
                dt.Columns.Add(" Ubicación ", GetType(String))
                dt.Columns.Add(" Instalación ", GetType(String))
                dt.Columns.Add(" Última Mantencion ", GetType(String))
                dt.Columns.Add(" Mantencion Cada ", GetType(String))
                dt.Columns.Add(" Último Checklist ", GetType(String))
                dt.Columns.Add(" Checklist Cada ", GetType(String))
            End If

            conector2 = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector2 += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector2 += "Pwd=90VEporefi;Option=3;"

            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "SELECT des10, des11 FROM ficha_m where estado = '1' and tipo='" & dr.GetValue(1).ToString() & "'"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()

            If dr2.Read() Then

                Dim NewRow As DataRow = dt.NewRow()
                NewRow(0) = dr.GetValue(0).ToString()
                NewRow(1) = dr.GetValue(1).ToString()
                NewRow(2) = dr.GetValue(2).ToString()
                NewRow(3) = dr.GetValue(3).ToString()
                NewRow(4) = dr.GetValue(4).ToString()
                NewRow(5) = dr2.GetValue(0).ToString()
                NewRow(6) = dr.GetValue(5).ToString()
                NewRow(7) = dr2.GetValue(1).ToString()
                dt.Rows.Add(NewRow)

            End If

            conn2.Close()
            dr2.Close()
            comm2.Dispose()
            conn2.Dispose()

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Equipo ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Ubicación ", GetType(String))
                dt.Columns.Add(" Instalación ", GetType(String))
                dt.Columns.Add(" Última Mantencion ", GetType(String))
                dt.Columns.Add(" Mantencion Cada ", GetType(String))
                dt.Columns.Add(" Último Checklist ", GetType(String))
                dt.Columns.Add(" Checklist Cada ", GetType(String))
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
    End Sub
End Class
