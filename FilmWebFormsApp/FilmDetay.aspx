<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="FilmDetay.aspx.cs" Inherits="FilmWebFormsApp.FilmDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="YENİ FİLM EKLE" />
    <br />
    <br />
    ARADIĞINIZ FİLM :&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ARA" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>"></asp:SqlDataSource>
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand">
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
                <asp:Button ID="Button3" runat="server" OnClientClick="return window.confirm('Silmek istediğinize emin misiniz?');" Text="SİL" CommandName="Sil" CommandArgument='<%#  Eval("adi") %>' />
                <asp:Button ID="Button4" runat="server" Text="GÜNCELLE" CommandName="Guncelle" CommandArgument='<%#  Eval("adi") %>' />

            </div>

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
