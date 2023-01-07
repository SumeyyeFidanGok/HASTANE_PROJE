
select AdSoyad, Cinsiyet, Maas, DepartmanAdi,Yas from Personel p inner join Departman d on p.DepartmanNo=d.DepartmanNo

select*from Personel


--(nortw�ndtr) urunler tablosuyla sat�s tablosunu biribirine ba�la
--�r�n ad� birim fiyat� miktar ve yeni sat�slar� getiren sorgu

select UrunAdi,u.BirimFiyati,YeniSatis,Miktar from Urunler u inner join [Satis Detaylari] s on u.UrunID=s.UrunID

--(nortw�ndtr) sat��lar ile m��teri tablosunu birbirne ba�la
--sat��lardan ssat�starihi sevk tarihi nakliyeucreti, sevkadresi
--m��terilerde m��teri ad� ve �nvan�

select SatisTarihi,SevkTarihi,NakliyeUcreti,SevkAdresi,MusteriAdi,MusteriUnvani from Musteriler m inner join Satislar s on m.MusteriID=s.MusteriID


--(nortw�ndtr)�r�nleri tedarik�ilere ba�la
--�r�nad�,birimdekimiktar,birimfiyat�,hedefstokd�zeti
--tedarik�iler adres ve �ehir
--order by birim fiyat� desc

select U.UrunAdi, U.BirimdekiMiktar, U.BirimFiyati, U.HedefStokDuzeyi, T.Adres, T.Sehir from
Urunler U inner join 
Tedarikciler T on U.TedarikciID=T.TedarikciID order by BirimFiyati desc


