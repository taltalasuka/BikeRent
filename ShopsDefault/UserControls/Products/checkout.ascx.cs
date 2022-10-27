using Librari;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopsDefault.UserControls.Products
{
    public partial class checkout : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ds_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            string sql = "SELECT * FROM tbShopsPayments where Hidden = 1";
            e.InputParameters["sSQL"] = sql;
        }

        protected void dsCart_OnLoad(object sender, EventArgs e)
        {
            DataTable cart = Session["cart_items"] as DataTable;
            Repeater3.DataSource = cart;
            Repeater3.DataBind();
        }

        protected string getTotal()
        {
            int count = 0;
            object total;
            DataTable dt = (DataTable)Session["cart_items"];
            if (dt != null)
            {
                total = dt.Compute("Sum(Total)", "");
                if (total == null || total.ToString() == "")
                {
                    count = 0;
                }
                else
                {
                    count = Convert.ToInt32(total.ToString());
                }

            }
            else
            {
                count = 0;
            }
            return count.ToString();
        }

        public static string GenCodeOrder()
        {
            try
            {
                object ob = Cls_ShopsOrdersDetail.getMaxIdAuto();
                if (ob == DBNull.Value)
                    return "0000001";
                else
                    return (Convert.ToInt32(ob) + 1).ToString("0000000");
            }
            catch (Exception ex) { throw ex; }
        }

        private void SendMaiInfor(string MailTo)
        {
            try
            {
                string Code = GenCodeOrder();
                DataTable cart = Session["cart_items"] as DataTable;
                double Total = Convert.ToDouble(getTotal());
                string domain = Request.Url.GetLeftPart(UriPartial.Authority);
                string paymentMethod = "Thanh toán tại cửa hàng";
                string str = "<div class='fr_checkout fr_col12'>" +
                    "<div class='header_ckout fr_col12'>" +
                        "<div class='_header_ckout fr_col12'>" +
                            "<div class='logo_ckout'>" +
                                "<a href='" + domain + "' target='_blank'>" +
                                    "<img src='" + domain + "/images/UploadImages/logo-cho-thue-xe-may-QM.png' />" +
                                "</a>" +
                            "</div>" +
                            "<div class='slogan_ckout'>" +
                                "<p><b>Cung cấp cho quý khách những tiện nghi phù hợp, dịch vụ đạt chuẩn và chất lượng tốt với mức giá cả bình dân sẽ giúp quý khách có những chuyến đi vui vẻ thoải mái, tiết kiệm được chi phí mà vẫn đảm bảo an toàn.</b></p>" +
                            "</div>" +
                        "</div>" +
                        "<div class='_body_ckout fr_col12'>" +
                            "<div class='bd_top_ckout'>" +
                                "<p class='name_cus'>Kính chào <b>" + txtFullName.Text + " ,</b></p>" +
                                "<p class='_title_sub'>Bạn đã thuê xe máy tại Quốc Minh</b> .</p>" +
                                "<ul class='info_order'>" +
                                    "<li>" +
                                        "<strong>Mã đơn hàng :</strong>" +
                                        "<span> " + Code + "</span>" +
                                    "</li>" +
                                    "<li>" +
                                        "<strong>Trạng thái đơn hàng :</strong>" +
                                        "<span> Đặt hàng thành công </span>" +
                                    "</li>" +
                                    "<li>" +
                                        "<strong>Thời gian giao dịch :</strong>" +
                                        "<span> " + DateTime.Now.ToString("dd/MM/yyyy hh:mm") + "</span>" +
                                    "</li>" +
                                    "<li>" +
                                        "<strong>Hình thức thanh toán :</strong>" +
                                        "<span> " + paymentMethod + "</span>" +
                                    "</li>" +
                                "</ul>" +
                                "<table class='tb_order'>" +
                                    "<tr>" +
                                        "<td colspan='1'>Sản phẩm</td>" +
                                        "<td>Số lượng</td>" +
                                        "<td>Đơn giá</td>" +
                                        "<td>Thành tiền</td>" +
                                    "</tr>";



                foreach (DataRow drCart in cart.Rows)
                {
                    str += "<tr class='prd_row'>" +
                               "<td>" +
                                   "<a href='#' target='_blank'>" + drCart["ProductName"].ToString() + "</a></td>" +
                               "<td><b>" + drCart["Quantity"].ToString() + "</b></td>" +
                               "<td>" + Convert.ToDouble(drCart["PriceOut"]).ToString("#,0") + " đ</td>" +
                               "<td><b>" + (Convert.ToDouble(drCart["PriceOut"]) * Convert.ToInt32(drCart["Quantity"].ToString())).ToString("#,0") + " ₫</b></td>" +
                           "</tr>";
                }
                str += "<tr class='_row_td'>" +
                                       "<td colspan='4' style='padding-top: 5px;padding-bottom: 5px;'>Tổng giá trị đơn hàng <br /><b>(chưa bao gồm phí ship hàng)</b>" +
                                       "</td>" +
                                       "<td style='padding-top: 5px;padding-bottom: 5px;'>" +
                                           "<b style='color: #f53030'>" + Total.ToString("#,0") + " ₫</b>" +
                                       "</td>" +
                                   "</tr>" +
                               "</table>" +
                           "</div>" +
                       "</div>" +
                       "<div style='line-height: 24px;' class='_footer_ckout fr_col12'>" +
                           "<b>Cảm ơn quý khách đã thuê xe máy tại " +
                           "<a href='" + domain + "' target='_blank'>Quốc Minh</a>!</b>" +
                       "</div>" +

                       "<div style='line-height: 24px;' class='_footer_ckout fr_col12'>" +
                           "Mọi thắc mắc xin liên hệ SĐT <b>0343 554 888</b>" +
                       "</div>" +
                   "</div>" +
               "</div>";


                System.Net.NetworkCredential login_cred = new System.Net.NetworkCredential("doquocminh191991@gmail.com", "minh1232019");
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = new System.Net.Mail.MailAddress("doquocminh191991@gmail.com");
                mail.To.Add(new System.Net.Mail.MailAddress(MailTo));
                mail.CC.Add(new System.Net.Mail.MailAddress("doquocminh191991@gmail.com"));
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.Subject = "Thông tin đặt hàng tại Quốc Minh!";
                mail.Body = str;
                mail.IsBodyHtml = true;
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = login_cred;
                client.Send(mail);
            }
            catch (Exception ex)
            {
            }
        }


        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Label lblPayment = (Label)Repeater1.FindControl("lblID_Payment");
            Cls_ShopsOrdersDetail cls = new Cls_ShopsOrdersDetail();
            //Cls_Users user = Session["WebsiteUser"] as Cls_Users;
            cls.ID_Payment = Convert.ToInt32(lblPayment.Text);
           // cls.ID_Payment = 1;
            cls.ID_User = 2;
            cls.UserName = "";
            //if (Session["WebsiteUser"] != null)
            //{
            //    int ID_WebUser = user.ID_User;
            //    cls.ID_User = ID_WebUser;
            //}
            //else
            //{
            //    cls.ID_User = 2;
            //}
            cls.OrdersName = txtFullName.Text;
            //if (Session["WebsiteUser"] != null)
            //{
            //    string WebUserName = user.UserName;
            //    cls.UserName = WebUserName;
            //}
            //else
            //{
            //    cls.UserName = "";
            //}
            cls.UserEmail = txtEmail.Text;
            cls.UserAddress = txtAddress.Text;
            cls.UserPhone = txtPhoneNumber.Text;
            cls.PriceTotal = Convert.ToDouble(getTotal());
            //cls.PriceTotal = 1111111;
            cls.Description = txtDescription.Text;
            //cls.AddTime = DateTime.Now;
            //cls.EditTime = DateTime.Now;
            cls.AddTime = Convert.ToDateTime(txtDatePick.Text);
            cls.EditTime = Convert.ToDateTime(txtDayOff.Text);
            cls.Hidden = true;
            if (cls.doInsert() == 1)
            {
                SendMaiInfor(txtEmail.Text);
                string sMessages = "alert('Đã đặt hàng thành công!');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", sMessages, true);
            }
            else
            {
                string sMessages = "alert('Đã xảy ra lỗi trong quá trình đặt hàng! Bạn vui lòng kiểm tra lại!');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", sMessages, true);
            }
        }
    }
}