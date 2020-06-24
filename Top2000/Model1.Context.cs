﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Top2000
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Artist> Artists { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Song> Songs { get; set; }
        public virtual DbSet<SongRank> SongRanks { get; set; }
        public virtual DbSet<User> Users { get; set; }
    
        public virtual int spInsertNewRankEntry(Nullable<int> songID, Nullable<int> year, Nullable<int> rank)
        {
            var songIDParameter = songID.HasValue ?
                new ObjectParameter("SongID", songID) :
                new ObjectParameter("SongID", typeof(int));
    
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            var rankParameter = rank.HasValue ?
                new ObjectParameter("Rank", rank) :
                new ObjectParameter("Rank", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spInsertNewRankEntry", songIDParameter, yearParameter, rankParameter);
        }
    
        public virtual int spInsertNewSong(string title, Nullable<System.DateTime> releaseDate)
        {
            var titleParameter = title != null ?
                new ObjectParameter("Title", title) :
                new ObjectParameter("Title", typeof(string));
    
            var releaseDateParameter = releaseDate.HasValue ?
                new ObjectParameter("ReleaseDate", releaseDate) :
                new ObjectParameter("ReleaseDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spInsertNewSong", titleParameter, releaseDateParameter);
        }
    
        public virtual ObjectResult<spNumberOfSongsOfArtist_Result> spNumberOfSongsOfArtist()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spNumberOfSongsOfArtist_Result>("spNumberOfSongsOfArtist");
        }
    
        public virtual ObjectResult<spSelectAllArtists_Result> spSelectAllArtists()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spSelectAllArtists_Result>("spSelectAllArtists");
        }
    
        public virtual ObjectResult<spSelectAllTitles_Result> spSelectAllTitles()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spSelectAllTitles_Result>("spSelectAllTitles");
        }
    
        public virtual ObjectResult<spSelectListingOnYear_Result> spSelectListingOnYear(Nullable<int> year)
        {
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spSelectListingOnYear_Result>("spSelectListingOnYear", yearParameter);
        }
    
        public virtual ObjectResult<spSelectSearchedArtist_Result> spSelectSearchedArtist(string artistName)
        {
            var artistNameParameter = artistName != null ?
                new ObjectParameter("ArtistName", artistName) :
                new ObjectParameter("ArtistName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spSelectSearchedArtist_Result>("spSelectSearchedArtist", artistNameParameter);
        }
    
        public virtual ObjectResult<spSelectTop10ListingOnYear_Result> spSelectTop10ListingOnYear(Nullable<int> year)
        {
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spSelectTop10ListingOnYear_Result>("spSelectTop10ListingOnYear", yearParameter);
        }
    }
}