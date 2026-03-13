using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApplication
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected string userLogEmail
        {
            get
            {
                return Session["Email"] as string;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(userLogEmail))
            {
                Response.Redirect("indexweb.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadGridData();
            }

        }
        

        protected void userHomeLogoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("indexweb.aspx");
        }

        private void LoadGridData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["WebApp1"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM registrationDetails WHERE Email = @Email", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@Email", userLogEmail);
                DataTable dt = new DataTable();

                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }


        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                string email = e.CommandArgument.ToString();

                string connStr = ConfigurationManager
                                    .ConnectionStrings["WebApp1"]
                                    .ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand(
                        "DELETE FROM registrationDetails WHERE Email = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", email);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadGridData(); // refresh grid
            }
        }


    }
}