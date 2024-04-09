<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaymentPage.aspx.vb" Inherits="TransactionDemoVB.PaymentPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Center the form horizontally */
        form {
            text-align: center;
        }

        /* Style for form labels */
        label {
            display: block;
            margin-bottom: 5px; /* Adjust as needed */
            text-align: left; /* Align label text to left */
        }

        /* Style for form textboxes */
        input[type="text"] {
            width: 200px; /* Adjust textbox width as needed */
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* Style for form button */
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

        .container {
            border: 1px solid black;
        }

        .parent {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 500px; /* Set height of the outer div */
        }

        .container {
            width: 450px;
            height: 350px;
            border-radius: 10px;
            background-color: white
        }

        body {
            /*background-color: black;*/
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
            <div class="container">
                <h1><u>Payment Form</u></h1>
                <asp:Label runat="server">Sender ID</asp:Label>
                <asp:TextBox runat="server" ID="Sender11"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="reqdSender" runat="server" ControlToValidate="Sender11" ForeColor="Red" ErrorMessage="Sender ID can't be empty!!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ControlToValidate="Sender11" ErrorMessage="Sender ID should be a number and > 0!!" runat="server" OnServerValidate="Unnamed_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                <br />
                <br />

                <asp:Label runat="server">Receiver ID</asp:Label>
                <asp:TextBox runat="server" ID="Receiver"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="reqdReceiver" runat="server" ControlToValidate="Receiver" ForeColor="Red" ErrorMessage="Receiver ID can't be empty!!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ControlToValidate="Receiver" ErrorMessage="Receiver ID should be a number and > 0!!" runat="server" OnServerValidate="Unnamed_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                <br />

                <br />
                <asp:Label runat="server">Amount to send</asp:Label>
                <asp:TextBox runat="server" ID="Amount"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="reqdAmount" runat="server" ControlToValidate="Amount" ForeColor="Red" ErrorMessage="Amount can't be empty!!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ControlToValidate="Receiver" ErrorMessage="Amount should be a number and > 0!!" runat="server" OnServerValidate="Unnamed_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                <br />

                <br />
                <asp:Button runat="server" Text="Proceed" OnClick="Proceed_Click" /><br />
                <a class="balancePage" href="BalanceCheck.aspx">Check Balance</a><br />
                <asp:Label runat="server" ID="label_success" ForeColor="red"></asp:Label>
            </div>
        </div>
    </form>

</body>
</html>
