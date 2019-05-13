using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class AddressMap : EntityTypeConfiguration<Address>
    {
        public AddressMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Adres)
                .IsRequired()
                .HasMaxLength(500);

            this.Property(t => t.Adi)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Addresses");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
            this.Property(t => t.Adres).HasColumnName("Adres");
            this.Property(t => t.Adi).HasColumnName("Adi");

            // Relationships
            this.HasRequired(t => t.Customer)
                .WithMany(t => t.Addresses)
                .HasForeignKey(d => d.CustomerId);

        }
    }
}
