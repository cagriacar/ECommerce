using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class FeatureValueMap : EntityTypeConfiguration<FeatureValue>
    {
        public FeatureValueMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Adi)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Aciklama)
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("FeatureValues");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Adi).HasColumnName("Adi");
            this.Property(t => t.Aciklama).HasColumnName("Aciklama");
            this.Property(t => t.FeatureTypeId).HasColumnName("FeatureTypeId");

            // Relationships
            this.HasRequired(t => t.FeatureType)
                .WithMany(t => t.FeatureValues)
                .HasForeignKey(d => d.FeatureTypeId);

        }
    }
}
