
create proc yasagoresirala
as begin
select*from Hasta order by yas desc 
end

exec yasagoresirala

create proc doktorlaragorehastalar
as begin
select h.HastaAdSoyad,h.HastaTCKN,d.Unvan,d.Uzmanl�k from Doktor d inner join hasta h on d.DoktorNo=h.DoktorNo
end

exec doktorlaragorehastalar