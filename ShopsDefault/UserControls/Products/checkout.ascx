<%@ Control Language="C#" AutoEventWireup="true" CodeFile="checkout.ascx.cs" Inherits="ShopsDefault.UserControls.Products.checkout" %>

<script type="text/javascript">
    function payment() {
        $('.nav-tabs .nav-link:first-child').addClass('active');
        $('.nav-tabs .nav-link:first-child .custom-control-input').prop('checked', true);
        $('.tab-content .tab-pane:first-child').addClass('show active');

        $('.nav-tabs .nav-link').click(function () {
            $('.nav-tabs .nav-link').find('.custom-control-input').prop('checked', false);
            $(this).find('.custom-control-input').prop('checked', true);
        });
    }
    $(function () {
        payment();
    });
</script>

<div class="prd-checkout section">
    <div class="block-header">Đặt hàng</div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <div class="checkout-item">
                            <div class="title-header">Địa điểm nhận hàng</div>
                            <div class="checkout-content">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="company">Họ tên</label>
                                            <asp:TextBox ID="txtFullName" runat="server" placeholder="Nhập họ tên" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="company">Số điện thoại</label>
                                            <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Nhập số điện thoại" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="company">Ngày Thuê</label>
                                            <asp:TextBox ID="txtDatePick" runat="server" TextMode="Date" placeholder="Chọn ngày mượn xe" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="company">Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Nhập email" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="company">Địa chỉ nhận hàng</label>
                                            <asp:TextBox ID="txtAddress" runat="server" placeholder="Nhập địa chỉ nhận hàng" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="company">Ngày Trả</label>
                                            <asp:TextBox ID="txtDayOff" runat="server" TextMode="Date" placeholder="Chọn ngày trả xe" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="company">Ghi chú</label>
                                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" placeholder="Nhập ghi chú đơn hàng" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="checkout-item">
                            <div class="title-header">Hình thức thanh toán</div>
                            <div class="checkout-content">
                                <asp:ObjectDataSource ID="ds" runat="server" OnSelecting="ds_Selecting" SelectMethod="GetDataTable_SQL_pro" TypeName="Librari.Cls_ShopsPayments" />
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ds">
                                        <ItemTemplate>
                                            <a class="nav-link" id="nav-<%# Eval("ID_Payment")%>-tab" data-toggle="tab" role="tab" href="#nav-<%# Eval("ID_Payment")%>" aria-controls="nav-<%# Eval("ID_Payment")%>" aria-selected="false">
                                                <div class="custom-radio">
                                                    <input type="radio" class="custom-control-input" id="radio-<%# Eval("ID_Payment")%>" name="radio-payment">
                                                    <label class="custom-control-label" for="radio-<%# Eval("ID_Payment")%>"><%# Eval("PaymentName")%></label>
                                                    <asp:Label ID="lblID_Payment" runat="server" CssClass="d-none"><%# Eval("ID_Payment")%></asp:Label>
                                                </div>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="tab-content" id="nav-tabContent">
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ds">
                                        <ItemTemplate>
                                            <div class="tab-pane fade" id="nav-<%# Eval("ID_Payment")%>" role="tabpanel" aria-labelledby="nav-<%# Eval("ID_Payment")%>-tab"><%# Eval("Description")%></div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="title-header">Thông tin đơn hàng</div>
                        <div class="checkout-content">
                            <div class="checkout-cart">
                                <asp:Repeater ID="Repeater3" runat="server" OnInit="dsCart_OnLoad">
                                    <ItemTemplate>
                                        <div class="item">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div>
                                                        <span class="quantity"><%# Eval("Quantity")%>x</span>
                                                        <span class="prd-name"><a href="<%# Utils.getAHrefURL("san-pham", Eval("linkSEOCatalog"),Eval("LinkSEO"), Eval("ID_Product"))%>"><%# Eval("ProductName")%></a></span>
                                                    </div>
                                                    <div>
                                                        Thuộc loại <strong style="font-weight: 600;"><%# Eval("CatalogName")%></strong>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="price text-right"><%# Utils.getPrice(Eval("Total"))%><sup>đ</sup></div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="item">
                                            <div class="row">
                                                <div class="col-6">
                                                    Thành tiền:
                                                </div>
                                                <div class="col-6">
                                                    <div class="total">
                                                        <%= Utils.getPrice(getTotal()) %><sup>đ</sup>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="text-center">
                                <a href="gio-hang.html" class="btn-default">Giỏ hàng</a>
                                <asp:LinkButton ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" CssClass="btn-default">Đặt hàng</asp:LinkButton>
                            </div>
                            <div class="checkout-warning-text">
                                Quý khách vui lòng kiểm tra lại thông tin đơn hàng trước khi nhấn vào nút đặt hàng
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
