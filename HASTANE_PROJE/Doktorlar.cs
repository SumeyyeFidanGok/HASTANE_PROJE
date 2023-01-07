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
    public partial class Doktorlar : Form
    {
        public Doktorlar()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection("Server = DESKTOP-BQTBB5Q\\SQLEXPRESS; Database = M02; uid=sa;pwd=1;");

        public void Getir()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DListele";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void button9_Click(object sender, EventArgs e)
        {
            Getir();
           
        }

        private void Doktorlar_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DoktorNoSec";

            SqlDataReader dr;

            conn.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comboBox1.Items.Add(dr["DoktorNo"]);
            }

            conn.Close();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DEkle";
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("DoktorTcNo", maskedTextBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlikAlani", textBox4.Text);
            cmd.Parameters.AddWithValue("Ünvani", textBox5.Text);
            cmd.Parameters.AddWithValue("TelefonNumarasi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("Adres", richTextBox1.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

          


        }

        private void button7_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DYenile";
            cmd.Parameters.AddWithValue("DoktorNo", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("DoktorTcNo", maskedTextBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlikAlani", textBox4.Text);
            cmd.Parameters.AddWithValue("Ünvani", textBox5.Text);
            cmd.Parameters.AddWithValue("TelefonNumarasi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("Adres", richTextBox1.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

           

        }

        private void button6_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DSil";
            cmd.Parameters.AddWithValue("DoktorNo", textBox1.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sec = dataGridView1.SelectedCells[0].RowIndex;
            textBox1.Text = dataGridView1.Rows[sec].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sec].Cells[1].Value.ToString();
            maskedTextBox2.Text = dataGridView1.Rows[sec].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sec].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[4].Value.ToString();
            maskedTextBox1.Text = dataGridView1.Rows[sec].Cells[5].Value.ToString();
            richTextBox1.Text = dataGridView1.Rows[sec].Cells[6].Value.ToString();
            dateTimePicker1.Text = dataGridView1.Rows[sec].Cells[7].Value.ToString();
            textBox7.Text = dataGridView1.Rows[sec].Cells[8].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AnaSayfa git = new AnaSayfa();
            git.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "AramaYapDoktor";
            cmd.Parameters.AddWithValue("DoktorNo", textBox6.Text);
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox3.Text);
            cmd.Parameters.AddWithValue("DoktorTcNo", maskedTextBox3.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
           
        }
    }
}
