using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace ETicaret.WebUI.Models.Mapping
{
    public class SaleMap : EntityTypeConfiguration<Sale>
    {
        public SaleMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.KargoTakipNo)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Sales");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
            this.Property(t => t.SatisTarihi).HasColumnName("SatisTarihi");
            this.Property(t => t.ToplamTutar).HasColumnName("ToplamTutar");
            this.Property(t => t.SepetteMi).HasColumnName("SepetteMi");
            this.Property(t => t.ShipmentId).HasColumnName("ShipmentId");
            this.Property(t => t.OrderStateId).HasColumnName("OrderStateId");
            this.Property(t => t.KargoTakipNo).HasColumnName("KargoTakipNo");

            // Relationships
            this.HasRequired(t => t.Customer)
                .WithMany(t => t.Sales)
                .HasForeignKey(d => d.CustomerId);
            this.HasOptional(t => t.OrderState)
                .WithMany(t => t.Sales)
                .HasForeignKey(d => d.OrderStateId);
            this.HasOptional(t => t.Shipment)
                .WithMany(t => t.Sales)
                .HasForeignKey(d => d.ShipmentId);

        }
    }
}
