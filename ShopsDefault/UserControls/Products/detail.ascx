﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="detail.ascx.cs" Inherits="ShopsDefault.UserControls.Products.detail" %>
<script type="text/javascript">
    function quantityVal() {
        var quantity;
        quantity = parseInt($('.addtocart_quantity').val());
        return quantity;
    }

    $(function () {
        $('.btn_decrement').click(function () {
            var quantity = 0;
            var that = $('.addtocart_quantity');
            if (that.val() > 1) {
                quantity = parseInt(that.val()) - 1;
                that.attr('value', (quantity));
            }
        });
        $('.btn_increment').click(function () {
            $('.btn_decrement').css('cursor', 'pointer');
            var quantity = 0;
            var that = $('.addtocart_quantity');
            var total = parseInt($('.total-amount').text());
            if (that.val() < total) {
                quantity = parseInt(that.val()) + 1;
                that.attr('value', (quantity));
            }
        });
    });
</script>
<script src="/js/add-to-cart.js"></script>
<div class="prd-detail section">
    <asp:ObjectDataSource ID="ds" runat="server" OnSelecting="ds_Selecting" SelectMethod="GetDataTable_SQL_pro" TypeName="Librari.Cls_ShopsProducts" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ds" EnableViewState="true">
        <ItemTemplate>
            <div class="container">
                <div class="block-header style1"><%# Eval("ProductName")%></div>
                <div class="row">
                    <div class="col-6">
                        <img src="<%# Eval("Image")%>" alt="<%# Eval("ProductName")%>" />
                    </div>
                    <div class="col-6">
                        <div class="_line"><strong>Loại xe:</strong> <%# Eval("CatalogName")%></div>
                        <div class="_line"><strong>Mã xe:</strong> <%# Eval("ProductCode")%></div>
                        <div class="_line"><strong>Màu sắc:</strong> <%# Eval("Color")%></div>
                        <div class="_line"><strong>Tốc độ:</strong> <%# Eval("Weight")%></div>
                        <div class="_line"><strong>Giá thuê:</strong> <%# Utils.getPrice(Eval("PriceOut"))%><sup>VNĐ</sup><span>/Ngày</span></div>
                        <div class="_line prd-amount"><strong>Số lượng:</strong> <span class="btn-amount btn_decrement"><i class="fa fa-minus"></i></span><asp:TextBox ID="txtQuantity" runat="server" class="addtocart_quantity" type="text" value="1"></asp:TextBox><span class="btn-amount btn_increment"><i class="fa fa-plus"></i></span> <asp:Label ID="lblAmount" runat="server" class="total-amount" Text='<%# Eval("Amount")%>'></asp:Label> chiếc có sẵn</div>
                        <div>
                            <asp:Button ID="btnAddToCart" runat="server" CommandArgument='<%# Eval("ID_Product")%>' OnClientClick="addItem(quantityVal());" OnClick="btnAddToCart_Click" CausesValidation="false" Text="Thuê xe" UseSubmitBehavior="false" CssClass="btn-default add-to-cart" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="content-editor">
                            <%# Eval("Description")%>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
