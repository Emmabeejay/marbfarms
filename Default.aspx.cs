using Aquafarms.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aquafarms
{
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public IQueryable<Category> GetCategories([QueryString("id")] int? categoryId, [RouteData] string categoryName)
		{
			var _db = new Aquafarms.Models.ProductContext();
			IQueryable<Category> query = _db.Categories;
			if (categoryId.HasValue && categoryId > 0)
			{
				query = query.Where(p => p.CategoryID == categoryId);
			}
			return query;
		}
	
	}
}