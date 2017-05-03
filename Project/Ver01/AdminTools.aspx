<%@ Page Title="Dorknozzle Admin Tools" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminTools.aspx.cs" Inherits="AdminTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .widelabel {
            display: -moz-inline-block;
            display: inline-block;
            width: 100px;
        }

        h1 {
            font-size: 25px;
            background-color: aqua;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Admin Tools</h1>
    <p>
        <asp:Label ID="dbErrorLabel" ForeColor="Red" runat="server" />
        Select an employee to update:<br />
        <asp:DropDownList ID="employeesList" runat="server" />
        <asp:Button ID="selectButton" Text="Select" runat="server" OnClick="selectButton_Click" />
    </p>
    <p>
        <span class="widelabel">Name:</span>
        <asp:TextBox ID="nameTextBox" runat="server" />
        <br />
        <span class="widelabel">User Name:</span>
        <asp:TextBox ID="userNameTextBox" runat="server" />
        <br />
        <span class="widelabel">Address:</span>
        <asp:TextBox ID="addressTextBox" runat="server" />
        <br />
        <span class="widelabel">City:</span>
        <asp:TextBox ID="cityTextBox" runat="server" />
        <br />
        <span class="widelabel">State:</span>
        <asp:TextBox ID="stateTextBox" runat="server" />
        <br />
        <span class="widelabel">Zip:</span>
        <asp:TextBox ID="zipTextBox" runat="server" />
        <br />
        <span class="widelabel">Home Phone:</span>
        <asp:TextBox ID="homePhoneTextBox" runat="server" />
        <br />
        <span class="widelabel">Extension:</span>
        <asp:TextBox ID="extensionTextBox" runat="server" />
        <br />
        <span class="widelabel">Mobile Phone:</span>
        <asp:TextBox ID="mobilePhoneTextBox" runat="server" />
        <br />
    </p>
    <p>
        <asp:Button ID="updateButton" Text="Update Employee"
            Width="200" Enabled="False" runat="server" OnClick="updateButton_Click" />
    </p>
</asp:Content>

