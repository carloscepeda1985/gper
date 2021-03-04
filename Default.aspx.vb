Imports System.Data
Imports System.Data.Odbc
Partial Class _Default
    Inherits System.Web.UI.Page

    Dim conn As OdbcConnection
    Dim comm As OdbcCommand
    Dim dr As OdbcDataReader
    Dim conector As String
    Dim sql As String

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If TextBox1.Text = "" Then
            Exit Sub
        End If

        Dim dt As New DataTable()

        conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
        conector += "Database=w230416_glink;User=w230416_glink;"
        conector += "Pwd=Gorilla1985;Option=3;"

        conn = New OdbcConnection(conector)
        conn.Open()
        sql = "SELECT id, rut, status, email, id_condominio, nombre, apellido_p, departamento, sitio, telefono, clave FROM propietario_m where email = '" & TextBox1.Text & "' and clave = '" & TextBox2.Text & "' and deleted = '1'"
        comm = New OdbcCommand(sql, conn)
        dr = comm.ExecuteReader()

        If (dr.Read()) Then

            If dr.GetValue(2).ToString() = "1" Then
                Session("rut_pro") = dr.GetValue(1).ToString()
                Session("mail_pro") = dr.GetValue(3).ToString()
                Session("idcond_pro") = dr.GetValue(4).ToString()
                Session("nombr_pro") = dr.GetValue(5).ToString()
                Session("apelli_pro") = dr.GetValue(6).ToString()
                Session("depto_pro") = dr.GetValue(7).ToString()
                Session("sitio_pro") = dr.GetValue(8).ToString()
                Session("tele_pro") = dr.GetValue(9).ToString()
                Session("clave_pro") = dr.GetValue(10).ToString()

                Session.Timeout = 50
                Response.Redirect("frm_nuevo.aspx")
            Else
                If dr.GetValue(4).ToString() = "1" Then
                    Session("rut_pro") = dr.GetValue(1).ToString()
                    Session("mail_pro") = dr.GetValue(3).ToString()
                    Session("idcond_pro") = dr.GetValue(4).ToString()
                    Session("nombr_pro") = dr.GetValue(5).ToString()
                    Session("apelli_pro") = dr.GetValue(6).ToString()
                    Session("depto_pro") = dr.GetValue(7).ToString()
                    Session("sitio_pro") = dr.GetValue(8).ToString()
                    Session("tele_pro") = dr.GetValue(9).ToString()
                    Session("clave_pro") = dr.GetValue(10).ToString()

                    Session.Timeout = 50
                    Response.Redirect("AdmGlink.aspx")

                End If

                If dr.GetValue(4).ToString() = "2" Then
                    Session("rut_pro") = dr.GetValue(1).ToString()
                    Session("mail_pro") = dr.GetValue(3).ToString()
                    Session("idcond_pro") = dr.GetValue(4).ToString()
                    Session("nombr_pro") = dr.GetValue(5).ToString()
                    Session("apelli_pro") = dr.GetValue(6).ToString()
                    Session("depto_pro") = dr.GetValue(7).ToString()
                    Session("sitio_pro") = dr.GetValue(8).ToString()
                    Session("tele_pro") = dr.GetValue(9).ToString()
                    Session("clave_pro") = dr.GetValue(10).ToString()

                    Session.Timeout = 50
                    Response.Redirect("AdmEspacioUrbano.aspx")

                End If

            End If

            conn.Close()
            dr.Close()

        Else

            conn.Close()
            dr.Close()

            conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
            conector += "Database=w230416_glink;User=w230416_glink;"
            conector += "Pwd=Gorilla1985;Option=3;"

            conn = New OdbcConnection(conector)
            conn.Open()
            sql = "SELECT id, id_mall, rut, nombre, contacto, telefono, email FROM contratistas_m where email = '" & TextBox1.Text & "' and pass = '" & TextBox2.Text & "' and estado = '1'"
            comm = New OdbcCommand(sql, conn)
            dr = comm.ExecuteReader()

            If (dr.Read()) Then

                If dr.GetValue(1).ToString() = "1" Then

                    Session("id_contratista") = dr.GetValue(0).ToString()
                    Session("id_mall") = dr.GetValue(1).ToString()
                    Session("rut_contratista") = dr.GetValue(2).ToString()
                    Session("nombre_contratista") = dr.GetValue(3).ToString()
                    Session("contacto_contratista") = dr.GetValue(4).ToString()
                    Session("telefono_contratista") = dr.GetValue(5).ToString()
                    Session("email_contratista") = dr.GetValue(6).ToString()
                    Session.Timeout = 50

                    Response.Redirect("ConGlink.aspx")

                End If

                If dr.GetValue(1).ToString() = "2" Then

                    Session("id_contratista") = dr.GetValue(0).ToString()
                    Session("id_mall") = dr.GetValue(1).ToString()
                    Session("rut_contratista") = dr.GetValue(2).ToString()
                    Session("nombre_contratista") = dr.GetValue(3).ToString()
                    Session("contacto_contratista") = dr.GetValue(4).ToString()
                    Session("telefono_contratista") = dr.GetValue(5).ToString()
                    Session("email_contratista") = dr.GetValue(6).ToString()
                    Session.Timeout = 50

                    Response.Redirect("ConEspacioUrbano.aspx")

                End If

            Else

                conn.Close()
                dr.Close()

                conector = "driver={MySQL ODBC 8.0 Unicode Driver};Server=localhost;"
                conector += "Database=w230416_glink;User=w230416_glink;"
                conector += "Pwd=Gorilla1985;Option=3;"

                conn = New OdbcConnection(conector)
                conn.Open()
                sql = "SELECT id, id_mall, rut, nombre, contacto, telefono, email FROM tiendas_m where email = '" & TextBox1.Text & "' and pass = '" & TextBox2.Text & "' and estado = '1'"
                comm = New OdbcCommand(sql, conn)
                dr = comm.ExecuteReader()

                If (dr.Read()) Then

                    If dr.GetValue(1).ToString() = "1" Then

                        Session("id_contratista") = dr.GetValue(0).ToString()
                        Session("id_mall") = dr.GetValue(1).ToString()
                        Session("rut_contratista") = dr.GetValue(2).ToString()
                        Session("nombre_contratista") = dr.GetValue(3).ToString()
                        Session("contacto_contratista") = dr.GetValue(4).ToString()
                        Session("telefono_contratista") = dr.GetValue(5).ToString()
                        Session("email_contratista") = dr.GetValue(6).ToString()
                        Session.Timeout = 50

                        Response.Redirect("TieGlink.aspx")

                    End If

                    If dr.GetValue(1).ToString() = "2" Then

                        Session("id_contratista") = dr.GetValue(0).ToString()
                        Session("id_mall") = dr.GetValue(1).ToString()
                        Session("rut_contratista") = dr.GetValue(2).ToString()
                        Session("nombre_contratista") = dr.GetValue(3).ToString()
                        Session("contacto_contratista") = dr.GetValue(4).ToString()
                        Session("telefono_contratista") = dr.GetValue(5).ToString()
                        Session("email_contratista") = dr.GetValue(6).ToString()
                        Session.Timeout = 50

                        Response.Redirect("TieEspacioUrbano.aspx")

                    End If

                Else
                    ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "alertIns", "alert('Rut, Mail o Clave No Coinciden');", True)
                End If

            End If

            conn.Close()
            dr.Close()

        End If

    End Sub

End Class
