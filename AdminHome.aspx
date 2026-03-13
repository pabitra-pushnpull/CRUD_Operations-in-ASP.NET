<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="webApplication.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home Page</title>
       <style>
    *{
        background-color:#D6F4ED;
    }
    .head h1
    {
        margin: 0;
        background-color: #8FABD4;
        text-align:center;
    }

    .wel h3
    {
        background-color:#87BAC3;
        text-align:center;
    }
    
    #LogOutBtn
    {
        text-align:right;
        margin-right:25px;
        margin-top:15px;
        margin-bottom:10px;
    }

    #userHomeLogoutBtn 
    {
        background-color:aliceblue;
        height: 25px;
        width:70px;
    }

    .data-Table {
        margin-left: 350px;
        margin-top:10px;
    }
    #adminInsertBtn
    {
        margin-top:120px;
        margin-left:580px;
        margin-bottom:0;
    }

    .adminRegisterBtn
    {
        background-color: forestgreen;
        color:azure;
        font-weight:600;
        font-size:medium;
        border : 2px solid black;
        width:300px;
        height : 40px;
    }
   
</style>
</head>
<body>
    <form runat="server">
       <div class="head">
        <h1>Hello Admin !!</h1>
        <div id="LogOutBtn">
            <asp:Button runat="server" Text="Logout" ID="adminHomeLogoutBtn" OnClick="adminHomeLogoutBtn_Click"/>
        </div>

</div>
<div class="wel">
    <h3>Welcome to our First Login Page</h3>
</div>

    
    <div class="data-Table">
   <asp:GridView 
    ID="gvUsers"
    runat="server"
    AutoGenerateColumns="false"
    OnRowCommand="gvUsers_RowCommand"
    BorderWidth="1"
    GridLines="Both"
    CellPadding="8"
    HeaderStyle-BackColor="#8FABD4"
    HeaderStyle-ForeColor="#000000">

    <Columns>
        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="mobile" HeaderText="Mobile" />
        <asp:BoundField DataField="password" HeaderText="Password" />
        <asp:BoundField DataField="gender" HeaderText="Gender" />

        <asp:TemplateField HeaderText="Admin">
            <ItemTemplate>
                <%# (bool)Eval("admin") ? "Yes" : "No" %>
            </ItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Actions" ControlStyle-ForeColor="#0000ff">
            <ItemTemplate>
                <asp:HyperLink 
                    ID="lnkEdit"
                    runat="server"
                    Text="Update  "
                    NavigateUrl='<%# "EditUser.aspx?Email=" + Eval("Email") %>' />

               

                 <asp:LinkButton
    ID="lnkDelete"
    runat="server"
    Text="Delete"
    CommandName="DeleteUser"
    CommandArgument='<%# Eval("Email") %>'
    OnClientClick='<%# "return confirm(\"Are you sure you want to delete user/Admin " 
                        + Eval("FullName") + "?\");" %>' />
                

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>
            

</div>
        <div class="bottom_insert">
            <asp:Button ID="adminInsertBtn" OnClick="adminInsertBtn_Click" runat="server" Text="Register a new User/Admin" CssClass="adminRegisterBtn" />
        </div>
        </form>
</body>
</html>
