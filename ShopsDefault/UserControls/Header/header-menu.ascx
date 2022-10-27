<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header-menu.ascx.cs" Inherits="ShopsDefault.UserControls.Header.header_menu" %>

<div class="hd-menu">
    <div class="container">
        <div class="row">
            <ul class="hd-nav">
                <li><a href="/quoc-minh.html">Trang chủ</a></li>
                <li><a href="/gioi-thieu-1.html">Giới thiệu</a></li>
                <li><a href="/san-pham.html">Sản phẩm</a></li>
                <li><a href="/tin-tuc.html">Tin tức</a></li>
                <li><a href="/lien-he.html">Liên hệ</a></li>
            </ul>
            <div class="hd-cart">
                <div class="hd-cart-icon">
                    <a href="/gio-hang.html">
                        <i class="fa fa-shopping-basket"></i>
                        <span class="hd-cart-item"><%= GetCountItemCart()%></span></a>
                </div>
            </div>
        </div>
    </div>
</div>
