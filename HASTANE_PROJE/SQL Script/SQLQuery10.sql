--3 tabloyu birleþtirme

select AdSoyad,DepartmanAdi,SubeAdi,Maas from Personel p inner join Departman d on p.DepartmanNo=d.DepartmanNo 
inner join Subeler s on p.PersonelNo=s.PersonelNo order by Maas desc


--full joýn 

select AdSoyad,DepartmanAdi,Maas from Personel p full join Departman d on p.DepartmanNo=d.DepartmanNo

--cross joýn --hepsine göre deðerlendirir

select AdSoyad,DepartmanAdi,Maas from Personel p cross join Departman


--satýþlr personeller ve nakliyeceleri birbirine baðlayan sorgu (3 lü tablo birleþtirme)(northwindtr)

select