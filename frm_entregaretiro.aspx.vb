Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_entregaretiro
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If


        RadComboBox1.Items.Insert(0, New RadComboBoxItem("Entrega", "ENTREGA"))
        RadComboBox1.Items.Insert(1, New RadComboBoxItem("Retiro", "RETIRO"))

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, empresa, tipo, descripcion, start, end FROM trabajos_m where rut_p = '" & Session("rut_pro") & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0
        While (dr.Read())

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Nº", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Tipo", GetType(String))
                dt.Columns.Add("Descripción", GetType(String))
                dt.Columns.Add("Desde", GetType(String))
                dt.Columns.Add("Hasta", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            dt.Rows.Add(NewRow)

            I = I + 1
        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Nº", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Tipo", GetType(String))
                dt.Columns.Add("Descripción", GetType(String))
                dt.Columns.Add("Desde", GetType(String))
                dt.Columns.Add("Hasta", GetType(String))
            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = ""
            NewRow(1) = ""
            NewRow(2) = ""
            NewRow(3) = ""
            NewRow(4) = ""
            NewRow(5) = ""
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

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        If TextBox1.Text = "" Then
            TextBox1.Focus()
        Else
            If TextBox3.Text = "" Then
                TextBox3.Focus()
            Else
                conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
                conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
                conector += "Pwd=90VEporefi;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "insert Into trabajos_m(id_condominio, rut_p, empresa, tipo, descripcion, start, end,estado,created_at,status,deleted,updates) Values('" & Session("idcond_pro") & "','" & Session("rut_pro") & "','" & TextBox1.Text & "','" & RadComboBox1.SelectedValue() & "','" & TextBox3.Text & "','" & RadDatePicker1.SelectedDate.ToString & "','" & RadDatePicker2.SelectedDate.ToString & "','1','" & Now.ToString & "','1','1','0')"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                conn.Close()
                dr.Close()

                Response.Redirect("frm_entregaretiro.aspx")
            End If
        End If

     
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

        Dim x As Integer
        Dim dato As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(1).Text

        Response.Redirect("frm_editar_entregaretiro.aspx?dato=" + dato)
      
    End Sub
End Class
