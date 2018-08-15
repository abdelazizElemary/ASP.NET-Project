using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_DeletePage : System.Web.UI.Page
{
    public int id
    {
        set
        {
            ViewState["ProductId"] = value;
        }
        get
        {
            if (ViewState["ProductId"] == null)
                return 0;

            return Convert.ToInt32(ViewState["ProductId"]);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        using (TSQL2012Entities MyEntities = new TSQL2012Entities())
        {
            var reviews = from review in MyEntities.Products
                          select new
                          {
                              review.productid,
                              ProductName = review.productname,
                              Company = review.Supplier.companyname,
                              Category = review.Category.categoryname,
                              Price = review.unitprice,
                              Discontinued = review.discontinued
                          };
            Products.DataSource = reviews.ToList();
            Products.DataBind();


        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Products.PageIndex = e.NewPageIndex;
        bindGridView();
    }

    private void bindGridView()
    {
        using (TSQL2012Entities MyEntities = new TSQL2012Entities())
        {
            var reviews = from review in MyEntities.Products
                          select new
                          {
                              review.productid,
                              ProductName = review.productname,
                              Company = review.Supplier.companyname,
                              Category = review.Category.categoryname,
                              Price = review.unitprice,
                              Discontinued = review.discontinued
                          };
            Products.DataSource = reviews.ToList();
            Products.DataBind();

        }
    }
    protected void OnRow(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='yellow';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
        }
    }


    protected void update_Click(object sender, EventArgs e)
    {

        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        var index = gvRow.RowIndex;
        id = int.Parse((Products.DataKeys[index].Value).ToString());

        using (TSQL2012Entities myEntities = new TSQL2012Entities())
        {
            var tb = (from review in myEntities.Products
                      where review.productid == id
                      select review).SingleOrDefault();

            id_tx.Text = tb.productid.ToString();
            
        }

    }

    

    protected void deleteList_btn_Click(object sender, EventArgs e)
    {
        addlist.Visible = true;
        grid.Visible = true;
        first.Visible = false;
    }
    protected void hide_btn_Click1(object sender, EventArgs e)
    {
        first.Visible = true;
        addlist.Visible = false;
        grid.Visible = false;
    }
    protected void home_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void home_btn0_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        using (TSQL2012Entities myEntities = new TSQL2012Entities())
        {
            var del = (from review in myEntities.Products
                          where review.productid == id
                          select review).SingleOrDefault();

            myEntities.Products.Remove(del);
            myEntities.SaveChanges();
        }

        id_tx.Text = string.Empty;
    }
}