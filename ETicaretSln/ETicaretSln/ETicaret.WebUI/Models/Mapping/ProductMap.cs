using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class ProductMap : EntityTypeConfiguration<Product>
    {
        public ProductMap()
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
            this.ToTable("Products");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Adi).HasColumnName("Adi");
            this.Property(t => t.Aciklama).HasColumnName("Aciklama");
            this.Property(t => t.AlisFiyati).HasColumnName("AlisFiyati");
            this.Property(t => t.SatisFiyati).HasColumnName("SatisFiyati");
            this.Property(t => t.EklenmeTarihi).HasColumnName("EklenmeTarihi");
            this.Property(t => t.SonKullanmaTarihi).HasColumnName("SonKullanmaTarihi");
            this.Property(t => t.CategoryId).HasColumnName("CategoryId");
            this.Property(t => t.MarkId).HasColumnName("MarkId");

            // Relationships
            this.HasRequired(t => t.Category)
                .WithMany(t => t.Products)
                .HasForeignKey(d => d.CategoryId);
            this.HasRequired(t => t.Mark)
                .WithMany(t => t.Products)
                .HasForeignKey(d => d.MarkId);

        }
    }
}
