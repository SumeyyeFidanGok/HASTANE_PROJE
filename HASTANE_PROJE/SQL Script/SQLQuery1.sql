USE [M02]
GO
/****** Object:  StoredProcedure [dbo].[AramaYapDoktor]    Script Date: 14.10.2022 10:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[AramaYapDoktor]
(
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTcNo varchar(11)
)

as begin 
select * from Doktorlar where DoktorNo=@DoktorNo or DoktorAdSoyad=@DoktorAdSoyad or DoktorTcNo=@DoktorTcNo
end