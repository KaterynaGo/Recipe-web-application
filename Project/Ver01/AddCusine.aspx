<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCusine.aspx.cs" Inherits="AddCusine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:SqlDataSource ID="cuisinesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT [CuisineId], [CuisineName] FROM [Cuisine]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="cuisineDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
        DeleteCommand="DELETE FROM [Cuisine] WHERE [CuisineId] = @CuisineId"
        InsertCommand="INSERT INTO [Cuisine] ([CuisineName]) VALUES (@CuisineName)"
        SelectCommand="SELECT [CuisineId], [CuisineName] FROM [Cuisine] WHERE ([CuisineId] = @CuisineId)"
        UpdateCommand="UPDATE [Cuisine] SET [CuisineName] = @CuisineName WHERE [CuisineId] = @CuisineId">

        <DeleteParameters>
            <asp:Parameter Name="CuisineId" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="CuisineName" Type="String" />
        </InsertParameters>

        <SelectParameters>
            <asp:ControlParameter ControlID="grid" Name="CuisineId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="CuisineId" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>






    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="cuisinesDataSource" DataKeyNames="CuisineId">
        <Columns>
            <asp:BoundField DataField="CuisineId" HeaderText="CuisineId" />
            <asp:BoundField DataField="CuisineName" HeaderText="CuisineName" />
            <asp:ButtonField CommandName="Select" Text="Select" />
        </Columns>
    </asp:GridView>

    <br />
    <br />



    <asp:DetailsView ID="cuisineDetailsView" runat="server" AutoGenerateRows="False" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" DataSourceID="cuisineDataSource" DataKeyNames="CuisineId"
        OnItemDeleted="cuisineDetails_ItemDeleted"
        OnItemInserted="cuisineDetails_ItemInserted"
        OnItemUpdated="cuisineDetails_ItemUpdated">

        <HeaderTemplate>
            <%#Eval("CuisineName") == null ? "Adding New Cuisine..." : "Details of Cuisine: " + Eval("CuisineName")%>
        </HeaderTemplate>

        <Fields>
            <asp:BoundField DataField="CuisineId" HeaderText="CuisineId" ReadOnly="true" InsertVisible="False" />
            <asp:BoundField DataField="CuisineName" HeaderText="CuisineName" />
        </Fields>
    </asp:DetailsView>




    <p>
        <asp:LinkButton ID="addCuisineButton" runat="server"
            Text="* Add New Cuisine Here" OnClick="addCuisineButton_Click" />
    </p>
</asp:Content>


