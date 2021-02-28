Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_edita_propietario
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
       
        
        If (IsPostBack = False) Then

            Button2.Attributes.Add("onclick", "history.back(); return false;")
            lbl_rut.Text = Request.QueryString("dato")

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT rut, nombre, apellido_p, email, telefono , sitio, departamento estado FROM propietario_m where rut = '" & lbl_rut.Text & "' and deleted = '1'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            If (dr.Read()) Then

                TextBox7.Text = dr.GetValue(0).ToString()
                TextBox1.Text = dr.GetValue(1).ToString()
                TextBox2.Text = dr.GetValue(2).ToString()
                TextBox3.Text = dr.GetValue(3).ToString()
                TextBox4.Text = dr.GetValue(4).ToString()
                TextBox5.Text = dr.GetValue(5).ToString()
                TextBox6.Text = dr.GetValue(6).ToString()
            End If
        End If
       
    End Sub
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
   
        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE propietario_m set rut = '" & TextBox7.Text & "', nombre = '" & TextBox1.Text() & "', apellido_p = '" & TextBox2.Text & "', email = '" & TextBox3.Text & "', telefono = '" & TextBox4.Text & "', sitio = '" & TextBox5.Text & "', departamento = '" & TextBox6.Text & "', updates = '1' where rut = '" & lbl_rut.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_propietarios.aspx")
   
    End Sub

   
    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "UPDATE propietario_m set deleted = '2' where rut = '" & lbl_rut.Text & "'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        Response.Redirect("frm_propietarios.aspx")
    
    End Sub
End Class
