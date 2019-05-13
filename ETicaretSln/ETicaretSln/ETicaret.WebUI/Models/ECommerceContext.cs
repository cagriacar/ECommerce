using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using ETicaret.WebUI.Models.Mapping;

namespace ETicaret.WebUI.Models
{
    public partial class ECommerceContext : DbContext
    {
        static ECommerceContext()
        {
            Database.SetInitializer<ECommerceContext>(null);
        }

        public ECommerceContext()
            : base("Name=ECommerceContext")
        {
        }

        public DbSet<Address> Addresses { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<FeatureType> FeatureTypes { get; set; }
        public DbSet<FeatureValue> FeatureValues { get; set; }
        public DbSet<Mark> Marks { get; set; }
        public DbSet<OrderState> OrderStates { get; set; }
        public DbSet<Photo> Photos { get; set; }
        public DbSet<ProductFeature> ProductFeatures { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<SaleDetail> SaleDetails { get; set; }
        public DbSet<Sale> Sales { get; set; }
        public DbSet<Shipment> Shipments { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new AddressMap());
            modelBuilder.Configurations.Add(new CategoryMap());
            modelBuilder.Configurations.Add(new CustomerMap());
            modelBuilder.Configurations.Add(new FeatureTypeMap());
            modelBuilder.Configurations.Add(new FeatureValueMap());
            modelBuilder.Configurations.Add(new MarkMap());
            modelBuilder.Configurations.Add(new OrderStateMap());
            modelBuilder.Configurations.Add(new PhotoMap());
            modelBuilder.Configurations.Add(new ProductFeatureMap());
            modelBuilder.Configurations.Add(new ProductMap());
            modelBuilder.Configurations.Add(new RoleMap());
            modelBuilder.Configurations.Add(new SaleDetailMap());
            modelBuilder.Configurations.Add(new SaleMap());
            modelBuilder.Configurations.Add(new ShipmentMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new UserMap());
        }
    }
}
