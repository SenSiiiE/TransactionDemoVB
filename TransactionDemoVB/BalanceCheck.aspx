<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BalanceCheck.aspx.vb" Inherits="TransactionDemoVB.BalanceCheck" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #333;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .button {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            .button:hover {
                background-color: #0056b3;
            }

        .form-container {
            width: 350px;
            height: 200px;
            margin: 0 auto;
            text-align: center; /* Align form content within the container */
            border: 1px solid black;
            border-radius: 10px;
            background-color: white
        }

        .parent {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 500px; /* Set height of the outer div */
        }

        body {
            /*background: linear-gradient(to right, #11a4f0, #aacaff);*/
            background: linear-gradient(to right, #ff0000, #ffd800);
        }
        .balancePage {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="parent">
            <div class="form-container">
                <h1>Balance Check</h1>
                <asp:Label runat="server" CssClass="label">User ID</asp:Label>
                <asp:TextBox runat="server" ID="Balance_Check" CssClass="textbox"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Balance_Check" ForeColor="Red" ErrorMessage="User ID can't be empty!!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ControlToValidate="Balance_Check" ErrorMessage="User ID should be a number and > 0!!" Display="Dynamic" ForeColor="Red" OnServerValidate="Unnamed_ServerValidate"></asp:CustomValidator><br />
                <asp:Button runat="server" ID="BalanceButton" OnClick="BalanceButton_Click" Text="Submit" CssClass="button" /><br />
                <a class="balancePage" href="PaymentPage.aspx">Send Money</a>

                <br />
                <asp:Label runat="server" ID="balance_label" CssClass="label" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </form>

</body>
</html>
