using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Xml.XPath;
using HtmlAgilityPack;

namespace FilmWebFormsApp
{
    public partial class ImdbPuan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conString);
            sqlConnection.Open();
            SqlCommand sqlcommand = new SqlCommand("select * from filmler", sqlConnection);
            SqlDataReader rd = sqlcommand.ExecuteReader();

            foreach (var item in rd)
            {
                var filmadi = rd["adi"];
                string url = "http://omdbapi.com/?apikey=8df5e7fe&r=xml&t=" + filmadi;
                var istek = HttpWebRequest.Create(url);
                istek.Method = "GET";
                string source;
                using (StreamReader reader = new StreamReader(istek.GetResponse().GetResponseStream()))
                {
                    source = reader.ReadToEnd();
                }


                XmlSerializer xmlSerializer = new XmlSerializer(typeof(Root));
                using (TextReader sReader = new StringReader(source))
                {
                    string imdbpuan;
                    var filmbilgiler = (Root)xmlSerializer.Deserialize(sReader);
                    imdbpuan = filmbilgiler.Movie.Imdbrating;

                    string baglantim = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
                    SqlConnection baglanti = new SqlConnection(baglantim);
                    baglanti.Open();
                    SqlCommand puanekle = new SqlCommand("update filmler set imdb=@imdbpuan where adi=@filmadi", baglanti);
                    puanekle.Parameters.AddWithValue("@imdbpuan", imdbpuan);
                    puanekle.Parameters.AddWithValue("@filmadi", filmadi);
                    puanekle.ExecuteNonQuery();
                    baglanti.Close();


                }


            }
            

            rd.Close();

        }

        /* 
   Licensed under the Apache License, Version 2.0

   http://www.apache.org/licenses/LICENSE-2.0
   */

        [XmlRoot(ElementName = "movie")]
        public class Movie
        {
            [XmlAttribute(AttributeName = "title")]
            public string Title { get; set; }
            [XmlAttribute(AttributeName = "year")]
            public string Year { get; set; }
            [XmlAttribute(AttributeName = "rated")]
            public string Rated { get; set; }
            [XmlAttribute(AttributeName = "released")]
            public string Released { get; set; }
            [XmlAttribute(AttributeName = "runtime")]
            public string Runtime { get; set; }
            [XmlAttribute(AttributeName = "genre")]
            public string Genre { get; set; }
            [XmlAttribute(AttributeName = "director")]
            public string Director { get; set; }
            [XmlAttribute(AttributeName = "writer")]
            public string Writer { get; set; }
            [XmlAttribute(AttributeName = "actors")]
            public string Actors { get; set; }
            [XmlAttribute(AttributeName = "plot")]
            public string Plot { get; set; }
            [XmlAttribute(AttributeName = "language")]
            public string Language { get; set; }
            [XmlAttribute(AttributeName = "country")]
            public string Country { get; set; }
            [XmlAttribute(AttributeName = "awards")]
            public string Awards { get; set; }
            [XmlAttribute(AttributeName = "poster")]
            public string Poster { get; set; }
            [XmlAttribute(AttributeName = "metascore")]
            public string Metascore { get; set; }
            [XmlAttribute(AttributeName = "imdbRating")]
            public string Imdbrating { get; set; }
            [XmlAttribute(AttributeName = "imdbVotes")]
            public string Imdbvotes { get; set; }
            [XmlAttribute(AttributeName = "imdbID")]
            public string Imdbid { get; set; }
            [XmlAttribute(AttributeName = "type")]
            public string Type { get; set; }
        }

        [XmlRoot(ElementName = "root")]
        public class Root
        {
            [XmlElement(ElementName = "movie")]
            public Movie Movie { get; set; }
            [XmlAttribute(AttributeName = "response")]
            public string Response { get; set; }
        }

    }




}

