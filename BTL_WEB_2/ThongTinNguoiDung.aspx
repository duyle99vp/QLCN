<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongTinNguoiDung.aspx.cs" Inherits="QuanLyCongNhan.ThongTinNguoiDung" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    
    <style type="text/css">
         body{
            padding-top :180px;
        }
        .bgimg {
  background-image: url('https://img2.thuthuatphanmem.vn/uploads/2018/11/30/hinh-nen-trang-dep-cho-may-tinh_104326055.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
    </style>
    <link rel="stylesheet"  href="StyleSheet1.css"  type="text/css" runat="server"/>
</head>
<body class ="bgimg">
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
           <tr>
               <td>
            <asp:Button ID="Button1" runat="server" Text="Sửa" /></td>
            <td>   <asp:Button ID="Button2" runat="server" Text="Lưu" /></td>
            </tr>
        </div>
    </form>
</body>
</html>
