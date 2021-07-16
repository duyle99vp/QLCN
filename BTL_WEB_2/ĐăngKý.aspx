<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ĐăngKý.aspx.cs" Inherits="QuanLyCongNhan.ĐăngKý" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 60%;
        }
        .style2
        {
            height: 48px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             
        <table align="center" class="style1">
            <tr>
                 <td class="style2" colspan="2">ĐĂNG KÝ</td>
            </tr>
            <tr>
                <td>
                    Username:</td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" Height="25pt" Width="220pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được bỏ trống " ControlToValidate="txtUser" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>
                    Password:</td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" Height="25pt" Width="220pt" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Không được bỏ trống " ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Họ &amp; Tên:</td>
                <td>
                    <asp:TextBox ID="txtTen" runat="server" Height="25pt" Width="220pt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày Sinh:</td>
                <td>
                    <asp:TextBox ID="txtNgaySinh" runat="server" Height="25pt" Width="220pt" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="25pt" Width="220pt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnDangky" runat="server" Text="Đăng Ký" OnClick="btnDangky_Click" 
                        />
                </td>
            </tr>
        </table>
            <asp:Label ID="lblTB" runat="server" Text=""></asp:Label>
    
        </div>
    </form>
</body>
</html>
