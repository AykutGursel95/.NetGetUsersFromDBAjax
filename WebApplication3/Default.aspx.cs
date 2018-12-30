using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<Users> GetUsers(string findName)
        {
            if (findName == "All")
            {
                using (AykutGurselDBEntities db = new AykutGurselDBEntities())
                {
                    List<Users> UsersList = db.Users.ToList();
                    return UsersList;
                }
            }
            else
            {
                using (AykutGurselDBEntities db = new AykutGurselDBEntities())
                {
                    List<Users> UsersList = db.
                        Users
                        .Where(x =>  x.FirstName.StartsWith(findName) ||
                                    x.LastName.StartsWith(findName) ||
                                    x.Email.StartsWith(findName) ||
                                    x.City.StartsWith(findName) ||
                                    x.County.StartsWith(findName))
                        .ToList();

                    return UsersList;
                }
            }

        }


    }
}