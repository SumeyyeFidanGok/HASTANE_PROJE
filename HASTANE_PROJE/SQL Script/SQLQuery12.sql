
create proc yasagoresirala
as begin
select*from Hasta order by yas desc 
end

exec yasagoresirala

create proc doktorlaragorehastalar
as begin
select h.HastaAdSoyad,h.HastaTCKN,d.Unvan,d.Uzmanlýk from Doktor d inner join hasta h on d.DoktorNo=h.DoktorNo
end

exec doktorlaragorehastalar