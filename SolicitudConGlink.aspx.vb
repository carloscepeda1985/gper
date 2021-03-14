Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class SolicitudCon
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

    Dim conn3 As OdbcConnection
    Dim comm3 As OdbcCommand
    Dim dr3 As OdbcDataReader
    Dim conector3 As String
    Dim sql3 As String


    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Private Sub SolicitudCon_Load(sender As Object, e As EventArgs) Handles Me.Load

        'Datos Solicitud

        LabelNumero.Text = Request.QueryString("dato")

        conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector2 += "Database=w230416_glink;User=w230416_glink;"
        conector2 += "Pwd=Gorilla1985;Option=3;"

        conn2 = New OdbcConnection(conector2)
        conn2.Open()
        sql2 = "SELECT id, id_mall, id_contratista, id_encargado, empresa_contratista, resumen_trabajo, lugar, fecha_inicio, fecha_fin, hora_entrada, duracion, telefono_emergencia, email, estado FROM solicitud_m where id = " & Request.QueryString("dato")
        comm2 = New OdbcCommand(sql2, conn2)
        dr2 = comm2.ExecuteReader()
        I2 = 0
        If (dr2.Read()) Then

            TextBox10.Text = dr2.GetValue(4).ToString()
            TextBox11.Text = dr2.GetValue(5).ToString()
            TextBox12.Text = dr2.GetValue(6).ToString()
            RadDatePicker2.SelectedDate = dr2.GetValue(7).ToString()
            RadDatePicker1.SelectedDate = dr2.GetValue(8).ToString()
            DropDownList2.Text = dr2.GetValue(9).ToString()
            DropDownList1.Text = dr2.GetValue(10).ToString()
            TextBox17.Text = dr2.GetValue(11).ToString()
            TextBox18.Text = dr2.GetValue(12).ToString()
            If dr2.GetValue(13).ToString() = "0" Then
                alerta.Attributes.Add("class", "alert alert-warning")
                LabelEstado.Text = "Pendiente"
                Div2.Attributes.Add("class", "alert alert-info")
                p2.Visible = True
                p1.Visible = False
            End If
            If dr2.GetValue(13).ToString() = "1" Then
                alerta.Attributes.Add("class", "alert alert-success")
                LabelEstado.Text = "Aprobada"
                Div2.Attributes.Add("class", "alert alert-success")
                p2.Visible = False
                p1.Visible = True
            End If
            If dr2.GetValue(13).ToString() = "2" Then
                alerta.Attributes.Add("class", "alert alert-danger")
                LabelEstado.Text = "Rechazada"
                Div2.Attributes.Add("class", "alert alert-danger")
                p2.Visible = False
                p1.Visible = True
            End If

            'Encargado

            conector3 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector3 += "Database=w230416_glink;User=w230416_glink;"
            conector3 += "Pwd=Gorilla1985;Option=3;"

            conn3 = New OdbcConnection(conector3)
            conn3.Open()
            sql3 = "SELECT id, rut, nombre, apellido, mutual, celular, email, estado FROM encargado_m where rut = '" & dr2.GetValue(3).ToString() & "'"
            comm3 = New OdbcCommand(sql3, conn3)
            dr3 = comm3.ExecuteReader()
            If (dr3.Read()) Then

                TextBox1.Text = dr3.GetValue(1).ToString()
                TextBox2.Text = dr3.GetValue(2).ToString()
                TextBox3.Text = dr3.GetValue(3).ToString()
                DropDownList4.SelectedValue = dr3.GetValue(4).ToString()
                TextBox5.Text = dr3.GetValue(5).ToString()
                TextBox6.Text = dr3.GetValue(6).ToString()

            End If

            conn3.Close()
            dr3.Close()
            comm3.Dispose()
            conn3.Dispose()

            'Aprobaciones

            conector3 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector3 += "Database=w230416_glink;User=w230416_glink;"
            conector3 += "Pwd=Gorilla1985;Option=3;"

            conn3 = New OdbcConnection(conector3)
            conn3.Open()
            sql3 = "SELECT id,id_mall,id_contratista,id_solicitud,usuario,comentario,fecha,estado FROM aprobaciones_m where id_solicitud = '" & LabelNumero.Text & "'"
            comm3 = New OdbcCommand(sql3, conn3)
            dr3 = comm3.ExecuteReader()
            While (dr3.Read())

                If dr3.GetValue(4).ToString() = "tienda" Then
                    conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                    conector += "Database=w230416_glink;User=w230416_glink;"
                    conector += "Pwd=Gorilla1985;Option=3;"

                    conn = New OdbcConnection(conector)
                    conn.Open()
                    sql = "SELECT nombre FROM tiendas_m where id ='" & dr3.GetValue(2).ToString() & "'"
                    comm = New OdbcCommand(sql, conn)
                    dr = comm.ExecuteReader()
                    If dr.Read Then
                        lbl_enviada.Text = dr.GetValue(0).ToString()
                        lbl_fecha.Text = dr3.GetValue(6).ToString()
                        lbl_comentario.Text = dr3.GetValue(5).ToString()
                    End If

                    conn.Close()
                    dr.Close()
                    comm.Dispose()
                    conn.Dispose()
                End If
                If dr3.GetValue(4).ToString() = "contratista" Then
                    conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                    conector += "Database=w230416_glink;User=w230416_glink;"
                    conector += "Pwd=Gorilla1985;Option=3;"

                    conn = New OdbcConnection(conector)
                    conn.Open()
                    sql = "SELECT nombre FROM contratistas_m where id ='" & dr3.GetValue(2).ToString() & "'"
                    comm = New OdbcCommand(sql, conn)
                    dr = comm.ExecuteReader()

                    If dr.Read Then
                        lbl_enviada.Text = dr.GetValue(0).ToString()
                        lbl_fecha.Text = dr3.GetValue(6).ToString()
                        lbl_comentario.Text = dr3.GetValue(5).ToString()
                    End If


                    conn.Close()
                    dr.Close()
                    comm.Dispose()
                    conn.Dispose()
                Else

                    lbl_renviada.Text = dr3.GetValue(4).ToString()
                    lbl_rfecha.Text = dr3.GetValue(6).ToString()
                    lbl_rcomentario.Text = dr3.GetValue(5).ToString()

                End If

            End While

            conn3.Close()
            dr3.Close()
            comm3.Dispose()
            conn3.Dispose()

        End If

        conn2.Close()
        dr2.Close()
        comm2.Dispose()
        conn2.Dispose()

        '__________________________________________________________-
        'Trabajadores

        Dim CDT, CAFP, AFC, INP, CCAF As String

        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(9) {New DataColumn("Rut"), New DataColumn("Nombre"), New DataColumn("Apellido"), New DataColumn("Numero"), New DataColumn("Cargo"), New DataColumn("CDT"), New DataColumn("CAFP"), New DataColumn("AFC"), New DataColumn("INP"), New DataColumn("CCAF")})

        conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector2 += "Database=w230416_glink;User=w230416_glink;"
        conector2 += "Pwd=Gorilla1985;Option=3;"

        conn2 = New OdbcConnection(conector2)
        conn2.Open()
        sql2 = "SELECT rut FROM trabajador_solicitud where id_solicitud = " & Request.QueryString("dato")
        comm2 = New OdbcCommand(sql2, conn2)
        dr2 = comm2.ExecuteReader()
        I2 = 0
        While (dr2.Read())

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut,nombre,apellido,telefono,funcion,CDT,CAFP,AFC,INP,CCAF FROM trabajadores_contratista_m where estado = '1' and rut='" & dr2.GetValue(0).ToString() & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0

            If (dr.Read()) Then
                If dr.GetValue(5).ToString() = "no" Then
                    CDT = "A"
                Else
                    CDT = "P"
                End If
                If dr.GetValue(6).ToString() = "no" Then
                    CAFP = "A"
                Else
                    CAFP = "P"
                End If
                If dr.GetValue(7).ToString() = "no" Then
                    AFC = "A"
                Else
                    AFC = "P"
                End If
                If dr.GetValue(8).ToString() = "no" Then
                    INP = "A"
                Else
                    INP = "P"
                End If
                If dr.GetValue(9).ToString() = "no" Then
                    CCAF = "A"
                Else
                    CCAF = "P"
                End If

                dt.Rows.Add(dr.GetValue(0).ToString(), dr.GetValue(1).ToString(), dr.GetValue(2).ToString(), dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), CDT, CAFP, AFC, INP, CCAF)

            End If

            GridView1.DataSource = dt
            GridView1.DataBind()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()

        End While

        conn2.Close()
        dr2.Close()
        comm2.Dispose()
        conn2.Dispose()

    End Sub


    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("SolicitudesConGlink.aspx")
    End Sub

End Class
