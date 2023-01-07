
select AdSoyad, Cinsiyet, Maas, DepartmanAdi,Yas from Personel p inner join Departman d on p.DepartmanNo=d.DepartmanNo

select*from Personel


--(nortwýndtr) urunler tablosuyla satýs tablosunu biribirine baðla
--ürün adý birim fiyatý miktar ve yeni satýslarý getiren sorgu

select UrunAdi,u.BirimFiyati,YeniSatis,Miktar from Urunler u inner join [Satis Detaylari] s on u.UrunID=s.UrunID

--(nortwýndtr) satýþlar ile müþteri tablosunu birbirne baðla
--satýþlardan ssatýstarihi sevk tarihi nakliyeucreti, sevkadresi
--müþterilerde müþteri adý ve ünvaný

select SatisTarihi,SevkTarihi,NakliyeUcreti,SevkAdresi,MusteriAdi,MusteriUnvani from Musteriler m inner join Satislar s on m.MusteriID=s.MusteriID


--(nortwýndtr)ürünleri tedarikçilere baðla
--ürünadý,birimdekimiktar,birimfiyatý,hedefstokdüzeti
--tedarikçiler adres ve þehir
--order by birim fiyatý desc

select U.UrunAdi, U.BirimdekiMiktar, U.BirimFiyati, U.HedefStokDuzeyi, T.Adres, T.Sehir from
Urunler U inner join 
Tedarikciler T on U.TedarikciID=T.TedarikciID order by BirimFiyati desc


