Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_acceso_propietarios
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm, comm2 As OdbcCommand
    Dim dr, dr2 As OdbcDataReader
    Dim conector As String
    Dim sql, sql2 As String
    Dim I As Integer
    Dim dt As New DataTable()

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dt.Clear()

        Dim nom, ape As String

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"
            conn = New OdbcConnection(conector)
        conn.Open()

        sql = "SELECT * FROM apertura_m where id_condominio = '" & Session("id_con") & "'"
            comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        I = 0
        While (dr.Read())

            sql2 = "SELECT * FROM propietario_m where id_condominio = '" & Session("id_con") & "' and rut='" & dr.GetValue(3).ToString() & "' "
            comm2 = New OdbcCommand(sql2, conn)
            dr2 = comm2.ExecuteReader()

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Nombre ", GetType(String))
                dt.Columns.Add(" Apellido ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
            End If

            If dr2.Read() Then

                nom = dr2.GetValue(5).ToString()
                ape = dr2.GetValue(6).ToString()
            Else
                nom = "Sin Información"
                ape = "Sin Información"
            End If
            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(3).ToString()
            NewRow(1) = dr.GetValue(2).ToString()
            NewRow(2) = nom
            NewRow(3) = ape
            NewRow(4) = dr.GetValue(4).ToString()

            dt.Rows.Add(NewRow)


            I = I + 1
        End While

            If I = 0 Then

                If dt.Columns.Count = 0 Then
                   dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Nombre ", GetType(String))
                dt.Columns.Add(" Apellido ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
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

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        Me.GridView1.PageIndex = e.NewPageIndex
        With Me.GridView1
            .DataSource = dt
            .DataBind()
        End With
    End Sub

 
    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        Dim sb As StringBuilder = New StringBuilder()
        Dim sw As StringWriter = New StringWriter(sb)
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim pagina As Page = New Page
        Dim form = New HtmlForm
        GridView1.EnableViewState = False
        pagina.EnableEventValidation = False
        pagina.DesignerInitialize()
        pagina.Controls.Add(form)
        form.Controls.Add(GridView1)
        pagina.RenderControl(htw)
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("Content-Disposition", "attachment;filename=data.xls")
        Response.Charset = "UTF-8"

        Response.ContentEncoding = Encoding.Default
        Response.Write(sb.ToString())
        Response.End()

    End Sub
End Class
