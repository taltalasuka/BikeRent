﻿<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="header-menu.ascx.cs" Inherits="ShopsDefault.UserControls.Header.header_menu" %>

<div class="hd-menu">
    <div class="container">
        <div class="row">
            <ul class="hd-nav">
                <li><a href="/ez-bikes.html">Home</a></li>
                <li><a href="/gioi-thieu-1.html">About Us</a></li>
                <li><a href="/san-pham.html">Products</a></li>
                <li><a href="/tin-tuc.html">Articles</a></li>
                <li><a href="/lien-he.html">Contact Us</a></li>
            </ul>
            <div class="hd-cart">
                <div class="hd-cart-icon">
                    <a href="/cart.html">
                        <i class="fa fa-shopping-basket"></i>
                        <span class="hd-cart-item"><%= Utils.GetCountItemCart()%></span></a>
                </div>
            </div>
        </div>
    </div>
</div>
