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

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"
            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id_local, tipo FROM equipos_m where id = '" & Request.QueryString("codigo") & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            If (dr.Read()) Then

                conector2 = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
                conector2 += "Database=v0081532_yousoft;User=v0081532_yousoft;"
                conector2 += "Pwd=90VEporefi;Option=3;"
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

            End If
            conn.Close()
            dr.Close()


        End If
        
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If RadioButton1.Checked = True Then
            Label4.Text = Label4.Text + 1
            conector2 = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector2 += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector2 += "Pwd=90VEporefi;Option=3;"
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

        End If
        If RadioButton2.Checked = True Then



            Label4.Text = Label4.Text + 1
            conector2 = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector2 += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector2 += "Pwd=90VEporefi;Option=3;"
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

        End If

    End Sub

    Protected Sub RadioButton2_CheckedChanged(sender As Object, e As System.EventArgs) Handles RadioButton2.CheckedChanged
        If RadioButton2.Checked = True Then
            Panel1.Visible = True
            Button1.Enabled = False
        Else
            Panel1.Visible = False
            Button1.Enabled = True
        End If
    End Sub

    Protected Sub RadioButton1_CheckedChanged(sender As Object, e As System.EventArgs) Handles RadioButton1.CheckedChanged
        If RadioButton2.Checked = True Then
            Panel1.Visible = True
            Button1.Enabled = False
        Else
            Panel1.Visible = False
            Button1.Enabled = True
        End If
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As System.EventArgs) Handles TextBox1.TextChanged
        If TextBox1.Text <> "" Then
            If Not File1.PostedFile Is Nothing And File1.PostedFile.ContentLength > 0 Then
                Button1.Enabled = True
            Else
                Button1.Enabled = False
            End If
        Else
            Button1.Enabled = False
        End If
    End Sub
End Class
