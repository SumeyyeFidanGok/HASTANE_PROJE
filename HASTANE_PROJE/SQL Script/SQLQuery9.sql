
--left join

select AdSoyad, Departman.DepartmanNo,DepartmanAdi from Personel left join Departman on Personel.DepartmanNo=Departman.DepartmanNo

select AdSoyad, Departman.DepartmanNo,DepartmanAdi from Departman left join Personel on Personel.DepartmanNo=Departman.DepartmanNo --left veya right yazabiliriz sað ve sola yazmasýdýr

select AdSoyad, Departman.DepartmanNo,DepartmanAdi from Departman right join Personel on Personel.DepartmanNo=Departman.DepartmanNo

select AdSoyad, d.DepartmanNo,DepartmanAdi from Departman d right join Personel p on p.DepartmanNo=d.DepartmanNo

select*from Departman 
select*from Personel


--müþterilerle satýþlarý baðla
--


--SELF JOÝN

select d.DepartmanAdi,d1.BagliOlduguBirim from Departman d inner join Departman d1 on d.DepartmanNo=d1.BagliOlduguBirim

select*from departman

select d.DepartmanAdi,d1.BagliOlduguBirim,d1.BirimAdi from Departman d inner join Departman d1 on d.DepartmanNo=d1.BagliOlduguBirim


