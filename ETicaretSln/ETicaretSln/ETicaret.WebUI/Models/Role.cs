using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Role
    {
        public Role()
        {
            this.Users = new List<User>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
