<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GridViewApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD Operation</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        function showAlert(title, message, type) {
            Swal.fire(title, message, type);
        }
    </script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f8fa;
            background-image: url("https://www.transparenttextures.com/patterns/shattered.png");
            padding: 20px;
            color: #2c3e50;
        }

        .container {
            max-width: 420px;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #dfe6e9;
        }

        h2 {
            text-align: center;
            color: #1abc9c;
            margin-bottom: 20px;
        }

        .form-table {
            width: 100%;
        }

        .form-table td {
            padding: 8px;
        }

        .form-table label {
            font-weight: bold;
            color: #34495e;
        }

        .form-table input[type="text"],
        .form-table input[type="email"],
        .form-table input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .form-table .btn-submit {
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 10px 14px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
            width: 100%;
        }

        .form-table .btn-submit:hover {
            background-color: #16a085;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .grid-view {
            margin-top: 30px;
        }

        .grid-view table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f6ddcc  ;
            border: 1px solid #dfe6e9;
        }

        .grid-view th {
            background-color: #2980b9;
            color: white;
            text-align: left;
            padding: 12px;
            border: 1px solid #dfe6e9;
            font-weight: bold;
        }

        .grid-view td {
            border: 1px solid #dfe6e9;
            padding: 10px;
            text-align: left;
        }

        .grid-view .fa-trash {
            color: #e74c3c;
            cursor: pointer;
            font-size: 16px;
        }

        .grid-view .fa-pen-to-square {
            color: #f39c12;
            cursor: pointer;
            font-size: 16px;
        }

        .grid-view .fa-check {
            color: #2ecc71;
            cursor: pointer;
            font-size: 16px;
        }

        .grid-view .fa-xmark {
            color: #e74c3c;
            cursor: pointer;
            font-size: 16px;
        }

        .action-column {
            text-align: center;
        }

        .action-column a {
            margin: 0 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Customer Details</h2>
            <table class="form-table">
                <tr>
                    <td><label for="Name">Name:</label></td>
                    <td><asp:TextBox ID="Name" runat="server" required></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="Mail">Email:</label></td>
                    <td><asp:TextBox ID="Mail" runat="server" TextMode="Email" required></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="Age">Age:</label></td>
                    <td><asp:TextBox ID="Age" runat="server" type="number" required></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="Phone">Phone No:</label></td>
                    <td><asp:TextBox ID="Phone" runat="server" required></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn" runat="server" Text="Submit" OnClick="btn_Click" CssClass="btn-submit" />
                    </td>
                </tr>
            </table>
        </div>

        <div class="grid-view">
            <asp:GridView ID="GvData" runat="server" AutoGenerateColumns="False" GridLines="Both" DataKeyNames="id" OnPageIndexChanging="GvData_PageIndexChanging" OnRowCancelingEdit="GvData_RowCancelingEdit" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing" OnRowUpdating="Gvdata_RowUpdating" OnSelectedIndexChanged="GvData_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Id" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtId" runat="server" Text='<%# Eval("Id") %>' ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone No" />
                    <asp:BoundField DataField="age" HeaderText="Age" />
                    <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="action-column">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="fa fa-pen-to-square"></asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="fa fa-trash"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="fa fa-check"></asp:LinkButton>
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="fa fa-xmark"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
