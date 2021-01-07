<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="FilmGuncelle.aspx.cs" Inherits="FilmWebFormsApp.FilmGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btnG").click(function () {
                var fileUpload = $("#ContentPlaceHolder1_FileUpload1").get(0);
                var files = fileUpload.files;
                var filen = files[0].name;

                var ad = $("#ContentPlaceHolder1_adi").val();
                var yon = $("#ContentPlaceHolder1_yonetmen").val();
                var tur = $("#ContentPlaceHolder1_tur").val();
                var konu = $("#ContentPlaceHolder1_ozet").val();
                var tarih = $("#ContentPlaceHolder1_vizyontarih").val();
                var sure = $("#ContentPlaceHolder1_sure").val();
                var imdb = $("#ContentPlaceHolder1_imdb").val();
                var video = $("#ContentPlaceHolder1_Video").val();
                var id = $("#ContentPlaceHolder1_Label1").text();

                console.log(ad, yon, tur, konu, sure, imdb, video, files[0].name);
                Sorgu(id, ad, yon, tur, konu, sure, tarih, imdb, video, filen);
            });
            function Sorgu(id, ad, yon, tur, konu, sure, tarih, imdb, video, file) {
                $.ajax({
                    type: 'POST',
                    url: 'FilmGuncelle.aspx/Item',
                    data: "{id:'" + id + "',ad: '" + ad + "', yonetmen: '" + yon + "',tur: '" + tur + "',tarih: '" + tarih + "',konu: '" + konu + "',sure: '" + sure + "',imdb: '" + imdb + "',video: '" + video + "',resim: '" + file + "' }",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        $('#result').html(result.d);
                        alert('Film başarıyla güncellendi.');
                    },
                    error: function () {
                        alert('Bağlantı sırasında bir sorun oluştu. Yeniden deneyin');
                    }
                });
            }

        });

    </script>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>" SelectCommand="SELECT * FROM [filmler]"></asp:SqlDataSource>
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
    <br />
    <br />
    <br />
    <div class="ekle">
        <p class="auto-style1">
            <br />
            <br />

            <p class="auto-style1">
                Film Adı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="adi" runat="server" CssClass="TextBox"></asp:TextBox>
            </p>
        <p class="auto-style1">
            Yönetmen:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="yonetmen" runat="server" CssClass="TextBox"></asp:TextBox>
        </p>

        <p class="auto-style1">
            Türü:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tur" runat="server" CssClass="TextBox"></asp:TextBox>
        </p>

        <p class="auto-style1">
            Konu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ozet" runat="server" CssClass="TextBox"></asp:TextBox>
        </p>

        <p class="auto-style1">
            Yıl:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="vizyontarih" runat="server" CssClass="TextBox"></asp:TextBox>
        </p>

        <p class="auto-style1">
            Süre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="sure" runat="server" CssClass="TextBox"></asp:TextBox>

        </p>

        <p class="auto-style1">
            Imdb Puanı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="imdb" runat="server" CssClass="TextBox"></asp:TextBox>

        </p>

        <p class="auto-style1">
            Fragman:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Video" runat="server" CssClass="TextBox"></asp:TextBox>
        </p>


        <p class="auto-style1">
            Film Afişi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="TextBox" />

        </p>

        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
   
            <input id="btnG" type="button" value="Güncelle" class="btn3" />
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#3F3F3F"></asp:Label>
        </p>
    </div>

</asp:Content>
