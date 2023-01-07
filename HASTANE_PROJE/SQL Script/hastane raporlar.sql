--Hastalar�n TC  Kimlik Numaralar�na G�re S�rala
CREATE PROC HastaTcSiralama
as begin 
    select*from Hastalar order by HastaTcNo desc
end

--Hastalar�n 23 Ya��ndan B�y�k Olanlar�n Rapor Durumu

create proc Hasta23YasBuyukRapor
as begin
   select RaporDurumu,Count(*) from Hastalar where Yas>23 group by RaporDurumu
end

--Hastalar�n Boy Ortalamas�n� 165 cm 'in Alt�nda Olanlar�n Do�um Tarihleri

CREATE PROC HastaBoyOrtalama
as begin
   select DogumTarihi,avg(Boy) from Hastalar group by DogumTarihi having 165>avg(Boy)
end

--Hasta Ad�, TC ve �lgili Doktorun �leti�im Bilgilerini Getir

create proc HastaDoktor

as begin
   select HastaAdiSoyadi,HastaTcNo,TelefonNumarasi,Adres from Hastalar h inner join Doktorlar d on h.DoktorNo =d.DoktorNo
end

--Hastalar�n 65 Ya��ndan B�y�k Olanlar�n Rapor ve Re�ete Durumu

--create proc Hasta65Yas
--as begin select RaporDurumu,Re�ete from Hastalar where Yas>65
--end

ALTER proc [dbo].[Hasta65Yas]
as begin select Re�ete,RaporDurumu,Count(*) from Hastalar where 65>Yas group by Re�ete, RaporDurumu 
end


create proc Hasta65YasYeni
as begin select RaporDurumu,Re�ete from Hastalar where Yas>65
end


CREATE PROC hasta65YasUstuOlan
as begin
  select Count(*) from Hastalar where 65>Yas
end


 
--G�nl�k  Randevu Adet

create proc GunlukRandevuAdeti

as begin 
  select RandevuTarihi,COUNT(*) as [Randevu Tarihi] from Hastalar group by RandevuTarihi 
end

--Doktorlar�n Bakt��� hastalar

create proc DoktorHasta
as begin 
    select d.DoktorAdSoyad, h.HastaAdiSoyadi from Doktorlar d inner join Hastalar h on h.DoktorNo=d.DoktorNo order by DoktorAdSoyad 
end