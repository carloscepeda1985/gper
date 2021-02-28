Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class ChecklistsAlc
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

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_equipo, fecha, rut_usuario, porcentaje, comentario FROM checklists_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Equipo ", GetType(String))
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
                dt.Columns.Add(" N° Ficha ", GetType(String))
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
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If
        Dim dato As String
        dato = "si"

        Response.Redirect("HomeCheck.aspx?usuario=16199919-9&codigo=MAD231&checked=" + dato)
    End Sub
End Class
