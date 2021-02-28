Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class UsuariosAlc
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
        sql = "SELECT id, rut, nombres, apellidos, estado FROM usuario_terreno where id_mall = '" & Session("idcond_pro") & "' and estado = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Id ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Estado ", GetType(String))
            End If

            Dim estado As String

            If dr.GetValue(4).ToString() = "1" Then
                estado = "Vigente"
            Else
                estado = "Eliminado"
            End If


            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = estado
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Id ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Estado ", GetType(String))
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
