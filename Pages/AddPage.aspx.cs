using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AddPage : System.Web.UI.Page
{
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

            var suppid = (from rev in MyEntities.Suppliers
                          select rev).ToList();
            foreach (var item in suppid)
            {
                DropDownList1.Items.Add(new ListItem(item.companyname, item.supplierid.ToString()));
            }

            var catid = (from rev in MyEntities.Categories
                         select rev).ToList();
            foreach (var item in catid)
            {
                DropDownList2.Items.Add(new ListItem(item.categoryname, item.categoryid.ToString()));
            }

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
        
    protected void addList_btn_Click(object sender, EventArgs e)
{
        first.Visible = false;
        addlist.Visible = true;
        grid.Visible = false;
}


    protected void Button1_Click(object sender, EventArgs e)
    {
        using (TSQL2012Entities myEntities = new TSQL2012Entities())
        {
            var obj = new Product();
            obj.productname = name_tx.Text;
            obj.supplierid = Convert.ToInt32(DropDownList1.SelectedValue);
            obj.categoryid = Convert.ToInt32(DropDownList2.SelectedValue);
            obj.unitprice = Convert.ToDecimal(price_tx.Text);
            obj.discontinued = Discont_check.Checked;
            myEntities.Products.Add(obj);
            myEntities.SaveChanges();
        }
        name_tx.Text = string.Empty;
        price_tx.Text = string.Empty;
        Discont_check.Checked = false;
        grid.Visible = true;
    }
    protected void home_btn0_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void hide_btn_Click(object sender, EventArgs e)
    {
        addlist.Visible = false;
        first.Visible = true;
        grid.Visible = false;
    }
    protected void home_btn_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}