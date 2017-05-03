<%@ Page Title="Dorknozzle Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Login</h1>
    <asp:Login ID="Login1" runat="server">
    </asp:Login>

    Don't have an account?  <asp:HyperLink ID="HyperLink1" NavigateUrl="SignUp.aspx"  runat="server">Sign Up</asp:HyperLink>
</asp:Content>

