<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="Aksiyon.aspx.cs" Inherits="FilmWebFormsApp.Aksiyon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>" SelectCommand="SELECT * FROM [filmler] WHERE [tur]='Aksiyon'"></asp:SqlDataSource>
    <h2>&nbsp;&nbsp; Aksiyon Filmleri </h2>
    <br />
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
                <asp:Button ID="Button1" runat="server" Text="daha fazla görmek için tıklayın" CommandName="Detay" CommandArgument='<%#  Eval("adi") %>' />
                
            </div>
            
        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
