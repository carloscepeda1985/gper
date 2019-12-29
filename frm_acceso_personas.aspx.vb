Imports Telerik.Web.UI
Imports System.IO
Imports System.Data
Imports System.Data.Odbc
Imports System.Xml

Partial Class frm_acceso_personas
    Inherits System.Web.UI.Page
    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String
    Dim I As Integer
    Dim dt As New DataTable()

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

            If Session("rut_pro") = "" Then
                Response.Redirect("Default.aspx")
                Exit Sub
            End If

        dt.Clear()

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
        sql = "SELECT registro, tipo, rut, nombre, apellido, relacion, fecha, comentario, foto FROM ingresos_t where rut_p = '" & Session("rut_pro") & "' and id_condominio = '" & Session("idcond_pro") & "' order by id desc"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()
            I = 0
            While (dr.Read())

                If dt.Columns.Count = 0 Then
                    dt.Columns.Add(" Registro ", GetType(String))
                    dt.Columns.Add(" Tipo ", GetType(String))
                    dt.Columns.Add(" Rut ", GetType(String))
                    dt.Columns.Add(" Nombres ", GetType(String))
                    dt.Columns.Add(" Apellidos ", GetType(String))
                    dt.Columns.Add(" Relación ", GetType(String))
                    dt.Columns.Add(" Fecha ", GetType(String))
                    dt.Columns.Add(" Comentario ", GetType(String))
                End If

                Dim estado As String


                Dim NewRow As DataRow = dt.NewRow()
                NewRow(0) = dr.GetValue(0).ToString()
                NewRow(1) = dr.GetValue(1).ToString()
                NewRow(2) = dr.GetValue(2).ToString()
                NewRow(3) = dr.GetValue(3).ToString()
                NewRow(4) = dr.GetValue(4).ToString()
                NewRow(5) = dr.GetValue(5).ToString()
                NewRow(6) = dr.GetValue(6).ToString()
                NewRow(7) = dr.GetValue(7).ToString()

                dt.Rows.Add(NewRow)

                I = I + 1
            End While

            If I = 0 Then

                If dt.Columns.Count = 0 Then
                    dt.Columns.Add(" Registro ", GetType(String))
                    dt.Columns.Add(" Tipo ", GetType(String))
                    dt.Columns.Add(" Rut ", GetType(String))
                    dt.Columns.Add(" Nombres ", GetType(String))
                    dt.Columns.Add(" Apellidos ", GetType(String))
                    dt.Columns.Add(" Relación ", GetType(String))
                    dt.Columns.Add(" Fecha ", GetType(String))
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


    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

        If Session("rut_pro") = "" Then
            Response.Redirect("Default.aspx")
            Exit Sub
        End If
        Response.Redirect("frm_menuprincipal.aspx")
      
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        Me.GridView1.PageIndex = e.NewPageIndex
        With Me.GridView1
            .DataSource = dt
            .DataBind()
        End With
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
   
            If Session("rut_pro") = "" Then
                Response.Redirect("Default.aspx")
                Exit Sub
            End If

            Dim x As Integer
            Dim dato1, dato2, link As String

            x = GridView1.SelectedIndex()

            dato1 = GridView1.Rows(x).Cells(3).Text
            dato2 = GridView1.Rows(x).Cells(7).Text

            conector = "driver={MySQL ODBC 3.51 Driver};Server=localhost;"
            conector += "Database=v0081532_yousoft;User=v0081532_yousoft;"
            conector += "Pwd=90VEporefi;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT foto FROM ingresos_t where rut_p = '" & Session("rut_pro") & "' and id_condominio = '" & Session("idcond_pro") & "' and rut = '" & dato1 & "' and fecha = '" & dato2 & "'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            If (dr.Read()) Then
                link = dr.GetValue(0).ToString()
                If link = "" Then
                    link = "http://yousoft.cl/fotosaccesos/nodisponible.jpg"
                Else
                    link = Replace(link, "ftp://v0081532.ferozo.com/public_html", "http://yousoft.cl")
                End If
            Else
                link = "http://yousoft.cl/fotosaccesos/nodisponible.jpg"
            End If

            Response.Redirect("frm_fotoacceso.aspx?dato=" + link)


    End Sub

  
End Class
