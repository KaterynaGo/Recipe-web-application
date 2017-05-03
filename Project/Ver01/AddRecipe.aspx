<%@ Page Title="Add Recipe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

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
    <h1>Add Recipe</h1>

    <p>
        <span class="widelabel">Recipe Name:</span>
        <asp:TextBox ID="recipeNameTextBox" runat="server" />
        <asp:RequiredFieldValidator ID="recipeNameRequiredFieldValidator" ForeColor="Red" runat="server" ErrorMessage="* Recipe name is required." ControlToValidate="recipeNameTextBox" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <span class="widelabel">Category:</span>
        <asp:DropDownList ID="categoryList" runat="server" />
        <br />
        <span class="widelabel">Cuisine:</span>
        <asp:DropDownList ID="cuisineList" runat="server" />
        <br />
        <span class="widelabel">Cooking Time:</span>
        <asp:TextBox ID="cookingTimeTextBox" runat="server" />
        <asp:RequiredFieldValidator ID="cookingTimeRequiredFieldValidator" ForeColor="Red" runat="server" ErrorMessage="* Cooking time is required." ControlToValidate="cookingTimeTextBox" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cookingTimeCompareValidator" runat="server" ForeColor="Red" ErrorMessage="* Cooking time should be greater than 0." Type="Integer" ControlToValidate="cookingTimeTextBox" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
        <br />
        <span class="widelabel">Portions:</span>
        <asp:TextBox ID="portionsTextBox" runat="server" />
        <asp:RequiredFieldValidator ID="portionsRequiredFieldValidator" ForeColor="Red" runat="server" ErrorMessage="* Portions is required." ControlToValidate="portionsTextBox" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="portionsCompareValidator" runat="server" ForeColor="Red" ErrorMessage="* Portions should be greater than 0." Type="Integer" ControlToValidate="portionsTextBox" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
        <br />
        <span class="widelabel">Privacy:</span>
        <asp:DropDownList ID="privacyList" runat="server">
            <asp:ListItem Text="Private" Value="1" />
            <asp:ListItem Text="Public" Value="0" />
        </asp:DropDownList>
        <br />
        <span class="widelabel">Description:</span>
        <asp:TextBox ID="descriptionTextBox" runat="server" />
        <br />
        <br />
        <span class="widelabel">Submission Date:</span>
        <asp:Calendar ID="Calendar1" runat="server" Width="100"></asp:Calendar>
    </p>
    <p>
        <asp:Button ID="addButton" Text="Add Recipe"
            Width="200" runat="server" OnClick="addButton_Click" />
    </p>


    <%--For db error messages.--%>
    <p>
        <asp:Label ID="dbErrorLabel" ForeColor="Red" runat="server" />
    </p>

    <%--For validation summary.--%>
    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
</asp:Content>

