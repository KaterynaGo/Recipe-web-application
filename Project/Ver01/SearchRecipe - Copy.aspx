<%@ Page Title="Search Recipe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchRecipe - Copy.aspx.cs" Inherits="AddRecipe" %>

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
    <h1>Search Recipe</h1>

    <p>
        <span class="widelabel">Recipe Name:</span>
        <asp:TextBox ID="recipeNameTextBox" runat="server" />
        <br />
        <span class="widelabel">Category:</span>
        <asp:DropDownList ID="categoryList" runat="server" />
        <br />
        <span class="widelabel">Cuisine:</span>
        <asp:DropDownList ID="cuisineList" runat="server" />
        <br />
        <span class="widelabel">Cooking Time:</span>
        <asp:TextBox ID="cookingTimeTextBox" runat="server" />
        <br />
        <span class="widelabel">Portions:</span>
        <asp:TextBox ID="portionsTextBox" runat="server" />
        <br />
        <span class="widelabel">Privacy:</span>
        <asp:DropDownList ID="privacyList" runat="server">
      <%--      <asp:ListItem Text="" Value="" />--%>
            <asp:ListItem Text="Private" Value="1" />
            <asp:ListItem Text="Public" Value="0" />
        </asp:DropDownList>
        <br />
        <span class="widelabel">Description:</span>
        <asp:TextBox ID="descriptionTextBox" runat="server" />
        <br />
    </p>
    
    <p>
        <asp:Button ID="searchButton" Text="Search Recipe"
            Width="200" runat="server" OnClick="searchButton_Click" />
    </p>

    <%--For db error messages.--%>
    <p>
        <asp:Label ID="dbErrorLabel" ForeColor="Red" runat="server" />
    </p>


    <%--For displaying the results.--%>
    <div>
        <br />
        <br />
        <asp:Label ID="searchResultsLabel" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="myGridView" runat="server"></asp:GridView>
    </div>


</asp:Content>

