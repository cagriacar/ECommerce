using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class SaleDetailMap : EntityTypeConfiguration<SaleDetail>
    {
        public SaleDetailMap()
        {
            // Primary Key
            this.HasKey(t => new { t.SaleId, t.ProductId });

            // Properties
            this.Property(t => t.SaleId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ProductId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("SaleDetails");
            this.Property(t => t.SaleId).HasColumnName("SaleId");
            this.Property(t => t.ProductId).HasColumnName("ProductId");
            this.Property(t => t.Adet).HasColumnName("Adet");
            this.Property(t => t.Fiyat).HasColumnName("Fiyat");
            this.Property(t => t.Indirim).HasColumnName("Indirim");

            // Relationships
            this.HasRequired(t => t.Product)
                .WithMany(t => t.SaleDetails)
                .HasForeignKey(d => d.ProductId);
            this.HasRequired(t => t.Sale)
                .WithMany(t => t.SaleDetails)
                .HasForeignKey(d => d.SaleId);

        }
    }
}
