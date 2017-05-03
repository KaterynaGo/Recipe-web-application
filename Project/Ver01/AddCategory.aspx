<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:SqlDataSource ID="categoriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="categoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
        DeleteCommand="DELETE FROM [Category] WHERE [CategoryId] = @CategoryId"
        InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)"
        SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category] WHERE ([CategoryId] = @CategoryId)"
        UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName WHERE [CategoryId] = @CategoryId">

        <DeleteParameters>
            <asp:Parameter Name="CategoryId" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
        </InsertParameters>

        <SelectParameters>
            <asp:ControlParameter ControlID="grid" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="CategoryId" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>






    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="categoriesDataSource" DataKeyNames="CategoryId">
        <Columns>
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" />
            <asp:ButtonField CommandName="Select" Text="Select" />
        </Columns>
    </asp:GridView>

    <br />
    <br />



    <asp:DetailsView ID="categoryDetailsView" runat="server" AutoGenerateRows="False" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" DataSourceID="categoryDataSource" DataKeyNames="CategoryId"
        OnItemDeleted="categoryDetails_ItemDeleted"
        OnItemInserted="categoryDetails_ItemInserted"
        OnItemUpdated="categoryDetails_ItemUpdated">

        <HeaderTemplate>
            <%#Eval("CategoryName") == null ? "Adding New Category..." : "Details of Category: " + Eval("CategoryName")%>
        </HeaderTemplate>

        <Fields>
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" ReadOnly="true" InsertVisible="False" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" />
        </Fields>
    </asp:DetailsView>




    <p>
        <asp:LinkButton ID="addCategoryButton" runat="server"
            Text="* Add New Category Here" OnClick="addCategoryButton_Click" />
    </p>
</asp:Content>

