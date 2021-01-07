<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="FilmDetay.aspx.cs" Inherits="FilmWebFormsApp.FilmDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="YENİ FİLM EKLE" CssClass="btn3" Height="49px" Width="280px" />
    <br />
    <br />

    &nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text="Aradığınız Film..."></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ARA" CssClass="btn3" Height="54px" Width="112px" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>"></asp:SqlDataSource>
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand">
        <ItemTemplate>
            <ul id="gallery">

                <li>
                    <img src="<%# Eval("resim") %>" />
                    <span>
                        <h2><%#Eval("adi")%></h2>
                        <h3><%# Eval("sure") %> dk</h3>
                        <asp:Button ID="Button3" runat="server" OnClientClick="return window.confirm('Silmek istediğinize emin misiniz?');" Text="SİL" CommandName="Sil" CommandArgument='<%#  Eval("id") %>' />
                        <asp:Button ID="Button4" runat="server" Text="GÜNCELLE" CommandName="Guncelle" CommandArgument='<%#  Eval("id") %>' />

                    </span>
                </li>
            </ul>

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
