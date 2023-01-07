alter proc DEkle
(
@DoktorAdSoyad varchar(50),
@DoktorTcNo nchar(11),
@UzmanlikAlani varchar(50),
@Ünvani varchar(50),
@TelefonNumarasi nchar(11),
@Adres varchar(50),
@DogumTarihi nchar(11),
@PoliklinikNo int
)

as begin
insert into Doktorlar
(DoktorAdSoyad,DoktorTcNo,UzmanlikAlani,Ünvani,TelefonNumarasi,Adres,DogumTarihi,PoliklinikNo)
values (@DoktorAdSoyad,@DoktorTcNo,@UzmanlikAlani,@Ünvani,@TelefonNumarasi,@Adres, @DogumTarihi,@PoliklinikNo)
end

create proc DListele
as begin
select*from Doktorlar
end

create proc DYenile
(
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTcNo nchar(11),
@UzmanlikAlani varchar(50),
@Ünvani varchar(50),
@TelefonNumarasi nchar(11),
@Adres varchar(50),
@DogumTarihi nchar(11),
@PoliklinikNo int
)

as begin
update Doktorlar set DoktorAdSoyad=@DoktorAdSoyad,DoktorTcNo=@DoktorTcNo,UzmanlikAlani=@UzmanlikAlani,Ünvani=@Ünvani,
TelefonNumarasi=@TelefonNumarasi,Adres=@Adres, DogumTarihi=@DogumTarihi,PoliklinikNo=@PoliklinikNo where DoktorNo=@DoktorNo
end

create proc DSil
@DoktorNo int
as begin 
delete from Doktorlar where DoktorNo=@DoktorNo
end
