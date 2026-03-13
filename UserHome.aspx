<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="webApplication.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Home Page</title>
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
    margin-left: 440px;
    margin-top:20px;
}
</style>
</head>
<body>
    <form runat="server">
    <div class="head">
        
            <h1>Hello User !!</h1>
            <div id="LogOutBtn">
                <asp:Button runat="server" Text="Logout" ID="userHomeLogoutBtn" OnClick="userHomeLogoutBtn_Click"/>
            </div>

        
    </div>
    <div class="wel">
        <h3>Welcome to our First Login Page</h3>
    </div>
    

     <div class="data-Table" runat="server">
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

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>
            

</div>
        </form>
</body>
</html>
