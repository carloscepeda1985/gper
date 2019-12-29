Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class FichaAlc
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

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT des1,des2,des3,des4,des5,des6,des7,des8,des9,des10,des11 FROM ficha_m where estado = '1' and tipo='" & Request.QueryString("tipo") & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        If (dr.Read()) Then

            Label10.Text = dr.GetValue(1).ToString()
            Label1.Text = Request.QueryString("id")
            Label2.Text = Request.QueryString("ubicacion")
            Label3.Text = dr.GetValue(2).ToString()
            Label4.Text = dr.GetValue(3).ToString()
            Label5.Text = dr.GetValue(4).ToString()
            Label6.Text = dr.GetValue(5).ToString()
            Label7.Text = dr.GetValue(6).ToString()
            Label8.Text = dr.GetValue(7).ToString()
            Label9.Text = dr.GetValue(8).ToString()

        End If

        conn.Close()
        dr.Close()
        comm.Dispose()
        conn.Dispose()

        Image1.ImageUrl = "http://yousoft.cl/login/mobile/Data/" & Request.QueryString("id") & "/"

        llena_checklists()
        llena_mantenciones()

    End Sub
    Public Sub llena_checklists()
        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_equipo, fecha, rut_usuario, porcentaje, comentario FROM checklists_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Ficha ", GetType(String))
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


    Public Sub llena_mantenciones()

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_equipo, fecha, rut_empresa, nombre_empresa, tipo, SUBSTR( descripcion, 1, 20 ) FROM mantenciones_m where id_mall = '" & Session("idcond_pro") & "' and estado = '1' ORDER BY fecha DESC"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Ficha ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
                dt.Columns.Add(" Rut Empresa ", GetType(String))
                dt.Columns.Add(" Nombre Empresa ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Descripción ", GetType(String))
            End If


            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString() & "..."
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add(" N° Ficha ", GetType(String))
                dt.Columns.Add(" Fecha ", GetType(String))
                dt.Columns.Add(" Rut Empresa ", GetType(String))
                dt.Columns.Add(" Nombre Empresa ", GetType(String))
                dt.Columns.Add(" Tipo ", GetType(String))
                dt.Columns.Add(" Descripción ", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()

            dt.Rows.Add(NewRow)
            GridView2.DataSource = dt
            GridView2.DataBind()


        Else
            GridView2.DataSource = dt
            GridView2.DataBind()



        End If


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

        Response.Redirect("EquiposGper.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Response.Redirect("HomeCheck.aspx?usuario=16199919-9&codigo=MAD231&checked=si&desde=ficha")
    End Sub
End Class
