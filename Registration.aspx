<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="webApplication.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

.container {
    width: 400px;
    margin: 80px auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.input {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.dropd {
    margin-top: 5px;
    width:415px;
    height:25px;
}

.btn {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background-color: #0056b3;
}

.required {color:red;}
        .in 
        {
            width:365px;
            height:20px;
        }

.inline-rbl td {
        padding-right: 20px; 
    }

    </style>
</head>
<body>
    
    <form id="form1" runat="server">

        <div class="container">
            <h2>User Registration</h2>

            <div class="form-group">
                <label>Full Name <span class="required">*</span> </label>
                <asp:TextBox ID="txtName" runat="server" CssClass="input" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Email <span class="required">*</span></label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Password<span class="required"> *</span></label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input" required ></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Confirm Password<span class="required"> *</span></label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="input" required></asp:TextBox>
                <asp:Label ID="lblMessagePassword" runat="server" ForeColor="Red"></asp:Label>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropd"> 
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblMessageDDL" runat="server" ForeColor="Red"></asp:Label>
            </div>
   

            <div class="form-group">
                <label>Mobile Number<span class="required" > *</span></label>
                <span>+91</span><asp:TextBox ID="txtMobile" runat="server" CssClass="in"  MaxLength:10 required></asp:TextBox>
                <asp:Label ID="lblMessageMobile" runat="server" ForeColor="Red"></asp:Label>
            </div>

    <span>
    <asp:Label ID="lblAdmin" runat="server" Text="Are you a Admin?"></asp:Label>
    
    <asp:RadioButtonList ID="rblIsAdmin" runat="server" RepeatDirection="Horizontal" CssClass="inline-rbl">
        <asp:ListItem Text="Yes" Value="1"></asp:ListItem> 
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>
        <asp:Label ID="lblMsgAdmin" runat="server" ForeColor="Red"></asp:Label>
</span>          

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" /><br /><br />
            <a href="indexweb.aspx" style="margin-left:60px">Already have an Account ? Login now !</a>
            <asp:Label ID="lblMessageRegister" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>