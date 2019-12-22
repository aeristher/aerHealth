using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace aerHealth_v2
{
    public partial class Form8 : Form
    {
        public Form8()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 form1 = new Form1();
            form1.ShowDialog();
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection scn = new SqlConnection();
            scn.ConnectionString = @"Data Source=YEN\YEN;Initial Catalog=BRMCHospital;Integrated Security=True";
            SqlCommand scmd = new SqlCommand("select count (*) as cnt from dbo.Users where username=@usr and password=HASHBYTES('SHA1', CONVERT(nvarchar(4000),@pwd))", scn);
            scmd.Parameters.Clear();
            scmd.Parameters.AddWithValue("@usr", usr.Text);
            scmd.Parameters.AddWithValue("@pwd", password.Text);
            scn.Open();

            if (scmd.ExecuteScalar().ToString() == "1")
            {
                //  MessageBox.Show("Welcome!");
                this.Hide();
                Form5 form5 = new Form5();
                form5.ShowDialog();
                this.Close();
            }
            else
            {
                // MessageBox.Show("Your login credentials is incorrect. Please try again.");
               
                usr.Clear();
                password.Clear();


            }
            scn.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //this.Hide();
            //Form3 form3 = new Form3();
            //form3.ShowDialog();
            //this.Close();
        }
    }
}
