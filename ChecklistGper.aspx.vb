Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class ChecklistGper
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim conn2 As OdbcConnection
    Dim comm2 As OdbcCommand
    Dim dr2 As OdbcDataReader
    Dim conector2 As String
    Dim sql2 As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If (IsPostBack = False) Then
            Label1.Text = Request.QueryString("codigo")
            Label2.Text = Request.QueryString("rut")
            Label10.Text = "0" + "%"
            Label11.Text = "0"
            Label13.Text = "0"

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "insert Into checklists_m(id_mall, id_equipo, fecha, rut_usuario, porcentaje, comentario, link_foto, estado) Values('" & Session("idcond_pro") & "','" & Label1.Text & "','" & Now & "','" & Label2.Text & "','0%','" & TextBox1.Text & "','no','1')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()

            conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector2 += "Database=w230416_glink;User=w230416_glink;"
            conector2 += "Pwd=Gorilla1985;Option=3;"
            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "SELECT MAX(id) FROM checklists_m"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()

            If (dr2.Read()) Then
                Label8.Text = dr2.GetValue(0).ToString
            End If

            conn2.Close()
            dr2.Close()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"
            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id_local, tipo FROM equipos_m where id = '" & Request.QueryString("codigo") & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            If (dr.Read()) Then

                Label9.Text = dr.GetValue(1).ToString()

                conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector2 += "Database=w230416_glink;User=w230416_glink;"
                conector2 += "Pwd=Gorilla1985;Option=3;"
                conn2 = New OdbcConnection(conector2)
                conn2.Open()
                sql2 = "SELECT id,pregunta FROM preguntas_check where tipo = '" & dr.GetValue(1).ToString & "' ORDER BY id LIMIT 1"
                comm2 = New OdbcCommand(sql2, conn2)
                dr2 = comm2.ExecuteReader()

                If (dr2.Read()) Then
                    Label3.Text = dr2.GetValue(1).ToString
                    Label4.Text = dr2.GetValue(0)
                    Label5.Text = dr.GetValue(1).ToString
                End If

                conn2.Close()
                dr2.Close()

                conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector2 += "Database=w230416_glink;User=w230416_glink;"
                conector2 += "Pwd=Gorilla1985;Option=3;"
                conn2 = New OdbcConnection(conector2)
                conn2.Open()
                sql2 = "SELECT COUNT(pregunta) FROM preguntas_check where tipo = '" & dr.GetValue(1).ToString & "' ORDER BY id LIMIT 1"
                comm2 = New OdbcCommand(sql2, conn2)
                dr2 = comm2.ExecuteReader()

                If (dr2.Read()) Then
                    Label12.Text = dr2.GetValue(0).ToString
                End If

                conn2.Close()
                dr2.Close()

            End If
            conn.Close()
            dr.Close()

        End If
        
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Label4.Text = Label4.Text + 1
        Label13.Text = Label13.Text + 1

        Dim porcentaje As Double
        Dim porciento As Integer

        If RadioButton1.Checked = True Then

            Label11.Text = Label11.Text + 1
            porcentaje = Integer.Parse(Label11.Text)
            Dim n_preguntas As Integer = Integer.Parse(Label12.Text)
            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "insert Into respuestas_check(id_mall, id_checklists, id_preguntas, respuesta, comentario, foto, estado) Values('" & Session("idcond_pro") & "','" & Label8.Text & "','" & Label13.Text() & "','1','" & TextBox1.Text & "','no','1')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()

            porcentaje = porcentaje / n_preguntas
            porcentaje = porcentaje * 100

            porciento = Convert.ToInt32(Math.Round(porcentaje))

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "update checklists_m set porcentaje = '" & porciento & "%'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()

            Label10.Text = porciento & "%"

            conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector2 += "Database=w230416_glink;User=w230416_glink;"
            conector2 += "Pwd=Gorilla1985;Option=3;"
            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "SELECT id,pregunta FROM preguntas_check where tipo = '" & Label5.Text & "' and id = '" & Label4.Text & "' ORDER BY id LIMIT 1"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()

            If (dr2.Read()) Then
                Label3.Text = dr2.GetValue(1).ToString
            End If

            conn2.Close()
            dr2.Close()

            TextBox1.Text = ""

        End If

        If RadioButton2.Checked = True Then

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "insert Into respuestas_check(id_mall, id_checklists, id_preguntas, respuesta, comentario, foto, estado) Values('" & Session("idcond_pro") & "','" & Label8.Text & "','" & Label13.Text() & "','0','" & TextBox1.Text & "','no','1')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()


            conector2 = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector2 += "Database=w230416_glink;User=w230416_glink;"
            conector2 += "Pwd=Gorilla1985;Option=3;"
            conn2 = New OdbcConnection(conector2)
            conn2.Open()
            sql2 = "SELECT id,pregunta FROM preguntas_check where tipo = '" & Label5.Text & "' and id = '" & Label4.Text & "' ORDER BY id LIMIT 1"
            comm2 = New OdbcCommand(sql2, conn2)
            dr2 = comm2.ExecuteReader()

            If (dr2.Read()) Then
                Label3.Text = dr2.GetValue(1).ToString
            End If

            conn2.Close()
            dr2.Close()

            TextBox1.Text = ""

        End If

        If Integer.Parse(Label13.Text) >= Integer.Parse(Label12.Text) Then
            Response.Redirect("ComprobanteChecklist.aspx?porcentaje=" + Label10.Text)
        End If


    End Sub

    Protected Sub RadioButton2_CheckedChanged(sender As Object, e As System.EventArgs) Handles RadioButton2.CheckedChanged
        If RadioButton2.Checked = True Then
            Panel1.Visible = True
            Button1.Enabled = False
        End If
    End Sub

    Protected Sub RadioButton1_CheckedChanged(sender As Object, e As System.EventArgs) Handles RadioButton1.CheckedChanged
        If RadioButton1.Checked = True Then
            Panel1.Visible = False
            Button1.Enabled = True
        End If
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As System.EventArgs) Handles TextBox1.TextChanged
        If TextBox1.Text <> "" Then
            Button1.Enabled = True
        Else
            Button1.Enabled = False
        End If
    End Sub
End Class
