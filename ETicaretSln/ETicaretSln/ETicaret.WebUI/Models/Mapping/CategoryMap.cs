using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class CategoryMap : EntityTypeConfiguration<Category>
    {
        public CategoryMap()
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
            this.ToTable("Categories");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Adi).HasColumnName("Adi");
            this.Property(t => t.Aciklama).HasColumnName("Aciklama");
            this.Property(t => t.PhotoId).HasColumnName("PhotoId");

            // Relationships
            this.HasOptional(t => t.Photo)
                .WithMany(t => t.Categories)
                .HasForeignKey(d => d.PhotoId);

        }
    }
}