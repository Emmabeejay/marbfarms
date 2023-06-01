﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Aquafarms.ProductPage.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div id="TitleContent" style="text-align: center">
            <a runat="server" href="~/">
                <asp:Image  ID="Image1" runat="server" ImageUrl="~/Images/logo1.jpg" BorderStyle="None" />
            </a>
            <br />  
        </div>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>
            <div id="CategoryMenu" style="text-align: center">       
                <asp:ListView ID="categoryList"  
                    ItemType="Aquafarms.Models.Category" 
                    runat="server"
                    SelectMethod="GetCategories" >
                    <ItemTemplate>
                        <b style="font-size: large; font-style: normal">
                            <a href="<%#: GetRouteUrl("ProductsByCategoryRoute", new { categoryName = Item.CategoryName}) %>">
                            <%#: Item.CategoryName %>
                            </a>
                        </b>
                    </ItemTemplate>
                    <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>
                </asp:ListView>
            </div>
            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="ProductID" GroupItemCount="4"
                ItemType="Aquafarms.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new { productName = Item.ProductName }) %>">
                                        <img src="/Images/<%#:Item.ImagePath%>"
                                            width="300" height="200" style="padding:0px; margin:0 10px 20px 0; border: none" /></a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>">
                                        <span class="ProductName">
                                            <%#:Item.ProductName%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format( new System.Globalization.CultureInfo("en-NG"), "{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br />
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">
                                        <span class="ProductListItem">
                                            <b>Add To Cart<b>
                                        </span>           
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>