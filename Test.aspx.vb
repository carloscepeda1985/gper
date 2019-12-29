Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml


Partial Class Default_test
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        Sql = "SELECT rut, email, nombre, apellido_p, telefono, departamento, sitio, created_at, status, estado FROM propietario_m where id_condominio = '" & Session("id_con") & "' and deleted = '1'"
        comm = New OdbcCommand(Sql, conn)
        dr = comm.ExecuteReader()
        I = 0


        While (dr.Read())


            If dt.Columns.Count = 0 Then

                dt.Columns.Add("Rut", GetType(String)).ColumnName = "Rut"
                dt.Columns.Add("Email", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Teléfono", GetType(String))
                dt.Columns.Add("Numero Unidad", GetType(String))
                dt.Columns.Add("Sitio/Torre", GetType(String))
                dt.Columns.Add("Fecha Creación", GetType(String))
                dt.Columns.Add("Datos de perfil", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim estado, status As String

            If dr.GetValue(9).ToString() = "1" Then
                estado = "Autorizado"
            Else
                estado = "No Autorizado"
            End If

            If dr.GetValue(8).ToString() = "2" Then
                status = "Perfil Completo"
            Else
                status = "Perfil Incompleto"
            End If


            Dim NewRow As DataRow = dt.NewRow()

            NewRow("Rut") = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString() & " " & dr.GetValue(3).ToString()
            NewRow(3) = dr.GetValue(4).ToString()
            NewRow(4) = dr.GetValue(5).ToString()
            NewRow(5) = dr.GetValue(6).ToString()
            NewRow(6) = dr.GetValue(7).ToString()
            NewRow(7) = status
            NewRow(8) = estado


            dt.Rows.Add(NewRow)

            I = I + 1

        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then

                dt.Columns.Add("Rut", GetType(String)).ColumnName = "Rut"
                dt.Columns.Add("Email", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Teléfono", GetType(String))
                dt.Columns.Add("Numero Unidad", GetType(String))
                dt.Columns.Add("Sitio/Torre", GetType(String))
                dt.Columns.Add("Fecha Creación", GetType(String))
                dt.Columns.Add("Datos de perfil", GetType(String))
                dt.Columns.Add("Estado", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow("Rut") = ""
            NewRow(1) = ""
            NewRow(2) = ""
            NewRow(3) = ""
            NewRow(4) = ""
            NewRow(5) = ""
            NewRow(6) = ""
            NewRow(7) = ""
            NewRow(8) = ""


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

        Dim x As Integer
        Dim dato As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(1).Text

        MsgBox("Rut: " & dato)

    End Sub
End Class
