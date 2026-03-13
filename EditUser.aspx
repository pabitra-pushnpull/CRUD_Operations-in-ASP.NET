<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="webApplication.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f4f6f8;
        }
        .card {
            width: 420px;
            margin: 40px auto;
            background: white;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,.15);
        }
        .form-group {
            margin-bottom: 14px;
        }
        label {
            font-weight: bold;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 7px;
            margin-top: 4px;
        }
        .readonly {
            background-color: #eeeeee;
            cursor: not-allowed;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">

    <div class="card">
        <h2>Edit User</h2>

        <div class="form-group">
            <label>Email (Read Only)</label>
            <asp:TextBox ID="txtEmail" runat="server"
                CssClass="readonly" ReadOnly="true" />
        </div>

        <div class="form-group">
            <label>Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" />
        </div>

        <div class="form-group">
            <label>Mobile</label>
            <asp:TextBox ID="txtMobile" runat="server" />
            <asp:Label ID="lblMsgMob" runat="server" ForeColor="Red"></asp:Label>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
        </div>

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />

        <div class="form-group">
    <label>Gender</label>
    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropd"> 
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        <asp:ListItem>Others</asp:ListItem>
    </asp:DropDownList>
    
</div>


        <div class="form-group">
    <label>Admin</label><br />
    <asp:RadioButtonList ID="rblAdmin" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="Yes" Value="1" />
        <asp:ListItem Text="No" Value="0" />
    </asp:RadioButtonList>
</div>

        <div class="buttons">
            <asp:Button ID="btnUpdate" runat="server" Text="Update"
                OnClick="btnUpdate_Click" />
            &nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                PostBackUrl="~/indexweb.aspx" />
        </div>
    </div>

</form>


</body>
</html>
