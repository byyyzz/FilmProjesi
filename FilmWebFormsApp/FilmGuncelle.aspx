<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="FilmGuncelle.aspx.cs" Inherits="FilmWebFormsApp.FilmGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>" SelectCommand="SELECT * FROM [filmler]"></asp:SqlDataSource>
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
    <br />
    <br />
    <br />
    <div class="ekle">
        <p class="auto-style1">
            <br />
            <br />

        </p>
        <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style1">
            Film Adı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="adi" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Yönetmen:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="yonetmen" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Film Türü:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="tur" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Konu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:TextBox ID="ozet" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Vizyon Tarihi:&nbsp;&nbsp;
    <asp:TextBox ID="vizyontarih" runat="server" type="date"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Süresi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="sure" runat="server"></asp:TextBox>
        &nbsp;</p>
            <p class="auto-style1">
    Imdb Puanı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="imdb" runat="server" ></asp:TextBox>
</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="GÜNCELLE" OnClick="Button1_Click" />
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
    </div>

</asp:Content>
