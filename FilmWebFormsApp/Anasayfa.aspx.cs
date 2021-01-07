using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using HtmlAgilityPack;

namespace FilmWebFormsApp
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {       
                

        }

        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var id = (e.CommandArgument.ToString());
            Response.Redirect("DahaFazlaGor.aspx?film=" + id);
        }
    }

}