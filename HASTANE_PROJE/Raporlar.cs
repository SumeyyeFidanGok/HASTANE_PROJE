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
    public partial class Raporlar : Form
    {
        public Raporlar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server = DESKTOP-BQTBB5Q\\SQLEXPRESS; Database = M02; uid=sa;pwd=1;");
        private void Raporlar_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (radioButton1.Checked == true)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "YasaGoreSirala";


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;

                con.Close();
            }
            else if (radioButton2.Checked == true)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "BoyaGoreSirala";


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;

                con.Close();
            }
        }
        public void Sorgular(string proc)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = proc;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            if (comboBox1.Text == "Hastaların TC  Kimlik Numaralarına Göre Sırala")
            {
                
                Sorgular("HastaTcSiralama");

            }
            else if (comboBox1.Text == "Hastaların 23 Yaşından Büyük Olanların Rapor Durumu")
            {
                Sorgular("Hasta23YasBuyukRapor");
            }
            else if (comboBox1.Text == "Hastaların Boy Ortalamasını 165 cm 'in Altında Olanların Doğum Tarihleri")
            {
                Sorgular("HastaBoyOrtalama");
            }
            else if (comboBox1.Text == "Hasta Adı, TC ve İlgili Doktorun İletişim Bilgilerini Getir")
            {
                Sorgular("HastaDoktor");
            }
            else if (comboBox1.Text == "65 Yaş Üstünde Olan Hastalar")
            {
                Sorgular("hasta65YasUstuOlan");
            }
            else if (comboBox1.Text == "Günlük  Randevu Adet")
            {
                Sorgular("GunlukRandevuAdeti");
            }
            else if (comboBox1.Text == "Doktorların Baktığı Hastalar")
            {
                Sorgular("DoktorHasta");
            }
            con.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            AnaSayfa git = new AnaSayfa();
            git.Show();
            this.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
