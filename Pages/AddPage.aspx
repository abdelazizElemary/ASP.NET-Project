<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddPage.aspx.cs" Inherits="Pages_AddPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

    <link href="../CSS/Gridstyle.css" rel="stylesheet" />

    <div class="wow fadeIn productlist" id="first" runat="server">
        <asp:Button class="wow bounce button" ID="addList_btn" runat="server" Text="View Add List" OnClick="addList_btn_Click" />
        <asp:Button class="wow bounceOut button" ID="home_btn" runat="server" Text="Return Home" Width="296px" OnClick="home_btn_Click1" />
        <br />
        <br />
        &nbsp;
        </div>
      <div class="wow slideInLeft productlist" id="addlist" runat="server" visible="false">
        <asp:Button class="wow bounce button" ID="hide_btn" runat="server" Text="Hide Add List" OnClick="hide_btn_Click" />
        <asp:Button class="wow bounceOut button" ID="home_btn0" runat="server" Text="Return Home" Width="296px" OnClick="home_btn0_Click" />
        &nbsp;&nbsp;<br />
          <br />
&nbsp; <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="name_tx" runat="server" ></asp:TextBox>
          &nbsp;
          <asp:RegularExpressionValidator ID="Name_Valid" runat="server"
         ErrorMessage="Re-Enter The Product Name!" ValidationExpression="^[a-zA-Z\s]+$"
        ControlToValidate="name_tx" style="font-size: x-small; color: #CC0000; font-weight: 700
; font-style: italic"></asp:RegularExpressionValidator>
          <br />
          <br />
&nbsp;
          <asp:Label ID="Label2" runat="server" Text="Supplier"></asp:Label>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
          </asp:DropDownList>
          <br />
          <br />&nbsp;
          <asp:Label ID="Label3" runat="server" Text="Category"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:DropDownList ID="DropDownList2" runat="server">
          </asp:DropDownList>
          <br />
          <br />&nbsp;
          <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="price_tx" runat="server"></asp:TextBox>
          <br />
          <br />&nbsp;
          <asp:Label ID="Label5" runat="server" Text="Discontinuity"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:CheckBox ID="Discont_check" runat="server" />
          <br />
          <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button class="button" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
      </div>
    <div class="wow jello productlist" id="grid" runat="server" visible="true">
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="false" Width="600px" 
                      AllowPaging="true" PageSize="8"
                      CssClass="Grid"                     
                      AlternatingRowStyle-CssClass="alt"
                      OnPageIndexChanging="GridView1_PageIndexChanging"
                      PagerStyle-CssClass="pgr">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Name" />
                <asp:BoundField DataField="Company" HeaderText="Supplier Name" />
                <asp:BoundField DataField="Category" HeaderText="Category Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Discontinued" HeaderText="Discontinuity" />
            </Columns>
        </asp:GridView>
        <div class="wow slideInLeft" style="padding-left:250px"><b>Products</b></div>
    </div>        
    
</asp:Content>

