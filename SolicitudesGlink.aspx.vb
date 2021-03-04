Imports System.Data
Imports System.Data.Odbc
Partial Class SolicitudesGper
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
    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'ap

    Private Sub SolicitudesGper_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
            sql = "SELECT id, id_mall, id_contratista, empresa_contratista, resumen_trabajo, lugar, fecha_inicio, hora_entrada, telefono_emergencia, email, estado FROM solicitud_m where id_mall = '" & Session("idcond_pro") & "' and estado >='0' order by fecha_inicio desc"
            comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()
                I = 0
            Dim Estado As String

            Dim dt As New DataTable()
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
            End If

    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim dato As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(2).Text

        Response.Redirect("SolicitudGlink.aspx?dato=" + dato)
    End Sub
End Class
