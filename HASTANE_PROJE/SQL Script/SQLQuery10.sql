--3 tabloyu birle�tirme

select AdSoyad,DepartmanAdi,SubeAdi,Maas from Personel p inner join Departman d on p.DepartmanNo=d.DepartmanNo 
inner join Subeler s on p.PersonelNo=s.PersonelNo order by Maas desc


--full jo�n 

select AdSoyad,DepartmanAdi,Maas from Personel p full join Departman d on p.DepartmanNo=d.DepartmanNo

--cross jo�n --hepsine g�re de�erlendirir

select AdSoyad,DepartmanAdi,Maas from Personel p cross join Departman


--sat��lr personeller ve nakliyeceleri birbirine ba�layan sorgu (3 l� tablo birle�tirme)(northwindtr)

select