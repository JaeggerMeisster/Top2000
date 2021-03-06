USE [Top2000]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](255) NOT NULL,
 CONSTRAINT [ARTISTS_PK] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NULL,
 CONSTRAINT [GENRES_PK] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleKey] [varchar](25) NOT NULL,
	[RoleName] [varchar](25) NULL,
 CONSTRAINT [ROLES_PK] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongID] [int] IDENTITY(1,1) NOT NULL,
	[SongTitle] [nvarchar](255) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[ExternalImageUrl] [text] NULL,
	[ExternalSampleUrl] [text] NULL,
 CONSTRAINT [SONGS_PK] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongArtist]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongArtist](
	[SongID] [int] NOT NULL,
	[ArtistID] [int] NOT NULL,
 CONSTRAINT [SongArtist_PK] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongGenre]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongGenre](
	[SongID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
 CONSTRAINT [SongGenre_PK] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongRank]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongRank](
	[Rank] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[SongID] [int] NOT NULL,
 CONSTRAINT [SongRank_PK] PRIMARY KEY CLUSTERED 
(
	[Rank] ASC,
	[Year] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](35) NOT NULL,
	[LastName] [nvarchar](35) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [USERS_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SongArtist]  WITH CHECK ADD  CONSTRAINT [SongArtist_Artist_FK] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[SongArtist] CHECK CONSTRAINT [SongArtist_Artist_FK]
GO
ALTER TABLE [dbo].[SongArtist]  WITH CHECK ADD  CONSTRAINT [SongArtist_Song_FK] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
GO
ALTER TABLE [dbo].[SongArtist] CHECK CONSTRAINT [SongArtist_Song_FK]
GO
ALTER TABLE [dbo].[SongGenre]  WITH CHECK ADD  CONSTRAINT [SongGenre_Genre_FK] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[SongGenre] CHECK CONSTRAINT [SongGenre_Genre_FK]
GO
ALTER TABLE [dbo].[SongGenre]  WITH CHECK ADD  CONSTRAINT [SongGenre_Song_FK] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
GO
ALTER TABLE [dbo].[SongGenre] CHECK CONSTRAINT [SongGenre_Song_FK]
GO
ALTER TABLE [dbo].[SongRank]  WITH CHECK ADD  CONSTRAINT [SongRank_Song_FK] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
GO
ALTER TABLE [dbo].[SongRank] CHECK CONSTRAINT [SongRank_Song_FK]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [UserRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [UserRole]
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewRankEntry]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create a rank entry
CREATE PROCEDURE [dbo].[spInsertNewRankEntry]
	@SongID integer,
	@Year integer,
	@Rank integer 
AS
	INSERT INTO SongRank (SongID, Year, Rank) VALUES (@SongID, @Year, @Rank)
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewSong]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create a song
CREATE PROCEDURE [dbo].[spInsertNewSong]
	@Title nvarchar(255),
	@ReleaseDate Date  
AS
	INSERT INTO Song (SongTitle, ReleaseDate) VALUES (@Title, @ReleaseDate)
GO
/****** Object:  StoredProcedure [dbo].[spNumberOfSongsOfArtist]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Select number of songs per artist
CREATE PROCEDURE [dbo].[spNumberOfSongsOfArtist]
AS
	SELECT
		Artist.ArtistName,
		COUNT(Song.SongID) AS 'SongCount'
	FROM
		Song 
	INNER JOIN SongArtist ON 
		Song.SongID = SongArtist.SongID 
	INNER JOIN Artist ON
		SongArtist.ArtistID = Artist.ArtistID
	GROUP BY
		Artist.ArtistName
GO
/****** Object:  StoredProcedure [dbo].[spSelectAllArtists]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Select all artists
CREATE PROCEDURE [dbo].[spSelectAllArtists]
AS   
    SELECT 
		* 
	FROM 
		Artist
GO
/****** Object:  StoredProcedure [dbo].[spSelectAllTitles]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Select all songs
CREATE PROCEDURE [dbo].[spSelectAllTitles]
AS   
    SELECT
		Song.*
	FROM 
		Song
GO
/****** Object:  StoredProcedure [dbo].[spSelectListingOnYear]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Select all songs from a year
CREATE PROCEDURE [dbo].[spSelectListingOnYear]
    @Year integer  
AS
	SELECT 
		Song.*,
		SongRank.Rank
	FROM 
		Song 
	INNER JOIN SongRank 
		ON Song.SongID = SongRank.SongID 
	WHERE 
		SongRank.Year = @Year
	ORDER BY
		SongRank.Rank
GO
/****** Object:  StoredProcedure [dbo].[spSelectSearchedArtist]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Search artist by name
CREATE PROCEDURE [dbo].[spSelectSearchedArtist]
	@ArtistName nvarchar(255)
AS
	SELECT * FROM Artist WHERE ArtistName = @ArtistName
GO
/****** Object:  StoredProcedure [dbo].[spSelectTop10ListingOnYear]    Script Date: 6/24/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Select top 10 songs by year
CREATE PROCEDURE [dbo].[spSelectTop10ListingOnYear]
	@Year integer
AS
	SELECT TOP 10
		Song.*,
		SongRank.Rank
	FROM
		Song
	INNER JOIN SongRank ON 
		Song.SongID = SongRank.SongID
	ORDER BY
		SongRank.Rank ASC
GO
