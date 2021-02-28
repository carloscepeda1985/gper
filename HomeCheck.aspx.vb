Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class HomeCheck

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

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Label6.Text = Request.QueryString("id")
        Label1.Text = Request.QueryString("fecha")
        Label2.Text = Request.QueryString("rut_usuario")
        Label3.Text = Request.QueryString("porcentaje")
        Label9.Text = Request.QueryString("comentario")

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_preguntas, respuesta, comentario, foto FROM respuestas_check where estado = '1' and id_checklists= '" & Label6.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        Dim respuesta As String

        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(1) {New DataColumn("Respuesta"), New DataColumn("Pregunta")})

        While (dr.Read())
            If dr.GetValue(1).ToString() = "0" Then
                respuesta = "A"
            Else
                respuesta = "P"
            End If

            conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector2 += "Database=w230416_glink;User=w230416_glink;"
            conector2 += "Pwd=Gorilla1985;Option=3;"

            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "SELECT pregunta FROM preguntas_check where estado = '1' and id = '" & dr.GetValue(0).ToString() & "'"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()

            If (dr2.Read()) Then

                dt.Rows.Add(respuesta, dr2.GetValue(0).ToString())

            End If

        End While

        GridView1.DataSource = dt
        GridView1.DataBind()

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()




    End Sub


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Request.QueryString("desde") = "ficha" Then
            Response.Redirect("FichaAlc.aspx?id=" & Request.QueryString("id_equipo") & "&tipo=" & Request.QueryString("tipo") & "&ubicacion=" & Request.QueryString("ubicacion") & "&instalacion=" & Request.QueryString("instalacion"))
        Else
            Response.Redirect("ReportesGper.aspx")
        End If

    End Sub
End Class
