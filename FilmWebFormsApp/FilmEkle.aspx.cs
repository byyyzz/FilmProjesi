using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmWebFormsApp
{
    public partial class FilmEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string video = Video.Text;
            string vLink = video.Substring(32);
            vLink = "https://www.youtube.com/embed/" + vLink;

            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {

                sqlConnection.Open();

                SqlCommand ekle = new SqlCommand("insert into filmler (adi,yonetmen,tur,ozet,vizyontarih,sure,resim,imdb,video) values(@adi,@yonetmen,@tur,@ozet,@vizyontarih,@sure,@resim,@imdbpuan,@video)", sqlConnection);
                ekle.Parameters.AddWithValue("@adi", adi.Text);
                ekle.Parameters.AddWithValue("@yonetmen", yonetmen.Text);
                ekle.Parameters.AddWithValue("@tur", tur.Text);
                ekle.Parameters.AddWithValue("@ozet", ozet.Text);
                ekle.Parameters.AddWithValue("@vizyontarih", vizyontarih.Text);
                ekle.Parameters.AddWithValue("@sure", sure.Text);
                ekle.Parameters.AddWithValue("@imdbpuan", imdb.Text);
                ekle.Parameters.AddWithValue("@video", vLink);

                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/img/") + FileUpload1.FileName);
                    string resimyolu = FileUpload1.FileName;
                    resimyolu = "img/" + resimyolu;
                    ekle.Parameters.AddWithValue("@resim", resimyolu);
                    ekle.ExecuteNonQuery();

                }
            }
            Response.Write("<script>alert('Film Başarıyla Eklendi.')</script>");


            adi.Text = "";
            yonetmen.Text = "";
            tur.Text = "";
            ozet.Text = "";
            vizyontarih.Text = "";
            sure.Text = "";
            Video.Text = "";
            imdb.Text = "";

        }
    }
}