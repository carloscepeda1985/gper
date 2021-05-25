Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf
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

        If Not Me.IsPostBack Then

            RadDatePicker2.SelectedDate = Date.Today
            Dim dia, mes, ano As String
            dia = Mid(RadDatePicker2.DateInput.Text, 9, 2)
            mes = Mid(RadDatePicker2.DateInput.Text, 6, 2)
            ano = Mid(RadDatePicker2.DateInput.Text, 1, 4)

            RadDatePicker1.SelectedDate = Date.Today
            Dim dia_h, mes_h, ano_h As String
            dia_h = Mid(RadDatePicker1.DateInput.Text, 9, 2)
            mes_h = Mid(RadDatePicker1.DateInput.Text, 6, 2)
            ano_h = Mid(RadDatePicker1.DateInput.Text, 1, 4)


            dt.Clear()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id, id_mall, id_contratista, empresa_contratista, resumen_trabajo, lugar, fecha_inicio, hora_entrada, telefono_emergencia, email, estado FROM solicitud_m where id_mall = '" & Session("idcond_pro") & "' and estado ='1' and fecha_inicio BETWEEN'" & mes & "-" & dia & "-" & ano & "' AND '" & mes_h & "-" & dia_h & "-" & ano_h & "' order by fecha_inicio desc"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            Dim Estado As String

            dt.Columns.AddRange(New DataColumn(8) {New DataColumn("Estado"), New DataColumn("N_Solicitud"), New DataColumn("Empresa"), New DataColumn("Resumen"), New DataColumn("Lugar"), New DataColumn("Fecha Inicio"), New DataColumn("Hora Entrada"), New DataColumn("Telefono"), New DataColumn("Email")})

            While (dr.Read())
                If dr.GetValue(10).ToString() = "0" Then
                    Estado = "M"
                Else
                    If dr.GetValue(10).ToString() = "1" Then
                        Estado = "P"
                    Else
                        Estado = "A"
                    End If
                End If

                dt.Rows.Add(Estado, dr.GetValue(0).ToString(), dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), dr.GetValue(5).ToString(), dr.GetValue(6).ToString(), dr.GetValue(7).ToString(), dr.GetValue(8).ToString(), dr.GetValue(9).ToString())
            End While

            GridView1.DataSource = dt
            GridView1.DataBind()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()

            If GridView1.Rows.Count = 0 Then
                Div1.Visible = True
                Button3.Visible = False
            Else
                Button3.Visible = True
                Div1.Visible = False
            End If

        End If


    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        dt.Clear()

        Dim dia, mes, ano As String
        dia = Mid(RadDatePicker2.DateInput.Text, 9, 2)
        mes = Mid(RadDatePicker2.DateInput.Text, 6, 2)
        ano = Mid(RadDatePicker2.DateInput.Text, 1, 4)

        Dim dia_h, mes_h, ano_h As String
        dia_h = Mid(RadDatePicker1.DateInput.Text, 9, 2)
        mes_h = Mid(RadDatePicker1.DateInput.Text, 6, 2)
        ano_h = Mid(RadDatePicker1.DateInput.Text, 1, 4)


        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, id_mall, id_contratista, empresa_contratista, resumen_trabajo, lugar, fecha_inicio, hora_entrada, telefono_emergencia, email, estado FROM solicitud_m where id_mall = '" & Session("idcond_pro") & "' and estado ='1' and fecha_inicio BETWEEN'" & mes & "-" & dia & "-" & ano & "' AND '" & mes_h & "-" & dia_h & "-" & ano_h & "' order by fecha_inicio desc"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0

        dt.Columns.AddRange(New DataColumn(7) {New DataColumn("N_Solicitud"), New DataColumn("Empresa"), New DataColumn("Resumen"), New DataColumn("Lugar"), New DataColumn("Fecha Inicio"), New DataColumn("Hora Entrada"), New DataColumn("Telefono"), New DataColumn("Email")})

        While (dr.Read())

            dt.Rows.Add(dr.GetValue(0).ToString(), dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), dr.GetValue(5).ToString(), dr.GetValue(6).ToString(), dr.GetValue(7).ToString(), dr.GetValue(8).ToString(), dr.GetValue(9).ToString())
        End While

        GridView1.DataSource = dt
        GridView1.DataBind()

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()
        If GridView1.Rows.Count = 0 Then
            Div1.Visible = True
            Button3.Visible = False
        Else
            Div1.Visible = False
            Button3.Visible = True
        End If

    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If GridView1.Rows.Count > 0 Then
            Using sw As New StringWriter()
                Using hw As New HtmlTextWriter(sw)
                    'To Export all pages
                    GridView1.AllowPaging = False

                    GridView1.RenderControl(hw)
                    Dim sr As New StringReader(sw.ToString())
                    Dim pdfDoc As New Document(PageSize.A2, 10.0F, 10.0F, 10.0F, 0.0F)
                    Dim htmlparser As New HTMLWorker(pdfDoc)
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
                    pdfDoc.Open()
                    htmlparser.Parse(sr)
                    pdfDoc.Close()

                    Response.ContentType = "application/pdf"
                    Response.AddHeader("content-disposition", "attachment;filename=Trabajos_autorizados_del_dia_" & RadDatePicker2.SelectedDate & ".pdf")
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.Write(pdfDoc)
                    Response.[End]()
                End Using
            End Using

        End If

    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered 
    End Sub

End Class
