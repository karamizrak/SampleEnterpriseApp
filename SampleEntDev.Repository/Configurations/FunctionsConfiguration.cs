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
    public partial class FunctionsConfiguration : IEntityTypeConfiguration<Functions>
    {
        public void Configure(EntityTypeBuilder<Functions> entity)
        {
            entity.ToTable("functions", "management");

            entity.Property(e => e.Id).HasColumnName("id");

            entity.Property(e => e.ActionName)
                .HasColumnType("character varying")
                .HasColumnName("action_name");

            entity.Property(e => e.AreaName)
                .HasColumnType("character varying")
                .HasColumnName("area_name");

            entity.Property(e => e.ControllerName)
                .HasColumnType("character varying")
                .HasColumnName("controller_name");

            entity.Property(e => e.CreatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_date")
                .HasDefaultValueSql("CURRENT_TIMESTAMP");

            entity.Property(e => e.FunctionName)
                .HasColumnType("character varying")
                .HasColumnName("function_name");

            entity.Property(e => e.IsDeleted)
                .HasColumnName("is_deleted")
                .HasDefaultValueSql("false");

            entity.Property(e => e.LastModifier)
                .HasColumnType("character varying")
                .HasColumnName("last_modifier");

            entity.Property(e => e.UpdatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updated_date");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Functions> entity);
    }
}
