using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Photo
    {
        public Photo()
        {
            this.Categories = new List<Category>();
            this.Marks = new List<Mark>();
        }

        public int Id { get; set; }
        public string BuyukYol { get; set; }
        public string OrtaYol { get; set; }
        public string KucukYol { get; set; }
        public Nullable<bool> Varsayilan { get; set; }
        public Nullable<byte> SiraNo { get; set; }
        public Nullable<int> ProductId { get; set; }
        public virtual ICollection<Category> Categories { get; set; }
        public virtual ICollection<Mark> Marks { get; set; }
        public virtual Product Product { get; set; }
    }
}
