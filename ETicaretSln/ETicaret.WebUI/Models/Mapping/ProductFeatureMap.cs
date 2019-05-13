using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class ProductFeatureMap : EntityTypeConfiguration<ProductFeature>
    {
        public ProductFeatureMap()
        {
            // Primary Key
            this.HasKey(t => new { t.ProductId, t.FeatureTypeId, t.FeatureValueId });

            // Properties
            this.Property(t => t.ProductId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.FeatureTypeId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.FeatureValueId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("ProductFeatures");
            this.Property(t => t.ProductId).HasColumnName("ProductId");
            this.Property(t => t.FeatureTypeId).HasColumnName("FeatureTypeId");
            this.Property(t => t.FeatureValueId).HasColumnName("FeatureValueId");

            // Relationships
            this.HasRequired(t => t.FeatureType)
                .WithMany(t => t.ProductFeatures)
                .HasForeignKey(d => d.FeatureTypeId);
            this.HasRequired(t => t.FeatureValue)
                .WithMany(t => t.ProductFeatures)
                .HasForeignKey(d => d.FeatureValueId);
            this.HasRequired(t => t.Product)
                .WithMany(t => t.ProductFeatures)
                .HasForeignKey(d => d.ProductId);

        }
    }
}
