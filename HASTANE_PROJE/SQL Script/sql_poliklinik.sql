alter proc PEkle
(
@PoliklinikAd varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
)

as begin
insert into Poliklinikler
(PoliklinikAd,PolikinikUzmanSayisi,PoliklinikBaskani,PoliklinikBasHemsire,YatakSayisi)
values (@PoliklinikAd,@PoliklinikUzmanSayisi,@PoliklinikBaskani,@PoliklinikBasHemsire,@YatakSayisi)
end

create proc PListele
as begin
select*from Poliklinikler
end

create proc PYenile
(
@PoliklinikNo int,
@PoliklinikAd varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
)

as begin
update Poliklinikler set PoliklinikAd=@PoliklinikAd,PolikinikUzmanSayisi=@PoliklinikUzmanSayisi,PoliklinikBaskani=@PoliklinikBaskani,
PoliklinikBasHemsire=@PoliklinikBasHemsire,YatakSayisi=@YatakSayisi where PoliklinikNo=@PoliklinikNo
end

create proc PSil
@PoliklinikNo int
as begin 
delete from Poliklinikler where PoliklinikNo=@PoliklinikNo
end

exec PEkle 'as', 2, 'SA', 'F', 4

exec PSil 6

exec PListele