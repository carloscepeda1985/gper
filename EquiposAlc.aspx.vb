Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class EquiposAlc
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
        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_ficha, tipo, nombre, ubicacion, fecha_instalacion, ultima_mantencion, mantencion_cada, ultimo_checklist, checklist_cada FROM equipos_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Ficha ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Nombre ", GetType(String))
                dt.Columns.Add(" Ubicación ", GetType(String))
                dt.Columns.Add(" Instalación ", GetType(String))
                dt.Columns.Add(" Última Mantencion ", GetType(String))
                dt.Columns.Add(" Mantencion Cada ", GetType(String))
                dt.Columns.Add(" Último Checklist ", GetType(String))
                dt.Columns.Add(" Checklist Cada ", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = dr.GetValue(6).ToString()
            NewRow(7) = dr.GetValue(7).ToString()
            NewRow(8) = dr.GetValue(8).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Equipo ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Nombre ", GetType(String))
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
        Dim dato, ubicacion As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(1).Text
        ubicacion = GridView1.Rows(x).Cells(4).Text

        Response.Redirect("FichaAlc.aspx?dato=" + dato + "&ubicacion=" + ubicacion)
    End Sub
End Class
