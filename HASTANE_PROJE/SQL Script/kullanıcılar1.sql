USE [M02]
GO
/****** Object:  StoredProcedure [dbo].[KGiris]    Script Date: 13.10.2022 09:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[KGiris]
(
@KullaniciAdi varchar(50),
@Sifre varchar(50)
)
as begin
select*from Kullanicilar where KullaniciAdi=@kullaniciAdi and Sifre=@Sifre
end