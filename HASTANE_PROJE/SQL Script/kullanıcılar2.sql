create proc KKaydet
(
@KullaniciAdi varchar(50),
@Sifre varchar(50),
@Email varchar(50),
@Telefon nchar(11)
)

as begin 
insert into Kullanicilar
(KullaniciAdi,Sifre,Email,Telefon)
values (@KullaniciAdi,@Sifre,@Email,@Telefon)
end

create proc KGiris
(
@KullaniciAdi varchar(50),
@Sifre varchar(50)
)
as begin
select*from Kullanicilar where KullaniciAdi=@KullaniciAdi and Sifre=@Sifre
end