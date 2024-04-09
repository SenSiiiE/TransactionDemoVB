Imports System.Data.SqlClient

Public Class BalanceCheck
    Inherits System.Web.UI.Page
    Dim cs As String = "Data Source=LAPTOP-UIDHBTUM;Initial Catalog=vikash;Integrated Security=True;Encrypt=False"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BalanceButton_Click(sender As Object, e As EventArgs)
        If (User_Exists(Balance_Check.Text)) Then
            Dim con As SqlConnection = New SqlConnection(cs)
            Try
                Dim query As String = "select * from bank where id = @id"
                Dim cmd As SqlCommand = New SqlCommand(query, con)
                cmd.Parameters.AddWithValue("@id", Balance_Check.Text)
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                If dr.HasRows Then
                    dr.Read()
                    balance_label.Text = "Your Balance is Rs." & dr("Balance").ToString()

                Else
                    balance_label.Text = "No balance found for the specified ID."
                End If

            Catch ex As Exception
                Console.Write(ex.Message)
            End Try
        Else
            balance_label.Text = "User does not exist!!"
        End If
    End Sub

    Protected Sub Unnamed_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Try
            If (CType(args.Value, Integer) > 0) Then
                args.IsValid = True
            Else
                args.IsValid = False
            End If
        Catch ex As Exception
            args.IsValid = False
        End Try
    End Sub

    Private Function User_Exists(ByVal s As String) As Boolean
        Dim conn As SqlConnection
        Try
            conn = New SqlConnection(cs)
            Dim query As String = "select * from bank where id = @sender_id"
            Dim cmd As SqlCommand = New SqlCommand(query, conn)
            conn.Open()
            cmd.Parameters.AddWithValue("@sender_id", CType(s, Integer))
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            If dr.HasRows Then
                Return True
            End If
            conn.Close()
        Catch ex As Exception
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", $"<script>console.log({ex.Message})</script>")
        End Try

        Return False
    End Function
End Class