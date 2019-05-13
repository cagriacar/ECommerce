using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class User
    {
        public User()
        {
            this.Roles = new List<Role>();
        }

        public System.Guid Id { get; set; }
        public string Adi { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
    }
}
