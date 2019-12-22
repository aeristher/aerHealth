using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace aerHealth_v2
{
    class Utility
    {
        public static void AddUser(string username, string password, string firstname, string lastname, string emailaddress)
        {

            using (SqlConnection openCon = new SqlConnection(ConfigurationManager.ConnectionStrings["aerHealth_v2.Properties.Settings.BRMCHospitalConnectionString"].ConnectionString))
            {


                SqlCommand querySaveStaff = new SqlCommand("INSERT into users (Username,Password,FirstName,LastName,EmailAddress) VALUES (@Username,HASHBYTES('SHA1', CONVERT(nvarchar(4000),@Password)),@FirstName,@LastName,@EmailAddress)", openCon);
                querySaveStaff.Parameters.Add("@Username", SqlDbType.VarChar);
                querySaveStaff.Parameters["@Username"].Value = username;
                querySaveStaff.Parameters.Add("@Password", SqlDbType.VarChar);
                querySaveStaff.Parameters["@Password"].Value = password;
                querySaveStaff.Parameters.Add("@FirstName", SqlDbType.VarChar);
                querySaveStaff.Parameters["@FirstName"].Value = firstname;
                querySaveStaff.Parameters.Add("@LastName", SqlDbType.VarChar);
                querySaveStaff.Parameters["@LastName"].Value = lastname;
                querySaveStaff.Parameters.Add("@EmailAddress", SqlDbType.VarChar);
                querySaveStaff.Parameters["@EmailAddress"].Value = emailaddress;

            
                //   querySaveStaff.Connection = openCon;
                //   querySaveStaff.Parameters.Add("@staffName", SqlDbType.VarChar, 30).Value = name;

                openCon.Open();
                    querySaveStaff.ExecuteNonQuery();
                openCon.Close();
                querySaveStaff.Dispose();
                  
            }

        }

        public static SqlDataReader GetAListOfUsers()
        {

            using (SqlConnection openCon = new SqlConnection())
            {
             

                using (SqlCommand querySaveStaff = new SqlCommand("select * from users"))
                {
                    querySaveStaff.Connection = openCon;

                    openCon.Open();
                    SqlDataReader results = querySaveStaff.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    return results;
                }
            }

        }


    }
}
