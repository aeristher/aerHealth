using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Data.SqlClient;

namespace aerHealth_v2
{
    public partial class Form1 : Form
    {
      
        static int attempt = 3;
        public Form1()
        {
            Thread t = new Thread(new ThreadStart(StartForm));
            t.Start();
            //Thread.Sleep(4500);
            InitializeComponent();
            t.Abort();
        }

        public void StartForm()
        {
            //Application.Run(new Form2());
        }


    

        private void Form1_Load(object sender, EventArgs e)
        {
        
        }

        private void textBox1_Click(object sender, EventArgs e)
        {
            


            textBox1.Clear();
            textBox1.ForeColor = Color.FromArgb(255, 165, 0);
            label2.ForeColor = Color.FromArgb(255, 165, 0);
            panel1.BackColor = Color.FromArgb(255, 165, 0);
        }

        private void textBox2_Click(object sender, EventArgs e)
        {
            textBox2.Clear();
            textBox2.ForeColor = Color.FromArgb(255, 165, 0);
            textBox2.PasswordChar = '*';
            label2.ForeColor = Color.FromArgb(255, 165, 0);
            panel2.BackColor = Color.FromArgb(255, 165, 0);
        }

        private void textBox3_Click(object sender, EventArgs e)
        {
         
        }

        private void label1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 form3 = new Form3();
            form3.ShowDialog();
            this.Close();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (attempt==0)
            {
                lbl_Msg.Text = ("        Out of Attempts");
                btnLogin.Enabled = false;
                return;
               
            }
            SqlConnection scn = new SqlConnection();
            scn.ConnectionString = @"Data Source=YEN\YEN;Initial Catalog=BRMCHospital;Integrated Security=True";
            
            SqlCommand scmd = new SqlCommand("select count (*) as cnt from dbo.Users where username=@usr and password=HASHBYTES('SHA1', CONVERT(nvarchar(4000),@pwd))", scn);
            scmd.Parameters.Clear();
            scmd.Parameters.AddWithValue("@usr", textBox1.Text);
            scmd.Parameters.AddWithValue("@pwd", textBox2.Text);
            scn.Open();

            if (scmd.ExecuteScalar().ToString() =="1")
            {
              //  MessageBox.Show("Welcome!");
                this.Hide();
                Form6 form6 = new Form6();
                form6.ShowDialog();
                this.Close();
            }
            else
            {
               // MessageBox.Show("Your login credentials is incorrect. Please try again.");
                lbl_Msg.Text = ("You have" + " " + Convert.ToString(attempt) + " attempts left.");
                --attempt;
                textBox1.Clear();
                textBox2.Clear();

           
            }
            scn.Close();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form8 form8 = new Form8();
            form8.ShowDialog();
            this.Close();
        }
    }
}
