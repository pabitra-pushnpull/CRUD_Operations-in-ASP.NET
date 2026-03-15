    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indexweb.aspx.cs" Inherits="webApplication.indexweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        * 
        {
             font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }
        body {
   
    font-family: Arial, sans-serif;

    //customized fonts
}

.login-box {
    width: 300px;
    background: white;
    padding: 25px;
    margin: 100px auto;
    border-radius: 8px;
    text-align: center;
    border:solid;
    margin-top:225px;
}

.login-box h2 {
    margin-bottom: 20px;
}

.login-box input {
    width: 90%;
    margin: 10px 0;
    padding: 8px;
}

.login-box button {
    width: 95%;
    padding: 10px;
    background: #3f51b5;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.lbl{
    text-align:left
}
        
    </style>
</head>
<body>
    
    <form id="form1" runat="server">

    <div class="login-box">
    <h2>Login</h2><hr />
        <div class="lbl">
            <asp:Label>E-Mail</asp:Label>
            <asp:TextBox runat="server" ID="loguserMail" TextMode="Email" placeholder="abc@email.com"></asp:TextBox>
            <asp:Label ID="lblMessageMail" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <div class="lbl">
            <asp:Label>Password</asp:Label>
            <asp:TextBox runat="server" ID="logpass" TextMode="Password" placeholder="pass"></asp:TextBox>
            <asp:Label ID="lblMessagePass" runat="server" ForeColor="Red"></asp:Label>
        </div>
    <p> Register for a new Account ? <a href="Registration.aspx">Click Me</a></p> 
    <a href="ForgotPass.html">Forgot Password !</a>
        <asp:Button Text="Login" runat="server" OnClick="Unnamed_Click"/>
        
       
    </div>
      </form>

</body>
    </html>
