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
    public partial class UserToRolesConfiguration : IEntityTypeConfiguration<UserToRoles>
    {
        public void Configure(EntityTypeBuilder<UserToRoles> entity)
        {
            entity.ToTable("user_to_roles", "management");

            entity.Property(e => e.Id)
                .HasColumnName("id")
                .HasDefaultValueSql("nextval('management.\"UserToRoles_id_seq\"'::regclass)");

            entity.Property(e => e.CreatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_date")
                .HasDefaultValueSql("CURRENT_TIMESTAMP");

            entity.Property(e => e.IsDeleted)
                .HasColumnName("is_deleted")
                .HasDefaultValueSql("false");

            entity.Property(e => e.LastModifier)
                .HasColumnType("character varying")
                .HasColumnName("last_modifier");

            entity.Property(e => e.RoleId).HasColumnName("role_id");

            entity.Property(e => e.UpdatedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updated_date");

            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.Property(e => e.ValidityPeriodEndTime)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("validity_period_end_time");

            entity.Property(e => e.ValidityPeriodStartTime)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("validity_period_start_time");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<UserToRoles> entity);
    }
}
