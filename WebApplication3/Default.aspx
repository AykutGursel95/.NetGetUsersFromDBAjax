<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Default" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="scripts/jquery-3.3.1.js"></script>
    <script src="scripts/bootstrap.js"></script>
    <script src="http://pagination.js.org/dist/2.1.4/pagination.min.js"></script>
    <script>

        $(document).ready(function () {

            GetUsers('All');
             
        });

        function GetSearch(a) {
            var findText = $('#Searchs').val();
            GetUsers(findText);

        }

        function GetUsers(Statu) {
            $.ajax({
                type: 'POST',
                url: 'Default.aspx/GetUsers',
                contentType: 'application/json; charset=utf-8',
                data: '{findName:"' + Statu +'"}',
                dataType: 'json',
                success: function (result) {
                    $('#getUserList').empty();
                    if (result.d.length == 0) {
                        $("#UsersTable").hide();
                        $("#aText").show();
                    }
                    else {
                        $("#UsersTable").show();
                        $("#aText").hide();
                    }
                    $.each(result.d, function () {
                        $("#getUserList").append(
                            "<tr>" +
                              "<th>" + this.Id + "</th>" +
                              "<td>" + this.FirstName + "</td>" +
                              "<td>" + this.LastName + "</td>" +
                              "<td>" + this.Email + "</td>" +
                              "<td>" + this.City + "</td>" +
                              "<td>" + this.County + "</td>" +
                            "</tr>");

                        $('#Id').html(this.Id);
                        $('#FirstName').html(this.FirstName);
                        $('#LastName').html(this.LastName);
                        $('#Email').html(this.Email);
                        $('#City').html(this.City);
                        $('#County').html(this.County);

                    });

                },
                error: function () {
                    alert('HATA');
                }
            });
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">@</span>
                </div>
                <input type="text" class="form-control" placeholder="Search" aria-label="Username" id="Searchs" onkeyup="GetSearch()" aria-describedby="basic-addon1"/>
            </div>

            <span id="aText" style="color:black;font-weight:bold;font-size:14px;">Kayıt Bulunamadı!</span>

            <table class="table table-dark" id="UsersTable">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">City</th>
                        <th scope="col">County</th>
                    </tr>
                </thead>
                <tbody id="getUserList">
                </tbody>
            </table>


        </div>
    </form>
</body>
</html>
