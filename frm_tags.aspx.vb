﻿Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml
Partial Class frm_tags
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Dim dt As New DataTable()

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dt.Clear()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_tag, rut_p, patente, marca, color, estado FROM vehiculo_m where id_condominio = '" & Session("id_con") & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0


        While (dr.Read())


            If dt.Columns.Count = 0 Then
                dt.Columns.Add("N° Tag", GetType(String))
                dt.Columns.Add("Rut Propietario", GetType(String))
                dt.Columns.Add("Patente", GetType(String))
                dt.Columns.Add("Marca", GetType(String))
                dt.Columns.Add("Color", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim estado As String

            If dr.GetValue(5).ToString() = "1" Then
                estado = "Activo"
            Else
                estado = "Desactivado"
            End If



            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = estado


            dt.Rows.Add(NewRow)

            I = I + 1

        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("N° Tag", GetType(String))
                dt.Columns.Add("Rut Propietario", GetType(String))
                dt.Columns.Add("Patente", GetType(String))
                dt.Columns.Add("Marca", GetType(String))
                dt.Columns.Add("Color", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

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

        If TextBox2.Text = "" Then
            Exit Sub
        End If

        TextBox2.Text = Replace(TextBox2.Text, ".", "")

        If ValidarRut(TextBox2.Text) = "Rut Incorrecto" Then

            TextBox2.Focus()
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "alertIns", "alert('El Rut Ingresado no es Válido');", True)
            Exit Sub
        Else

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "insert Into vehiculo_m(id_condominio,id_tag, rut_p, patente, marca, color, estado,updates,deleted) Values('" & Session("id_con") & "','" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & TextBox5.Text & "','1','1','1')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()
            Response.Redirect("frm_tags.aspx")
        End If
       
    End Sub

    Public Function ValidarRut(ByVal Rut As String) As String

        Dim Digito As Integer

        Dim Contador As Integer

        Dim Multiplo As Integer

        Dim Acumulador As Integer

        Dim str_AuxDig As String = Nothing

        Dim str_Digito As String = Mid(Rut.ToUpper(), Rut.Length(), 1)

        Dim str_Rut As String = Mid(Rut, 1, Rut.Length() - 2)

        Contador = 2

        Acumulador = 0

        While str_Rut <> 0

            Multiplo = (str_Rut Mod 10) * Contador

            Acumulador = Acumulador + Multiplo

            str_Rut = str_Rut \ 10

            Contador = Contador + 1

            If Contador = 8 Then

                Contador = 2

            End If

        End While

        Digito = 11 - (Acumulador Mod 11)

        str_AuxDig = CStr(Digito)

        Select Case Digito

            Case Is = 1 : str_AuxDig = "K"

            Case Is = 0 : str_AuxDig = "0"

            Case Else : str_AuxDig = str_AuxDig

        End Select

        If str_Digito <> str_AuxDig Then

            ValidarRut = "Rut Incorrecto"

        Else

            ValidarRut = "Rut Correcto"

        End If

        Return ValidarRut

    End Function

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        Me.GridView1.PageIndex = e.NewPageIndex
        With Me.GridView1
            .DataSource = dt
            .DataBind()
        End With
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim x As Integer
        Dim dato As String

        x = GridView1.SelectedIndex()

        dato = GridView1.Rows(x).Cells(1).Text

        Response.Redirect("frm_editar_tags.aspx?dato=" + dato)
      
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        GridView1.PageSize = 10000

        dt.Clear()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id_tag, rut_p, patente, marca, color, estado FROM vehiculo_m where id_condominio = '" & Session("id_con") & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0


        While (dr.Read())


            If dt.Columns.Count = 0 Then
                dt.Columns.Add("N° Tag", GetType(String))
                dt.Columns.Add("Rut Propietario", GetType(String))
                dt.Columns.Add("Patente", GetType(String))
                dt.Columns.Add("Marca", GetType(String))
                dt.Columns.Add("Color", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim estado As String

            If dr.GetValue(5).ToString() = "1" Then
                estado = "Activo"
            Else
                estado = "Desactivado"
            End If



            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = estado


            dt.Rows.Add(NewRow)

            I = I + 1

        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("N° Tag", GetType(String))
                dt.Columns.Add("Rut Propietario", GetType(String))
                dt.Columns.Add("Patente", GetType(String))
                dt.Columns.Add("Marca", GetType(String))
                dt.Columns.Add("Color", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

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


        Dim sb As StringBuilder = New StringBuilder()
        Dim sw As StringWriter = New StringWriter(sb)
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim pagina As Page = New Page
        Dim form = New HtmlForm
        GridView1.EnableViewState = False
        pagina.EnableEventValidation = False
        pagina.DesignerInitialize()
        pagina.Controls.Add(form)
        form.Controls.Add(GridView1)
        pagina.RenderControl(htw)
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("Content-Disposition", "attachment;filename=Registrar_Tag" & Now & ".xls")
        Response.Charset = "UTF-8"

        Response.ContentEncoding = Encoding.Default
        Response.Write(sb.ToString())
        Response.End()

        GridView1.PageSize = 20

    End Sub
End Class
