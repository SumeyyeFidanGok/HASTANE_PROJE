--Hastalarýn TC  Kimlik Numaralarýna Göre Sýrala
CREATE PROC HastaTcSiralama
as begin 
    select*from Hastalar order by HastaTcNo desc
end

--Hastalarýn 23 Yaþýndan Büyük Olanlarýn Rapor Durumu

create proc Hasta23YasBuyukRapor
as begin
   select RaporDurumu,Count(*) from Hastalar where Yas>23 group by RaporDurumu
end

--Hastalarýn Boy Ortalamasýný 165 cm 'in Altýnda Olanlarýn Doðum Tarihleri

CREATE PROC HastaBoyOrtalama
as begin
   select DogumTarihi,avg(Boy) from Hastalar group by DogumTarihi having 165>avg(Boy)
end

--Hasta Adý, TC ve Ýlgili Doktorun Ýletiþim Bilgilerini Getir

create proc HastaDoktor

as begin
   select HastaAdiSoyadi,HastaTcNo,TelefonNumarasi,Adres from Hastalar h inner join Doktorlar d on h.DoktorNo =d.DoktorNo
end

--Hastalarýn 65 Yaþýndan Büyük Olanlarýn Rapor ve Reçete Durumu

--create proc Hasta65Yas
--as begin select RaporDurumu,Reçete from Hastalar where Yas>65
--end

ALTER proc [dbo].[Hasta65Yas]
as begin select Reçete,RaporDurumu,Count(*) from Hastalar where 65>Yas group by Reçete, RaporDurumu 
end


create proc Hasta65YasYeni
as begin select RaporDurumu,Reçete from Hastalar where Yas>65
end


CREATE PROC hasta65YasUstuOlan
as begin
  select Count(*) from Hastalar where 65>Yas
end


 
--Günlük  Randevu Adet

create proc GunlukRandevuAdeti

as begin 
  select RandevuTarihi,COUNT(*) as [Randevu Tarihi] from Hastalar group by RandevuTarihi 
end

--Doktorlarýn Baktýðý hastalar

create proc DoktorHasta
as begin 
    select d.DoktorAdSoyad, h.HastaAdiSoyadi from Doktorlar d inner join Hastalar h on h.DoktorNo=d.DoktorNo order by DoktorAdSoyad 
end