using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Provider;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace webApplication
{
    public partial class indexweb : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection ( ConfigurationManager.ConnectionStrings["WebApp"].ConnectionString);
        String con1 = ConfigurationManager.ConnectionStrings["WebApp1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["RegistrationSuccess"] != null)
            {
                ScriptManager.RegisterStartupScript(
                    this, this.GetType(), "successPopup", "alert('RegistrationSuccessful. Please log in');", true);
                Session.Remove("RegistrationSuccess");
            }

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            String txtemail = loguserMail.Text;
            String password = logpass.Text;
            string db_password = null;
            bool db_isAdmin = false;

            lblMessageMail.Text = "";
            lblMessagePass.Text = "";

            SqlConnection conn1 = new SqlConnection(con1);

            
            String queryy = @"select password from registrationDetails where Email = @email";
            String query = @"SELECT[password], [admin] FROM registrationDetails WHERE Email = @email";
            conn1.Open();
            SqlCommand cmd = new SqlCommand(query, conn1);
            cmd.Parameters.AddWithValue("@email", txtemail);


            using (SqlDataReader reader = cmd.ExecuteReader())
                if (reader.Read()) {
                    db_password = reader["password"].ToString();
                    db_isAdmin = Convert.ToBoolean(reader["admin"]);

                    if (db_password==password)
                    {
                        if (db_isAdmin)
                        {
                            Response.Redirect("AdminHome.aspx");
                        }
                        else
                        {
                            Session["Email"] = txtemail;
                            Response.Redirect("UserHome.aspx");
                        }
                    }
                    else
                    {
                        lblMessagePass.Text = "Incorrect Password !";
                        return;
                    }
                }
                else
                {
                    lblMessageMail.Text = "Email not found !";
                    return;
                }
            conn1.Close();

            //object result = cmd.ExecuteScalar();

            //if (result != null)
            //{
            //    string dbpass = result.ToString();
            //    if (dbpass == password)
            //    {
            //        Response.Redirect("Adhome.aspx");
            //    }
            //    else
            //    {
            //        lblMessagePass.Text = "Invalid Password !";
            //    }

            //}
            //else
            //{
            //    lblMessageMail.Text = "Email not found !";
            //}




        }
    }
}