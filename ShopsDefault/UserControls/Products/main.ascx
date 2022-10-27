<%@ Control Language="C#" AutoEventWireup="true" CodeFile="main.ascx.cs" Inherits="ShopsDefault.UserControls.Products.main" %>
<div class="prd-default">
    <asp:ObjectDataSource ID="dsCatalog" runat="server" OnSelecting="ds_Catalogs_Selecting" SelectMethod="GetDataTable_SQL_pro" TypeName="Librari.Cls_ShopsCatalogs" />
    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="dsCatalog">
        <ItemTemplate>
            <div class="section-1">
                <div class="block-header"><%# Eval("CatalogName")%></div>
                <div class="container">
                    <div class="row">
                        <asp:Repeater ID="Repeater4" runat="server" DataSource='<%# getPrdSelecting(Eval("ID_Catalog"))%>'>
                            <ItemTemplate>
                                <div class="col-lg-4">
                                    <div class="item">
                                        <div class="image">
                                            <a href="<%# Utils.getAHrefURL("san-pham", Eval("linkSEOCatalog"),Eval("LinkSEO"), Eval("ID_Product"))%>">
                                                <img src="<%# Eval("Image")%>" />
                                            </a>
                                        </div>
                                        <div class="content">
                                            <a href="<%# Utils.getAHrefURL("san-pham", Eval("linkSEOCatalog"),Eval("LinkSEO"), Eval("ID_Product"))%>">
                                                <h3 class="title"><%# Eval("ProductName")%></h3>
                                            </a>
                                            <h4><%# Utils.getPrice(Eval("PriceOut"))%><sup>VNĐ</sup><span>/Ngày</span></h4>
                                            <ul>
                                                <li><i class="fa fa-motorcycle"></i><%# Eval("Color")%></li>
                                                <li><i class="fa fa-dashboard"></i><%# Eval("Weight")%> km/h</li>
                                            </ul>
                                            <div class="action">
                                                <a href="#" class="btn-default">Thuê xe</a>
                                                <a href="<%# Utils.getAHrefURL("san-pham", Eval("linkSEOCatalog"),Eval("LinkSEO"), Eval("ID_Product"))%>" class="btn-default">Chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
