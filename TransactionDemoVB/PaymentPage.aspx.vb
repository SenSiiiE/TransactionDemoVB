Imports System.Data.SqlClient

Public Class PaymentPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Dim cs As String = "Data Source=LAPTOP-UIDHBTUM;Initial Catalog=vikash;Integrated Security=True;Encrypt=False"
    Protected Sub Proceed_Click(sender As Object, e As EventArgs)

        If User_Exists(Sender11.Text) Then
            If Balance_Available() Then
                If User_Exists(Receiver.Text) Then
                    Dim conn As SqlConnection
                    Try
                        conn = New SqlConnection(cs)
                        Dim query As String = "trans"
                        Dim cmd As SqlCommand = New SqlCommand(query, conn)

                        cmd.CommandType = System.Data.CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@sender_id", Sender11.Text)
                        cmd.Parameters.AddWithValue("@receiver_id", Receiver.Text)
                        cmd.Parameters.AddWithValue("@amount", Amount.Text)
                        conn.Open()
                        cmd.ExecuteNonQuery()
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('transaction successful!!')</script>")
                        Sender11.Text = Receiver.Text = Amount.Text = String.Empty
                        conn.Close()
                    Catch ex As Exception
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", $"<script>console.log({ex.Message})</script>")


                    End Try
                Else
                    label_success.Text = "Receiver Does not exist!!"
                End If
            Else
                label_success.Text = "Balance Insufficient!!"
            End If

        Else
            label_success.Text = "Sender does not exist!!"
        End If
    End Sub

    Private Function Balance_Available() As Boolean
        Dim conn As SqlConnection
        Try
            conn = New SqlConnection(cs)
            Dim query As String = "select * from bank where id = @sender_id and balance >= @amount;"
            Dim cmd As SqlCommand = New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@sender_id", Sender11.Text)
            cmd.Parameters.AddWithValue("@amount", Amount.Text)
            conn.Open()
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