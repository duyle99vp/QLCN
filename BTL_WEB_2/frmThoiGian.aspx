<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmThoiGian.aspx.cs" Inherits="BTL.frmThoiGian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 113px;
        }
         body{
            padding-top :140px;
        }
        .bgimg {
  background-image: url('https://img2.thuthuatphanmem.vn/uploads/2018/11/30/hinh-nen-trang-dep-cho-may-tinh_104326055.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
    </style>
</head>
<body class="bgimg">
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/frmTrangChu"><asp:Image ID="Image1" runat="server" ImageUrl="/image/logo1.png"  GenerateEmptyAlternateText="False" Width="120" Height="40"></asp:Image></a> 
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/frmTrangChu">Trang chủ</a></li>
                        <li><a runat="server" href="~/frmChiTieu">Quản lý chi tiêu</a></li>
                        <li><a runat="server" href="~/frmThoiGian">Quản lý thời gian</a></li>
                    </ul>
                                          
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" href="~/ThongTinNguoiDung">
                                   Thông tin người dùng</a></li>                               
                            </ul>  
                                       
                </div>
            </div>
        </div>
        <div>
            <h1 align="center">QUẢN LÝ CÔNG VIỆC</h1>
           
               <div class ="container"> <asp:Button ID="btnThem" runat="server" Text="Thêm công việc" CssClass="btn btn-primary " OnClick="Button1_Click" /></div>
      
            <br />
            <br />
            <div class="container">
            <asp:Panel ID="PanelCV" runat="server" Height="235px">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">Tên công việc:</td>
                        <td>
                            <asp:TextBox ID="txtTenCV" runat="server" Height="25px" Width="270px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenCV" ErrorMessage="Nhập tên công việc!"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Ngày bắt đầu:</td>
                        <td>
                            <asp:TextBox ID="txtNgayBD" runat="server" Height="25px" Width="270px"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtNgayBD" ErrorMessage="Nhập ngày theo định dạng mm/dd/yyyy" MaximumValue="12/30/9999" MinimumValue="1/1/1111" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Ngày kết thúc:</td>
                        <td>
                            <asp:TextBox ID="txtNgayKT" runat="server" Height="25px" Width="270px"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtNgayKT" ErrorMessage="Nhập ngày theo định dạng mm/dd/yyyy" MaximumValue="12/30/9999" MinimumValue="1/1/1111" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Trạng thái:</td>
                        <td>
                            <asp:DropDownList ID="drlTrangThai" runat="server" Height="25px" Width="137px" Font-Bold="True" Font-Overline="False" >
                                <asp:ListItem>Đã hoàn thành</asp:ListItem>
                                <asp:ListItem>Đã lập lịch</asp:ListItem>
                                <asp:ListItem>Đang thực hiện</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnLuu" runat="server" Text="Lưu thông tin" CssClass="btn btn-warning" OnClick="btnLuu_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnLamLai" runat="server" Text="Làm lại" CssClass="btn btn-danger" OnClick="btnLamLai_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnHuy" runat="server" Text="Huỷ" OnClick="btnHuy_Click" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:Panel>
                </div>
      
        </div>
        <div class="container">
            Tên công viêc :
            <asp:TextBox ID="txtTenTK" runat="server" Width="172px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Button ID="btnTK" runat="server" OnClick="btnTK_Click" Text="Tìm kiếm" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnHienThi" runat="server" OnClick="btnHienThi_Click" style="height: 26px" Text="Hiện thi tất cả" />
            <br />
            </div>
        <div class="container">
        <asp:GridView ID="grvCV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnRowDeleting="grvCV_RowDeleting" OnRowEditing="grvCV_RowEditing" Width="100%" OnPageIndexChanging="grvCV_PageIndexChanging" OnRowCancelingEdit="grvCV_RowCancelingEdit" OnRowUpdating="grvCV_RowUpdating" OnSorting="grvCV_Sorting" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Ten" HeaderText="Tên công việc" SortExpression="Ten" />
                <asp:BoundField DataField="NgayBD" HeaderText="Ngày bắt đầu" SortExpression="NgayBD" />
                <asp:BoundField DataField="NgayKT" HeaderText="Ngày kết thúc" SortExpression="NgayKT" />
                <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" SortExpression="TrangThai" />
                <asp:CommandField ButtonType="Button" CancelText="Huỷ" DeleteText="Xoá" EditText="Sửa" ShowEditButton="True" SortExpression="id" UpdateText="Cập nhật" />
                <asp:CommandField ButtonType="Button" CancelText="Huỷ" DeleteText="Xoá" EditText="Sửa" ShowDeleteButton="True" SortExpression="id" UpdateText="Cập nhật" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <input id="hidID" type="hidden" value="Id" name="hidID" runat="server"/>
   </div>
            </form>
</body>
</html>
