﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="FilmWebFormsApp.Anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>" SelectCommand="SELECT * FROM [filmler]"></asp:SqlDataSource>

    <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand">
        <ItemTemplate>

            <ul id="gallery">

                <li>
                    <img src="<%# Eval("resim") %>" />
                    <span>
                        <h2><%#Eval("adi")%></h2>
                        <h3><%# Eval("sure") %> dk</h3>
                        <asp:Button ID="Button1" runat="server" Text="daha fazlası için tıklayın" CommandName="Detay" CommandArgument='<%#  Eval("id") %>' />
                    </span>
                </li>
            </ul>



        </ItemTemplate>
    </asp:Repeater>


</asp:Content>

