<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
        <div class="wow bounceIn content_section">
        	<div class="content_section_box margin_right_10">
            	<div class="content_section_box_bottom"></div>
                <div class="content_section_box_header">Addition</div>
                <div class="content_section_box_content">
	                <p>Add a new product to the database. </p>
                    <div class="rc_btn_01"><a href="AddPage.aspx">Submit Addition</a></div>
                </div>
            </div>
            
            <div class="wow bounceOut content_section_box margin_right_10">
            	<div class="content_section_box_bottom"></div>
                <div class="content_section_box_header">Update</div>
                <div class="content_section_box_content">
	                <p>Update a product in the database. </p>
                 	<div class="rc_btn_01"><a href="UpdatePage.aspx">Submit Update</a></div>
                </div>
            </div>
            
            <div class="wow bounceInUp content_section_box">
            	<div class="content_section_box_bottom"></div>
                <div class="content_section_box_header">Delete</div>
                <div class="content_section_box_content">
	                <p>Delete a product from the database. </p>
    	            <div class="rc_btn_01"><a href="DeletePage.aspx">Submit Deletion</a></div>
                </div>
            </div>
            
            <div class="cleaner"></div>
        </div>

</asp:Content>

