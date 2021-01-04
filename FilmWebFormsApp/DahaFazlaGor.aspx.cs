using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmWebFormsApp
{
    public partial class DahaFazlaGor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filmName = Request.QueryString["film"];
            SqlDataSource1.SelectCommand = "select * from filmler where adi='" + filmName + "'";
            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conString);           
            SqlCommand videolink = new SqlCommand("select video from filmler where adi = '" + filmName + "'", sqlConnection);
            videolink.Substring(10);
            
        }
    }
}