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
using System.Net.Mail;
using System.Net;

namespace aerHealth_v2
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            button3.Enabled = true;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            button3.Enabled = true;
        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
          
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void textBox6_ControlAdded(object sender, ControlEventArgs e)
        {
           
        }

        private void textBox6_Click(object sender, EventArgs e)
        {
          
        }

        private void textBox7_Click(object sender, EventArgs e)
        {
            textBox7.Clear();
            textBox7.ForeColor = Color.FromArgb(255, 165, 0);
            panel27.BackColor = Color.FromArgb(255,255,255);
            label3.ForeColor = Color.FromArgb(255, 165, 0);
        }

        private void textBox2_Click(object sender, EventArgs e)
        {
            textBox2.Clear();
            textBox2.ForeColor = Color.FromArgb(255, 165, 0);
            panel1.BackColor = Color.FromArgb(255, 165,0);
            label3.ForeColor = Color.FromArgb(255, 165, 0);
        }

        private void textBox5_Click(object sender, EventArgs e)
        {
            textBox5.Clear();
            textBox5.ForeColor = Color.FromArgb(255, 165, 0);
            panel23.BackColor = Color.FromArgb(255, 165, 0);
            label3.ForeColor = Color.FromArgb(255, 165, 0);
        }

        private void textBox1_Click(object sender, EventArgs e)
        {
       
        }

        private void textBox4_Click(object sender, EventArgs e)
        {
            
        }

        private void textBox3_Click(object sender, EventArgs e)
        {
           
        }

        private void textBox6_Click_1(object sender, EventArgs e)
        {
            textBox6.Clear();
            textBox6.ForeColor = Color.FromArgb(255, 165, 0);
            textBox6.PasswordChar = '*';
            panel2.BackColor = Color.FromArgb(255, 255, 255);
            label3.ForeColor = Color.FromArgb(255, 165, 0);
        }

        private void textBox8_Click(object sender, EventArgs e)
        {
            textBox8.Clear();
            textBox8.ForeColor = Color.FromArgb(255, 165, 0);
            textBox8.PasswordChar = '*';
            panel2.BackColor = Color.FromArgb(255, 165, 0);
            label3.ForeColor = Color.FromArgb(255, 165, 0);
        }

        private void label1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 form1 = new Form1();
            form1.ShowDialog();
            this.Close();
        }

        private void textBox1_Click_1(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox1.ForeColor = Color.FromArgb(255, 165, 0);
            panel2.BackColor = Color.FromArgb(255, 255, 255);
            label3.ForeColor = Color.FromArgb(255, 165, 0);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string strEmail = textBox1.Text;
            string strUser = textBox5.Text;
        


            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("pittcist@gmail.com");
            mail.To.Add(new MailAddress(strEmail));
            mail.Subject = "Welcome to aerHealth";
            mail.Body = "Congratulations, " + strUser + "!!!" + "\n" + "You are one step closer to getting the best care that you deserve!" +
                "\n" + "Please select an appointment time in the navigation menu. Our physicians are the best-of-the-line and they will take excellent care of you! "
                + "\n"
                + "\n"
                + "Sincerely," + "\n" + "Aristher :)"
                

                
                ;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("pittcist@gmail.com", "pittcist0265");

            try
            {
                smtp.Send(mail);
               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }



            button3.Enabled = false;

            SqlConnection scn = new SqlConnection();
            scn.ConnectionString = @"Data Source=YEN\YEN;Initial Catalog=BRMCHospital;Integrated Security=True";

            string query = "Select * from users where username='" + textBox2.Text + "'";

            SqlDataAdapter sda = new SqlDataAdapter(query, scn);

            DataTable dtbl = new DataTable();

            sda.Fill(dtbl);

            if (dtbl.Rows.Count > 0)
            {
                MessageBox.Show("Please choose a different username");

                return;
            }
         
            else if (textBox5.Text == "" || textBox7.Text == "" || textBox2.Text == "" || textBox1.Text == "" || textBox6.Text == "" || textBox8.Text == "")
            {
                MessageBox.Show("Please do not leave any fields blank.");

                return;
            }
           else if (textBox5.Text == "First Name" || textBox7.Text == "Last Name" || textBox2.Text == "Username" || textBox1.Text == "E-mail" ||textBox6.Text == "Password" || textBox8.Text == "Re-type Password")
            {
                MessageBox.Show("Please enter values for the required fields");
                return;
            }
           
           else if (textBox8.Text != textBox6.Text)
            {
                MessageBox.Show("Passwords do not match.");
       
                return;
            }
            else
            {
                Utility.AddUser(textBox2.Text, textBox6.Text, textBox5.Text, textBox7.Text, textBox1.Text);
            }

            //  Utility.AddUser(textBox2.Text, textBox6.Text, textBox5.Text, textBox7.Text, textBox1.Text);
            this.Hide();
            Form4 form4 = new Form4();
            form4.ShowDialog();
            this.Close();

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            button3.Enabled = true;
        }

        private void textBox6_TextChanged_1(object sender, EventArgs e)
        {
            button3.Enabled = true;
        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {
            button3.Enabled = true;
        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {
            button3.Enabled = true;
        }
    }

    
}
