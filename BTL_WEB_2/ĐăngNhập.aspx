<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ĐăngNhập.aspx.cs" Inherits="QuanLyCongNhan.ĐăngNhập" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            width: 40%;
        }
        .style2
        {
            height: 48px;
            font-weight: bold;
        }
        .auto-style1 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
            <table align="center" class="style1">
                <tr>
                    <td class="style2" colspan="2">ĐĂNG NHẬP</td>
                </tr>
                <tr>
                    <td class="auto-style1">Tên đăng nhập:</td>
                    <td class="auto-style1">
                       <asp:TextBox ID="txtUser" runat="server" Text="Username"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:CheckBox ID="CbxLuu" runat="server" Text=" Lưu thông tin đăng nhập"  />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server"  Text="Đăng nhập" OnClick="Button1_Click" />
                    </td>
                   
                </tr>
            </table>
             </asp:Panel>

        
        <asp:Label ID="lblTB" runat="server" Text=""></asp:Label>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:qlcn %>" SelectCommand="SELECT * FROM [NguoiDung]"></asp:SqlDataSource>
    </form>
</body>
</html>
