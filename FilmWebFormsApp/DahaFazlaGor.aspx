<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="DahaFazlaGor.aspx.cs" Inherits="FilmWebFormsApp.DahaFazlaGor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>"></asp:SqlDataSource>
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>

            <link href="cardstyle.css" rel="stylesheet" />
            <div class="movie_card" id="bright">
                <div class="info_section">
                    <div class="movie_header">
                        <img class="locandina" src=" <%# Eval("resim") %>" />
                        <h1><%#  Eval("adi") %></h1>
                        <h4><%#  Eval("yonetmen") %></h4>
                        <h4><%# Eval("vizyontarih") %></h4>
                        <h4><%# Eval("imdb") %></h4>
                        <span class="minutes"><%# Eval("sure") %> dk</span>
                        <p class="type"><%# Eval("tur") %></p>
                    </div>
                    <div class="movie_desc">
                        <p class="text">
                            <%# Eval("ozet") %>
                        </p>
                        <br />
                        <iframe width="500" height="295" src="<%# Eval("video") %>"></iframe>
                    </div>




                </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
