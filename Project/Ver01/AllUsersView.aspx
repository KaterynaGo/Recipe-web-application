<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AllUsersView.aspx.cs" Inherits="AllUsersView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="usersDataSource">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" />
            <asp:ButtonField CommandName="Select" Text="Select" />
        </Columns>
    </asp:GridView>

<asp:SqlDataSource ID="usersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT [UserName], [LastActivityDate] FROM [aspnet_Users]"></asp:SqlDataSource>
</asp:Content>

