﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Repository;
using System;
using System.Collections.Generic;

#nullable disable

namespace SampleEntDev.Repository.Configurations
{
    public partial class UsersConfiguration : IEntityTypeConfiguration<Users>
    {
        public void Configure(EntityTypeBuilder<Users> entity)
        {
            entity.ToTable("users", "management");

            entity.Property(e => e.Id)
                .HasColumnName("id")
                .HasDefaultValueSql("nextval('management.\"User_id_seq\"'::regclass)");

            entity.Property(e => e.CreatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_date")
                .HasDefaultValueSql("CURRENT_TIMESTAMP");

            entity.Property(e => e.EMail)
                .HasColumnType("character varying")
                .HasColumnName("e_mail");

            entity.Property(e => e.IdentityNumber).HasColumnName("identity_number");

            entity.Property(e => e.IsDeleted)
                .HasColumnName("is_deleted")
                .HasDefaultValueSql("false");

            entity.Property(e => e.LastLoginDatetime)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("last_login_datetime");

            entity.Property(e => e.LastModifier)
                .HasColumnType("character varying")
                .HasColumnName("last_modifier");

            entity.Property(e => e.LastModifierId).HasColumnName("last_modifier_id");

            entity.Property(e => e.Name)
                .HasColumnType("character varying")
                .HasColumnName("name");

            entity.Property(e => e.Password)
                .HasColumnType("character varying")
                .HasColumnName("password");

            entity.Property(e => e.RecordStatus).HasColumnName("record_status");

            entity.Property(e => e.RefreshToken)
                .HasColumnType("character varying")
                .HasColumnName("refresh_token");

            entity.Property(e => e.RefreshTokenEndDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("refresh_token_end_date");

            entity.Property(e => e.Surename)
                .HasColumnType("character varying")
                .HasColumnName("surename");

            entity.Property(e => e.UpdatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updated_date");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Users> entity);
    }
}
