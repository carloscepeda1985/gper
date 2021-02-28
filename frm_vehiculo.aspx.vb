Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_vehiculo
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT marca, patente, color, id_tag FROM vehiculo_m where rut_p = '" & Session("rut_pro") & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Patente", GetType(String))
                dt.Columns.Add("Marca", GetType(String))
                dt.Columns.Add("Color", GetType(String))
                dt.Columns.Add("Numero Tag", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Patente", GetType(String))
                dt.Columns.Add("Marca", GetType(String))
                dt.Columns.Add("Color", GetType(String))
                dt.Columns.Add("Numero Tag", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = ""
            NewRow(1) = ""
            NewRow(2) = ""
            NewRow(3) = ""
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
