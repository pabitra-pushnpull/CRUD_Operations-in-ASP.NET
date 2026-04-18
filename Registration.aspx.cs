using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApplication
{
    public partial class Registration : System.Web.UI.Page
    {
        String con = ConfigurationManager.ConnectionStrings["WebApp"].ConnectionString;
        String con1 = ConfigurationManager.ConnectionStrings["WebApp1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblMessagePassword.Text = "";
            lblMessageMobile.Text = "";
            lblMessageRegister.Text = "";
            lblMessageDDL.Text = "";

            string fullName = txtName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string conPass = txtConfirmPassword.Text;
            string gender = ddlGender.Text;
            string mob = txtMobile.Text;
           


            if (password != conPass)
            {
                lblMessagePassword.Text = "Password and Confirm Password do not match !! ";
                return;
            }

            if (mob.Length != 10 || !mob.All(char.IsDigit))
            {
                lblMessageMobile.Text = "Mobile Number must be of exactly 10 digits.";
                return;
            }

            if (gender.Equals(" !!Select any one!! "))
            {
                lblMessageDDL.Text = "Please Select a Valid Gender!";
                
                return;
            }

            if (string.IsNullOrEmpty(rblIsAdmin.SelectedValue))
            {
                lblMsgAdmin.Text = "Please select any one option!";
                return;
            }

            int admin = int.Parse(rblIsAdmin.SelectedValue);
            
            if (!(admin == 1 || admin == 0))
            {
                lblMsgAdmin.Text = "Please select any one option !";
                return ;
            }
            

            using (SqlConnection conn1 = new SqlConnection(con1))
            {
                conn1.Open();
                String query = "INSERT INTO registrationDetails (FullName, Email, password, gender, mobile, admin) values (@FullName,@Email,@Password,@gender,@mobile,@admin); ";
                String query1 = "INSERT INTO registrationDetails (FullName, Email) values ('" + fullName + "','" + email + "') ";

                SqlCommand cmd = new SqlCommand(query, conn1);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@mobile", mob);
                cmd.Parameters.AddWithValue("@admin", admin);

                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Session["RegistrationSuccess"] = true;
                    Response.Redirect("indexweb.aspx");
                }
                else
                {
                    lblMessageRegister.Text = "Something went wrong. Please try again.";
                }


                conn1.Close();
            }
        }
    }
}
