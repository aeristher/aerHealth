using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace aerHealth_v2
{
    public partial class Form9 : Form
    {
        public Form9()
        {
            InitializeComponent();
            timer1.Enabled = true;
            SidePanel.Height = button1.Height;
            userControl51.BringToFront();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button1.Height;
            SidePanel.Top = button1.Top;
            userControl51.BringToFront();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            DialogResult result;
            result = MessageBox.Show("Do you want to log off?", "Log Off", MessageBoxButtons.YesNo);
            switch (result)
            {
                case DialogResult.Yes:
                    break;

                case DialogResult.No: return;
            }
            this.Close();
        }


        private void timer1_Tick(object sender, EventArgs e)
        {
            string strTime;
            string strDate;

            strTime = DateTime.Now.ToLongDateString();
            strDate = DateTime.Now.ToLongTimeString();

            lblTimer.Text = strTime + "   " + strDate;
        }

        private void lblTimer_Click(object sender, EventArgs e)
        {
            lblTimer.ForeColor = Color.FromArgb(34, 36, 49);
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button2.Height;
            SidePanel.Top = button2.Top;
            userControl61.BringToFront();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button3.Height;
            SidePanel.Top = button3.Top;
            userControl31.BringToFront();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button4.Height;
            SidePanel.Top = button4.Top;
            userControl41.BringToFront();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button5.Height;
            SidePanel.Top = button5.Top;
            userControl11.BringToFront();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button6.Height;
            SidePanel.Top = button6.Top;
            about_Us1.BringToFront();
        }
    }
}
