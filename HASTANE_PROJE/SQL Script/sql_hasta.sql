create proc HEkle
(

@HastaAdiSoyadi varchar(50),
@HastaTcNo varchar(11),
@DogumTarihi nchar(10),
@Boy int,
@Yas int,
@Reçete int,
@RaporDurumu varchar(50),
@RandevuTarihi nchar(10),
@DoktorNo int
)

as begin
insert into Hastalar --eklemeler için
(HastaAdiSoyadi,HastaTcNo,DogumTarihi,Boy,Yas,Reçete,RaporDurumu,RandevuTarihi,DoktorNo)
values (@HastaAdiSoyadi,@HastaTcNo,@DogumTarihi,@Boy,@Yas,@Reçete,@RaporDurumu,@RandevuTarihi,@DoktorNo) --parametreli
end

create proc HListele
as begin
select*from Hastalar
end

create proc HYenile
(
@HastaNo int,
@HastaAdiSoyadi varchar(50),
@HastaTcNo varchar(11),
@DogumTarihi nchar(10),
@Boy int,
@Yas int,
@Reçete int,
@RaporDurumu varchar(50),
@RandevuTarihi nchar(10),
@DoktorNo int
)

as begin
update Hastalar set HastaAdiSoyadi=@HastaAdiSoyadi,HastaTcNo=@HastaTcNo,DogumTarihi=@DogumTarihi,Boy=@Boy,Yas=@Yas, 
Reçete=@Reçete,@RaporDurumu=@RaporDurumu,RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo where HastaNo=@HastaNo
end

create proc HSil
@HastaNo int
as begin 
delete from Hastalar where HastaNo=@HastaNo
end
