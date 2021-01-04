<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="FilmEkle.aspx.cs" Inherits="FilmWebFormsApp.FilmEkle" UnobtrusiveValidationMode="None"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        text-align: justify;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
        Film Adı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="adi" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Film Adı Boş Geçilemez." ControlToValidate="adi"></asp:RequiredFieldValidator>
</p>
<p class="auto-style1">
    Yönetmen:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="yonetmen" runat="server"></asp:TextBox>
</p>
<p class="auto-style1">
    Film Türü:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="tur" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Film Türü Boş Geçilemez." ControlToValidate="tur"></asp:RequiredFieldValidator>
</p>
<p class="auto-style1">
    Konu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:TextBox ID="ozet" runat="server"></asp:TextBox>
</p>
<p class="auto-style1">
    Vizyon Tarihi:&nbsp;&nbsp;
    <asp:TextBox ID="vizyontarih" runat="server" type="date"></asp:TextBox>
</p>
<p class="auto-style1">
    Süresi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="sure" runat="server" ></asp:TextBox>
</p>
    <p class="auto-style1">
        Imdb Puanı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="imdb" runat="server" ></asp:TextBox>
</p>
<p class="auto-style1">
    Resim:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FileUpload ID="FileUpload1" runat="server" />
    &nbsp;</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="EKLE" OnClick="Button1_Click" />
    &nbsp;</p>
<p>
    &nbsp;</p>
</asp:Content>
