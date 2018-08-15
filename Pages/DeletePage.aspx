<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="DeletePage.aspx.cs" Inherits="Pages_DeletePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

    <link href="../CSS/Gridstyle.css" rel="stylesheet" />

    <div class="wow fadeIn productlist" id="first" runat="server">
        <asp:Button class="wow bounce button" ID="deleteList_btn" runat="server" Text="View Delete List" OnClick="deleteList_btn_Click" />
        <asp:Button class="wow bounce button" ID="home_btn" runat="server" Text="Return Home" Width="296px" OnClick="home_btn_Click" />
        <br />
        <br />
        &nbsp;
        </div>
      <div class="wow slideInLeft productlist" id="addlist" runat="server" visible="false">
        <asp:Button class="wow bounce button" ID="hide_btn" runat="server" Text="Hide Delete List" OnClick="hide_btn_Click1" />
        <asp:Button class="wow bounce button" ID="home_btn0" runat="server" Text="Return Home" Width="296px" OnClick="home_btn0_Click" />
        &nbsp;&nbsp;<br />
          <br />
&nbsp; <asp:Label ID="Label1" runat="server" Text="Product ID"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="id_tx" runat="server" ></asp:TextBox>
          &nbsp;
          <asp:RegularExpressionValidator ID="Name_Valid" runat="server"
         ErrorMessage="Invalid!" ValidationExpression="^[1-9]\d*$"
        ControlToValidate="id_tx" style="font-size: x-small; color: #CC0000; font-weight: 700
; font-style: italic"></asp:RegularExpressionValidator>
          <br />
          <br />
          <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button class="button" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click1" />
      </div>
    <div class="wow jello productlist" id="grid" runat="server" visible="false">
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="false" Width="600px" 
                      AllowPaging="true" PageSize="8"
                      CssClass="Grid"
                      DataKeyNames="productid"
                      OnPageIndexChanging="GridView1_PageIndexChanging"                     
                      AlternatingRowStyle-CssClass="alt"
                      PagerStyle-CssClass="pgr">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Name" />
                <asp:BoundField DataField="Company" HeaderText="Supplier Name" />
                <asp:BoundField DataField="Category" HeaderText="Category Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Discontinued" HeaderText="Discontinuity" />

                <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" text="Select Row" OnClick="update_Click" ID
                        ="update_button" ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            </Columns>
        </asp:GridView>
        <div class="wow slideInLeft" style="padding-left:250px"><b>Products</b></div>
    </div>        
    

</asp:Content>

