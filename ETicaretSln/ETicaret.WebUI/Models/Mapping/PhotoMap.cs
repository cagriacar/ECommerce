using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class PhotoMap : EntityTypeConfiguration<Photo>
    {
        public PhotoMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.BuyukYol)
                .HasMaxLength(250);

            this.Property(t => t.OrtaYol)
                .HasMaxLength(250);

            this.Property(t => t.KucukYol)
                .HasMaxLength(250);

            // Table & Column Mappings
            this.ToTable("Photos");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.BuyukYol).HasColumnName("BuyukYol");
            this.Property(t => t.OrtaYol).HasColumnName("OrtaYol");
            this.Property(t => t.KucukYol).HasColumnName("KucukYol");
            this.Property(t => t.Varsayilan).HasColumnName("Varsayilan");
            this.Property(t => t.SiraNo).HasColumnName("SiraNo");
            this.Property(t => t.ProductId).HasColumnName("ProductId");

            // Relationships
            this.HasRequired(t => t.Product)
                .WithMany(t => t.Photos)
                .HasForeignKey(d => d.ProductId);

        }
    }
}
