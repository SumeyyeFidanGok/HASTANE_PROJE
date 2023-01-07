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

namespace HASTANE_PROJE
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection("Server = DESKTOP-BQTBB5Q\\SQLEXPRESS; Database = M02; uid=sa;pwd=1;");

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KGiris";
            cmd.Parameters.AddWithValue("KullaniciAdi", textBox1.Text);
            cmd.Parameters.AddWithValue("Sifre", textBox2.Text);

            SqlDataReader Oku;
            Oku = cmd.ExecuteReader();
            if(Oku.Read())
            {
                MessageBox.Show("Giriş Yapıldı", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                AnaSayfa git = new AnaSayfa();
                git.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı Adı veya Şifre Hatalı");
                textBox1.Clear();
                textBox2.Clear();
            }
            conn.Close();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KullaniciEkle";

            cmd.Parameters.AddWithValue
            ("KullaniciAdi", textBox3.Text);
            cmd.Parameters.AddWithValue
                ("Sifre", textBox4.Text);
            cmd.Parameters.AddWithValue
                ("Email", textBox5.Text);
            cmd.Parameters.AddWithValue
                ("Telefon", maskedTextBox1.Text);

            MessageBox.Show("Kayıt Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);

            cmd.ExecuteNonQuery();
            conn.Close();

            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            maskedTextBox1.Clear();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
