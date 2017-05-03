<%@ Page Title="ViewMyRecipe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewMyRecipe.aspx.cs" Inherits="ViewMyRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .widelabel {
            display: -moz-inline-block;
            display: inline-block;
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>My Recipes</h1>



    <asp:GridView ID="myGridView" runat="server"></asp:GridView>


</asp:Content>

