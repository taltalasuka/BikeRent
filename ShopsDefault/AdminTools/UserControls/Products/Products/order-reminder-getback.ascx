﻿<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="order-reminder-getback.ascx.cs" Inherits="ShopsDefault.AdminTools.UserControls.Products.Products.order_reminder_getback" %>

<div class="block-body">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="grv" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="grv_OnRowDataBound" DataKeyNames="ID_OrderProduct" OnRowUpdating="grv_RowUpdating" OnPageIndexChanging="grv_PageIndexChanging" CssClass="table table-default">
                <PagerStyle CssClass="pagination" />
                <Columns>
                    <asp:BoundField DataField="ID_OrderProduct" HeaderText="ID" HtmlEncode="true" />
                    <asp:BoundField DataField="OrdersName" HeaderText="Tên người đặt" HtmlEncode="true" />
                    <asp:BoundField DataField="UserPhone" HeaderText="Số điện thoại" HtmlEncode="true" />
                    <asp:BoundField DataField="DayIn" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày trả" HtmlEncode="true" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" OnClick="btnEdit_Click" CssClass="btn btn-info"><i class="icon-pencil"></i> Details</asp:LinkButton>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="false" CommandName="Update" CssClass="btn btn-danger"><i class="icon-ban"></i> Hủy đơn</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="text-center"><asp:Label ID="lblGridviewEmpty" runat="server" Visible="false"></asp:Label></div>
            <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none">
                <div class="popup-body">
                    <div class="card">
                        <div class="card-header">
                            <i class="icon-note"></i>Thông tin Details đơn hàng
                        </div>
                        <div class="card-body scrollbar-y-custom">
                            <div class="form-group d-none">
                                <label for="company">ID đơn hàng</label>
                                <asp:TextBox ID="txtID_OrderProduct" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                            </div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#thong-tin-nguoi-dat">Thông tin người đặt</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#thong-tin-don-hang">Thông tin đơn hàng</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="thong-tin-nguoi-dat" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="company">Tên người đặt</label>
                                                <asp:TextBox ID="txtOrderName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="company">Địa chỉ</label>
                                                <asp:TextBox ID="txtAddress" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="company">Số điện thoại</label>
                                                <asp:TextBox ID="txtPhone" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="company">Ngày đặt</label>
                                                <asp:TextBox ID="txtDayOut" runat="server" ReadOnly="true" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="company">Ngày trả</label>
                                                <asp:TextBox ID="txtDayIn" runat="server" ReadOnly="true" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="company">Địa chỉ Email</label>
                                                <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="company">Hình thức thanh toán</label>
                                                <asp:TextBox ID="txtPayment" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="company">Tình trạng</label>
                                                <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="street">Nội dung ghi chú</label>
                                                <asp:TextBox ID="txtDetail" runat="server" ReadOnly="true" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="thong-tin-don-hang" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-12">
                                            <asp:GridView ID="grvDetail" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID_Product" CssClass="table table-default">
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Product" HeaderText="ID" HtmlEncode="true" />
                                                    <asp:BoundField DataField="ProductCode" HeaderText="Mã xe" HtmlEncode="true" />
                                                    <asp:BoundField DataField="ProductName" HeaderText="Tên xe" HtmlEncode="true" />
                                                    <asp:BoundField DataField="Amount" HeaderText="Quantity" HtmlEncode="true" />
                                                    <asp:BoundField DataField="PriceOut" HeaderText="Đơn giá" HtmlEncode="true" />
                                                    <asp:BoundField DataField="PriceTotal" HeaderText="Tổng cộng" HtmlEncode="true" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <asp:LinkButton ID="btnUpdateStatus" runat="server" OnClick="btnUpdateStatus_Click" CssClass="btn btn-success" Text="Deliver"></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-secondary">Tắt</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
            <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
                PopupControlID="pnlAddEdit" TargetControlID="lnkFake"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="grv" />
            <asp:AsyncPostBackTrigger ControlID="btnUpdateStatus" />
        </Triggers>
    </asp:UpdatePanel>
</div>