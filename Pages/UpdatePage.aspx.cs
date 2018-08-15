using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UpdatePage : System.Web.UI.Page
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

            name_tx.Text = tb.productname;
            DropDownList1.SelectedValue = tb.supplierid.ToString();
            DropDownList2.SelectedValue = tb.categoryid.ToString();
            price_tx.Text = tb.unitprice.ToString();
            Discont_check.Checked = tb.discontinued;
        }

    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (TSQL2012Entities myEntities = new TSQL2012Entities())
        {
            var update = (from review in myEntities.Products
                          where review.productid == id
                          select review).SingleOrDefault();

            update.productname = name_tx.Text;
            update.supplierid = Convert.ToInt32(DropDownList1.SelectedValue);
            update.categoryid = Convert.ToInt32(DropDownList2.SelectedValue);
            update.unitprice = Convert.ToDecimal(price_tx.Text);
            update.discontinued = Discont_check.Checked;

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
    protected void home_btn_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void updateList_btn_Click(object sender, EventArgs e)
    {
        addlist.Visible = true;
        grid.Visible = true;
        second.Visible = false;
    }
    protected void hide_btn_Click(object sender, EventArgs e)
    {
        second.Visible = true;
        addlist.Visible = false;
        grid.Visible = false;
    }
}