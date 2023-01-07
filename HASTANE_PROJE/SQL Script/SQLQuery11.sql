
--create proc BoyaGoreSirala
--as begin
--select *from Hastalar order by Boy asc
--end

--exec BoyaGoreSirala

--create proc YasaGoreSirala
--as begin
--select *from Hastalar order by Boy asc
--end

--exec YasaGoreSirala

create proc YasaGoreSirala
as begin
select*from Hastalar order by Yas desc 
end

exec YasaGoreSirala

create proc DoktorlaraGoreHastalar
as begin
select h.HastaAdiSoyadi,h.HastaTcNo,d.Ünvani,d.UzmanlikAlani from Doktorlar d inner join Hastalar  h on d.DoktorNo=h.DoktorNo
end

exec DoktorlaraGoreHastalar

