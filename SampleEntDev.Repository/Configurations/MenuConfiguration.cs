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
    public partial class MenuConfiguration : IEntityTypeConfiguration<Menu>
    {
        public void Configure(EntityTypeBuilder<Menu> entity)
        {
            entity.ToTable("menu", "management");

            entity.Property(e => e.Id)
                .HasColumnName("id")
                .HasDefaultValueSql("nextval('management.\"Menu_id_seq\"'::regclass)");

            entity.Property(e => e.CreatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_date")
                .HasDefaultValueSql("CURRENT_TIMESTAMP");

            entity.Property(e => e.Description)
                .HasColumnType("character varying")
                .HasColumnName("description");

            entity.Property(e => e.FunctionId).HasColumnName("function_id");

            entity.Property(e => e.IconPath)
                .HasColumnType("character varying")
                .HasColumnName("icon_path");

            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");

            entity.Property(e => e.ParentId).HasColumnName("parent_id");

            entity.Property(e => e.UpdatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updated_date");

            entity.Property(e => e.Url)
                .HasColumnType("character varying")
                .HasColumnName("url")
                .HasDefaultValueSql("'#'::character varying");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Menu> entity);
    }
}
