<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmChiTieu.aspx.cs" Inherits="BTL_WEB_2.QLChiTieu.frmThemSua" %>
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
        .auto-style5 {
            width: 99%;
            height: 104px;
        }
        .auto-style7 {
            width: 207px;
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
        .auto-style8 {
            width: 52px;
        }
    </style>
</head>

<body class="bgimg">
    <form id="form1" runat="server">
         <h1 align="center">QUẢN LÝ CHI TIÊU</h1>
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
        <div class="container">
            <!--Thêm, tìm kiếm, sắp xếp-->
                <div class="row">               
                    <div class= "col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <asp:Button  runat="server" id="btnThem" CssClass="btn btn-primary " Text="Thêm chi tiêu" OnClick="btnThem_Click">  </asp:Button>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLCN %>" SelectCommand="SELECT * FROM [ChiTieu]"></asp:SqlDataSource>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">  
                             <asp:TextBox ID="txtTimKiem" runat="server" AutoPostBack="True" BorderColor="#FF0066" BorderStyle="Inset" Height="33px" Width="698px" ></asp:TextBox> 
                              <asp:Button ID="btnTimKiem" runat="server" Text="Tìm kiếm" CssClass="btn btn-primary" OnClick="btnTimKiem_Click" />                                   
                        <asp:DropDownList ID="drlSapXep" runat="server" CssClass="btn btn-primary dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="drlSapXep_SelectedIndexChanged" OnTextChanged="drlSapXep_SelectedIndexChanged">
                            <asp:ListItem>aa</asp:ListItem>
                             </asp:DropDownList>
                    </div>                    
                </div>
            <!-- -->  
                <div class="row mt-15">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                   <asp:GridView ID="grvChiTieu" runat="server" AutoGenerateColumns="False" Width="1027px" DataKeyNames="Id" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-bordered table-hover" CellSpacing="2" OnRowDeleting="grvChiTieu_RowDeleting" OnSelectedIndexChanged="grvChiTieu_SelectedIndexChanged" OnRowEditing="grvChiTieu_RowEditing" OnRowUpdating="grvChiTieu_RowUpdating" OnRowCancelingEdit="grvChiTieu_RowCancelingEdit">
                   <AlternatingRowStyle BackColor="White" />
                   <Columns>
                       <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                       <asp:BoundField DataField="Ten" HeaderText="Tên " SortExpression="Ten" />
                       <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" />
                       <asp:BoundField DataField="Tien" HeaderText="Tiền" SortExpression="Tien" />
                       <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" SortExpression="TrangThai">
                       <ControlStyle ForeColor="#FF0066" />
                       </asp:BoundField>
                       <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" >
                       <ControlStyle CssClass="btn btn-warning" />
                       <FooterStyle CssClass="btn btn-warning" />
                       </asp:CommandField>
                       <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" >
                       <ControlStyle CssClass="btn btn-danger" />
                       </asp:CommandField>
                   </Columns>
                   <EditRowStyle BackColor="#2461BF" />
                   <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#EFF3FB" />
                   <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                   <SortedAscendingCellStyle BackColor="#F5F7FB" />
                   <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                   <SortedDescendingCellStyle BackColor="#E9EBEF" />
                   <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                   
                    <asp:Panel ID="panelThem" runat="server" Visible="False" Width="603px">
                              <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        Thêm Chi Tiêu 
                                        <span
                                            class="fa fa-plus mr-5 text-right"                           
                                        ></span>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    
                                    <table class="auto-style5">
                                        <tr>
                                            <td class="auto-style8">Tên</td>
                                            <td class="auto-style7">
                                                <asp:TextBox ID="txtTen" runat="server" Width="187px" AutoPostBack="True"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTen" ErrorMessage="Nhập Tên" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style8">Ngày :</td>
                                            <td class="auto-style7">
                                                <asp:TextBox ID="txtNgay" runat="server" AutoPostBack="True" Width="187px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNgay" ErrorMessage="Nhập ngày" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="ngày : mm/dd/yyyy" ForeColor="Red" MaximumValue="12/20/9999" MinimumValue="1/1/1111" Type="Date"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style8">Số tiền :</td>
                                            <td class="auto-style7">
                                                <asp:TextBox ID="txtTien" runat="server" AutoPostBack="True" Width="187px"></asp:TextBox>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTien" ErrorMessage="Nhập Tiền" ForeColor="Red"></asp:RequiredFieldValidator>
                                                
                                        </tr>
                                        <tr>
                                            <td class="auto-style8">Trạng thái</td>
                                            <td class="auto-style7">
                                                <asp:RadioButton ID="rbnThu" runat="server" AutoPostBack="True" Checked="True" Font-Names="Times New Roman" GroupName="trangthai" Text="Khoản thu" />
                                                <asp:RadioButton ID="rbnChi" runat="server" Font-Names="Times New Roman" GroupName="trangthai" Text="Khoản chi" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br /> 
                                        <div class="text-center">                                          
                                            <asp:Button ID="btnLuu" runat="server" Text="Lưu lại" CssClass="btn btn-warning" OnClick="btnLuu_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;                                           
                                            <asp:Button ID="btnHuyBo" runat="server" Text="Hủy Bỏ" CssClass="btn btn-danger" OnClick="btnHuyBo_Click" />
                                        </div>
                                </div>
                            </div>
                    </asp:Panel>
                   
                </div>
            </div>
         
            </div>            
           
     </form>

</body>
</html>
