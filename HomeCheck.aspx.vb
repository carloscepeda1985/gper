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

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Label1.Text = Request.QueryString("codigo")
        Label2.Text = Request.QueryString("usuario")
        If Request.QueryString("checked") = "si" Then
            cblItem.Items.FindByText("El extintor tiene el número clave/código de identificación").Selected = True
            cblItem.Items.FindByText("El extintor está ubicado en el lugar designado y en posición correcta").Selected = True
            cblItem.Items.FindByText("El extintor se encuentra claramente visible").Selected = True
            cblItem.Items.FindByText("El acceso al extintor NO se encuentra obstruido").Selected = True
            cblItem.Items.FindByText("El soporte del extintor está en buenas condiciones").Selected = True
            cblItem.Items.FindByText("NO se observan signos o señales de corrosión").Selected = True
            cblItem.Items.FindByText("NO se observan desperfectos debido a fugas o filtraciones").Selected = True
            cblItem.Items.FindByText("NO hay evidencia de daños y averías mecánicas").Selected = True
            cblItem.Items.FindByText("El conjunto manguera y acoples está en buenas condiciones").Selected = True
            cblItem.Items.FindByText("La boquilla de descarga está en buenas condiciones").Selected = True
            cblItem.Items.FindByText("La palanca de descarga está en buenas condiciones").Selected = True
            cblItem.Items.FindByText("El mango o manija de transporte está en buenas condiciones").Selected = True
            cblItem.Items.FindByText("Tiene visibles y legibles las marcas y etiqueta de identificación y placa de instrucciones").Selected = True
            cblItem.Items.FindByText("Tiene visible y legibles la etiqueta de última revisión de Servicio Técnico / mantención según Decreto Nº 369 y la etiqueta de control de inspección visual").Selected = True
            Button1.Visible = False
            Button2.Visible = False
            Button3.Visible = True
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "Insert into checklists_m(id_mall, id_equipo, fecha, rut_usuario, porcentaje, comentario, link_foto, estado) Values('1','" & Label1.Text & "','" & Now.Day & "/" & Now.Month & "/" & Now.Year & "', '" & Label2.Text & "', '100', 'OK', '', '1')"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If
        Response.Redirect("Default2.aspx")

    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If
        If Request.QueryString("desde") = "ficha" Then
            Response.Redirect("FichaAlc.aspx")
        Else
            Response.Redirect("ChecklistsAlc.aspx")

        End If
    End Sub
End Class
