using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
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

        }

        [WebMethod]
        public static void Item(string ad, string yonetmen, string tur, string konu, string sure, string tarih, string imdb, string video, string resim)
        {
            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {

                sqlConnection.Open();

                SqlCommand ekle = new SqlCommand("insert into filmler (adi,yonetmen,tur,ozet,sure,imdb,video,resim) values(@adi,@yonetmen,@tur,@ozet,@sure,@imdbpuan,@video,@resim)", sqlConnection);
                ekle.Parameters.AddWithValue("@adi", ad);
                ekle.Parameters.AddWithValue("@yonetmen", yonetmen);
                ekle.Parameters.AddWithValue("@tur", tur);
                ekle.Parameters.AddWithValue("@ozet", konu);
                ekle.Parameters.AddWithValue("@vizyontarih", tarih);
                ekle.Parameters.AddWithValue("@sure", sure);
                ekle.Parameters.AddWithValue("@imdbpuan", imdb);
                ekle.Parameters.AddWithValue("@resim", "img/" + resim);
                if (video != "")
                {
                    string vLink = video.Substring(32);
                    vLink = "https://www.youtube.com/embed/" + vLink;
                    ekle.Parameters.AddWithValue("@video", vLink);
                    ekle.ExecuteNonQuery();
                }
                else
                {
                    ekle.Parameters.AddWithValue("@video", video);
                    ekle.ExecuteNonQuery();
                }

            }


        }



    }
}
