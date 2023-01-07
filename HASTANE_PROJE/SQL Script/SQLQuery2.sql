USE [M02]
GO
/****** Object:  StoredProcedure [dbo].[AramaYapDoktorNoyaGöre]    Script Date: 14.10.2022 10:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[AramaYapDoktorNoyaGöre]
(
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTcNo varchar(11)

)
as begin 
select * from Doktorlar where DoktorNo=@DoktorNo or DoktorAdSoyad=@DoktorAdSoyad or DoktorTcNo=@DoktorTcNo
end