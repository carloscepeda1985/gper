Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml


Partial Class frm_trabajadorescond
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Dim dt As New DataTable()

    Public dv_p As String 'digito validador
    Public msRutSinDig As String 'rut sin guion, punto y digito validador para realizar consultas
    Public valRutError As Boolean = True 'retorna verdadero o falso si el rut es correcto o correcto 
    Public msRut As String 'rut con punto y guion 
    Public mRutguion As String
    Public msApe As String 'apellido 
    Public va As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dt.Clear()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut, nombre, apellido, telefono, funcion , empresa, estado FROM trabajadores_m where id_condominio = '" & Session("id_con") & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0


        While (dr.Read())


            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Rut", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Apellido", GetType(String))
                dt.Columns.Add("Telefono", GetType(String))
                dt.Columns.Add("Funcion", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim estado As String

            If dr.GetValue(6).ToString() = "1" Then
                estado = "Autorizado"
            Else
                estado = "No Autorizado"
            End If



            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = estado


            dt.Rows.Add(NewRow)

            I = I + 1

        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Rut", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Apellido", GetType(String))
                dt.Columns.Add("Telefono", GetType(String))
                dt.Columns.Add("Funcion", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = ""
            NewRow(1) = ""
            NewRow(2) = ""
            NewRow(3) = ""
            NewRow(4) = ""
            NewRow(5) = ""
            NewRow(6) = ""


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

        If TextBox1.Text = "" Then
            Exit Sub
        End If

        separa_Rut(TextBox1.Text)

        If valRutError = False Then
            TextBox1.Focus()
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "alertIns", "alert('El Rut Ingresado no es Válido');", True)
            Exit Sub
        Else
            TextBox1.Text = mRutguion

            Dim dt As New DataTable()

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "insert Into trabajadores_m(id_condominio,rut,nombre,apellido,telefono,funcion,empresa,estado,updates,deleted) Values('" & Session("id_con") & "','" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox10.Text & "','" & TextBox5.Text & "','" & TextBox9.Text & "','1','1','1')"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            conn.Close()
            dr.Close()
            comm.Dispose()
            conn.Dispose()
            Response.Redirect("frm_trabajadorescond.aspx")
        End If
      
    End Sub

    Public Sub separa_Rut(ByVal cedula As String)
        Try
            Dim pistola, pr1, pr2, pr3 As String
            Dim larg, larg1 As Integer

            ' se elimina el gion que netraga la cedula nueva y se quita un espacio
            pistola = Replace(cedula, "-", "")
            pistola = Replace(pistola, ".", "")
            larg1 = Len(pistola)

            If larg1 = 9 Or larg1 = 8 Then
                ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                ' rut solo sin digito este valida cuando un rut se ingresa manual
                Dim v1 As Integer
                dv_p = Mid(pistola, Len(pistola), 1) 'extraigo el digito validador
                msRutSinDig = Mid(pistola, 1, Len(pistola) - 1) ' rut sin digito validador y guardo el rut, variable global 
                pr1 = Mid(msRutSinDig, Len(msRutSinDig) - 2, 3) 'rut sin digito, ultimos 3 numeros
                pr2 = Mid(msRutSinDig, Len(msRutSinDig) - 5, 3)
                v1 = Len(pr1) + Len(pr2)
                larg = Len(msRutSinDig) - v1

                If larg = 2 Then
                    pr3 = Mid(msRutSinDig, Len(msRutSinDig) - 7, 2)
                Else
                    pr3 = Mid(msRutSinDig, Len(msRutSinDig) - 6, 1) ' lee rut con 1 digito de inicio
                End If

                ' msApe = "SIN APELLIDO" 'apellido
                ' msRutSinDig = pr3 & pr2 & pr1 'rut sin digito validador
                ' msRut = pr3 & "." & pr2 & "." & pr1 & "-" & valida_cedula(msRutSinDig) 'rut completo con puntuaciones
                mRutguion = pr3 & "" & pr2 & "" & pr1 & "-" & dv_p
                ' dv_p = valida_cedula(msRutSinDig)
                If dv_p <> valida_cedula(msRutSinDig) Then
                    valRutError = False
                Else
                    If IsNumeric(CInt(msRutSinDig)) And Len(msRutSinDig) = 8 Or IsNumeric(CInt(msRutSinDig)) And Len(msRutSinDig) = 7 Then
                        valRutError = True
                    Else
                        valRutError = False
                    End If
                End If

            End If

        Catch ex As Exception

        End Try

    End Sub

    Public Function valida_cedula(ByVal cedula As String) As String ' entrega digito validador

        Dim Srut As String
        Dim Factor As Integer
        Dim Suma As Integer
        Dim Rut As Long
        Dim Dv As Integer
        Dim I As Integer
        Dim DVRUT1 As String
        Rut = Val(cedula) 'convierto la cadena a entero
        Srut = Trim(Str(Rut))
        Factor = 2
        Suma = 0
        For I = Len(Srut) To 1 Step -1
            Suma = Suma + Val(Mid$(Srut, I, 1)) * Factor
            Factor = Factor + 1
            If Factor > 7 Then
                Factor = 2
            End If
        Next
        Dv = 11 - Suma Mod 11
        DVRUT1 = Trim(Str(Dv))
        If Dv = 10 Then
            DVRUT1 = "K"
        End If
        If Dv = 11 Then
            DVRUT1 = "0"
        End If
        va = DVRUT1
        Return va
    End Function

    


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

        Response.Redirect("frm_editar_trabajadorcond.aspx?dato=" + dato)
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click

        GridView1.PageSize = 10000


        dt.Clear()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut, nombre, apellido, telefono, funcion , empresa, estado FROM trabajadores_m where id_condominio = '" & Session("id_con") & "' and deleted = '1' and rut like '%" & numero.Text & "%' and nombre like '%" & TextBox4.Text & "%' and apellido like '%" & TextBox6.Text & "%' and empresa like '%" & TextBox7.Text & "%'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0


        While (dr.Read())


            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Rut", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Apellido", GetType(String))
                dt.Columns.Add("Telefono", GetType(String))
                dt.Columns.Add("Funcion", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim estado As String

            If dr.GetValue(6).ToString() = "1" Then
                estado = "Autorizado"
            Else
                estado = "No Autorizado"
            End If



            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = estado


            dt.Rows.Add(NewRow)

            I = I + 1

        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Rut", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Apellido", GetType(String))
                dt.Columns.Add("Telefono", GetType(String))
                dt.Columns.Add("Funcion", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = ""
            NewRow(1) = ""
            NewRow(2) = ""
            NewRow(3) = ""
            NewRow(4) = ""
            NewRow(5) = ""
            NewRow(6) = ""


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
        Response.AddHeader("Content-Disposition", "attachment;filename=Registro_Trabajadores" & Now & ".xls")
        Response.Charset = "UTF-8"

        Response.ContentEncoding = Encoding.Default
        Response.Write(sb.ToString())
        Response.End()

        GridView1.PageSize = 20

    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        dt.Clear()

        conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
        conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
        conector += "Pwd=90VEporefi;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT rut, nombre, apellido, telefono, funcion , empresa, estado FROM trabajadores_m where id_condominio = '" & Session("id_con") & "' and deleted = '1' and rut like '%" & numero.Text & "%' and nombre like '%" & TextBox4.Text & "%' and apellido like '%" & TextBox6.Text & "%' and empresa like '%" & TextBox7.Text & "%'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()
        I = 0


        While (dr.Read())


            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Rut", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Apellido", GetType(String))
                dt.Columns.Add("Telefono", GetType(String))
                dt.Columns.Add("Funcion", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim estado As String

            If dr.GetValue(6).ToString() = "1" Then
                estado = "Autorizado"
            Else
                estado = "No Autorizado"
            End If



            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = dr.GetValue(0).ToString()
            NewRow(1) = dr.GetValue(1).ToString()
            NewRow(2) = dr.GetValue(2).ToString()
            NewRow(3) = dr.GetValue(3).ToString()
            NewRow(4) = dr.GetValue(4).ToString()
            NewRow(5) = dr.GetValue(5).ToString()
            NewRow(6) = estado


            dt.Rows.Add(NewRow)

            I = I + 1

        End While

        If I = 0 Then

            If dt.Columns.Count = 0 Then
                dt.Columns.Add("Rut", GetType(String))
                dt.Columns.Add("Nombre", GetType(String))
                dt.Columns.Add("Apellido", GetType(String))
                dt.Columns.Add("Telefono", GetType(String))
                dt.Columns.Add("Funcion", GetType(String))
                dt.Columns.Add("Empresa", GetType(String))
                dt.Columns.Add("Estado", GetType(String))

            End If

            Dim NewRow As DataRow = dt.NewRow()
            NewRow(0) = ""
            NewRow(1) = ""
            NewRow(2) = ""
            NewRow(3) = ""
            NewRow(4) = ""
            NewRow(5) = ""
            NewRow(6) = ""


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
End Class
