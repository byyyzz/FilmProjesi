<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="BilimKurgu.aspx.cs" Inherits="FilmWebFormsApp.BilimKurgu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>" SelectCommand="SELECT * FROM [filmler] WHERE [tur]='Bilim Kurgu'"></asp:SqlDataSource>
     <h2>&nbsp;&nbsp; Bilim Kurgu Filmleri </h2><br />
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="content">
                <img class="resim" src=" <%# Eval("resim") %>" />
                <br />
                Film Adı: <%#  Eval("adi") %>
                <br />
                Yönetmen: <%#  Eval("yonetmen") %>
                <br />
                Vizyon Tarihi: <%# Eval("vizyontarih") %>
                <br />
                Süre: <%# Eval("sure") %> dk
                <br />
                Tür: <%# Eval("tur") %>
                <br />
                 Imdb Puanı: <%# Eval("imdb") %>
                <br />
                Özet: <%# Eval("ozet") %>
                <br />

            </div>

        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
