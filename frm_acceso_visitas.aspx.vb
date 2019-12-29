Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_acceso_visitas
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Dim dt As New DataTable()

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dt.Clear()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut_p, nombre_p, tipo, registro, rut, nombre, apellido, relacion, departamento, sitio, patente, comentario, fecha, foto FROM ingresos_t where id_condominio = '" & Session("id_con") & "' ORDER BY fecha DESC"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Nombre Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Registro ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Relación ", GetType(String))
                dt.Columns.Add(" Destino ", GetType(String))
                dt.Columns.Add(" Portería ", GetType(String))
                dt.Columns.Add(" Patente ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
            End If


            Dim NewRow As DataRow = dt.NewRow()
            If dr.GetValue(0).ToString() = "0" Then
                NewRow(0) = "Sin Rut"
            Else
                NewRow(0) = dr.GetValue(0).ToString()

            End If

            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = dr.GetValue(6).ToString()
            NewRow(7) = dr.GetValue(7).ToString()
            NewRow(8) = dr.GetValue(8).ToString()
            NewRow(9) = dr.GetValue(9).ToString()
            NewRow(10) = dr.GetValue(10).ToString()
            NewRow(11) = dr.GetValue(11).ToString()
            NewRow(12) = dr.GetValue(12).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Nombre Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Registro ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Relación ", GetType(String))
                dt.Columns.Add(" Destino ", GetType(String))
                dt.Columns.Add(" Portería ", GetType(String))
                dt.Columns.Add(" Patente ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
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

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click


        Dim nada As Date
        Dim fechaenc As String

        Try
            nada = RadDatePicker2.SelectedDate.ToString

            fechaenc = nada.ToString("yyyy-MM-dd")

        Catch ex As Exception

        End Try

        dt.Clear()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut_p, nombre_p, tipo, registro, rut, nombre, apellido, relacion, departamento, sitio, patente, comentario, fecha, foto FROM ingresos_t where id_condominio = '" & Session("id_con") & "' and rut like '%" & numero.Text & "%' and nombre like '%" & TextBox1.Text & "%' and apellido like '%" & TextBox2.Text & "%' and patente like '%" & TextBox3.Text & "%' and departamento like '%" & TextBox4.Text & "%' and fecha like '%" & fechaenc & "%' ORDER BY fecha DESC"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Nombre Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Registro ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Relación ", GetType(String))
                dt.Columns.Add(" Destino ", GetType(String))
                dt.Columns.Add(" Portería ", GetType(String))
                dt.Columns.Add(" Patente ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
            End If


            Dim NewRow As DataRow = dt.NewRow()
            If dr.GetValue(0).ToString() = "0" Then
                NewRow(0) = "Sin Rut"
            Else
                NewRow(0) = dr.GetValue(0).ToString()
            End If
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = dr.GetValue(6).ToString()
            NewRow(7) = dr.GetValue(7).ToString()
            NewRow(8) = dr.GetValue(8).ToString()
            NewRow(9) = dr.GetValue(9).ToString()
            NewRow(10) = dr.GetValue(10).ToString()
            NewRow(11) = dr.GetValue(11).ToString()
            NewRow(12) = dr.GetValue(12).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Nombre Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Registro ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Relación ", GetType(String))
                dt.Columns.Add(" Destino ", GetType(String))
                dt.Columns.Add(" Portería ", GetType(String))
                dt.Columns.Add(" Patente ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
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

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged


        If Session("id_con") = "" Then
            Response.Redirect("Administrador.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim dato1, dato2, link As String



        x = GridView1.SelectedIndex()

        dato1 = GridView1.Rows(x).Cells(5).Text
        dato2 = GridView1.Rows(x).Cells(13).Text

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT foto FROM ingresos_t where id_condominio = '" & Session("id_con") & "' and rut = '" & dato1 & "' and fecha = '" & dato2 & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then
            link = dr.GetValue(0).ToString()
            If link = "" Then
                link = "http://yousoft.cl/fotosaccesos/nodisponible.jpg"
            Else
                link = Replace(link, "ftp://v0081532.ferozo.com/public_html", "http://yousoft.cl")
            End If
        Else
            link = "http://yousoft.cl/fotosaccesos/nodisponible.jpg"
        End If

        Response.Redirect("frm_fotoacceso.aspx?dato=" + link)

    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click


        GridView1.PageSize = 10000

        Dim nada As Date
        Dim fechaenc As String

        Try
            nada = RadDatePicker2.SelectedDate.ToString

            fechaenc = nada.ToString("yyyy-MM-dd")

        Catch ex As Exception

        End Try

        dt.Clear()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut_p, nombre_p, tipo, registro, rut, nombre, apellido, relacion, departamento, sitio, patente, comentario, fecha, foto FROM ingresos_t where id_condominio = '" & Session("id_con") & "' and rut like '%" & numero.Text & "%' and nombre like '%" & TextBox1.Text & "%' and apellido like '%" & TextBox2.Text & "%' and patente like '%" & TextBox3.Text & "%' and departamento like '%" & TextBox4.Text & "%' and fecha like '%" & fechaenc & "%' ORDER BY fecha DESC"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Nombre Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Registro ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Relación ", GetType(String))
                dt.Columns.Add(" Destino ", GetType(String))
                dt.Columns.Add(" Portería ", GetType(String))
                dt.Columns.Add(" Patente ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
            End If


            Dim NewRow As DataRow = dt.NewRow()
            If dr.GetValue(0).ToString() = "0" Then
                NewRow(0) = "Sin Rut"
            Else
                NewRow(0) = dr.GetValue(0).ToString()
            End If
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = dr.GetValue(6).ToString()
            NewRow(7) = dr.GetValue(7).ToString()
            NewRow(8) = dr.GetValue(8).ToString()
            NewRow(9) = dr.GetValue(9).ToString()
            NewRow(10) = dr.GetValue(10).ToString()
            NewRow(11) = dr.GetValue(11).ToString()
            NewRow(12) = dr.GetValue(12).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" Rut Propietario ", GetType(String))
                dt.Columns.Add(" Nombre Propietario ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Registro ", GetType(String))
                dt.Columns.Add(" Rut ", GetType(String))
                dt.Columns.Add(" Nombres ", GetType(String))
                dt.Columns.Add(" Apellidos ", GetType(String))
                dt.Columns.Add(" Relación ", GetType(String))
                dt.Columns.Add(" Destino ", GetType(String))
                dt.Columns.Add(" Portería ", GetType(String))
                dt.Columns.Add(" Patente ", GetType(String))
                dt.Columns.Add(" Comentario ", GetType(String))
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



        '_____________________________________________________


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
        Response.AddHeader("Content-Disposition", "attachment;filename=AccesoVisitas" & Now & ".xls")
        Response.Charset = "UTF-8"

        Response.ContentEncoding = Encoding.Default
        Response.Write(sb.ToString())
        Response.End()

        GridView1.PageSize = 20

    End Sub

   

End Class
