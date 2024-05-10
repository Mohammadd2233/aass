<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ud_cr.aspx.cs" Inherits="Absent_MG.ud_cr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5 mt-4">
            <h1 class="display-2 text-white mb-3 animated slideInDown">View Courses</h1>
            <nav aria-absentel="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item" aria-current="page">Update</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container-xxl py-5">
        <div class="container px-lg-5">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="wow fadeInUp" data-wow-delay="0.3s">
                        <form>
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="table cart-table" DataSourceID="SqlDataSource1" DataKeyNames="cr_Id">
                                            <Columns>
                                                <asp:BoundField DataField="cr_Id" HeaderText="Id" SortExpression="cr_Id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="cr_name" HeaderText="Name" SortExpression="cr_name"></asp:BoundField>
                                                <asp:BoundField DataField="credit_hr" HeaderText="Credit Hours" SortExpression="credit_hr"></asp:BoundField>
                                                <asp:HyperLinkField DataNavigateUrlFields="cr_Id" ControlStyle-CssClass="btn btn-primary" DataNavigateUrlFormatString="upde_cr.aspx?id={0}" HeaderText="Details" Text="View"></asp:HyperLinkField>
                                            </Columns>
                                            <HeaderStyle CssClass="table-header" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Absent %>' SelectCommand="SELECT cr_Id, cr_name, credit_hr, cr_symp, stack FROM course_schedu" DeleteCommand="DELETE FROM course_schedu WHERE (cr_Id = @cr_Id)" UpdateCommand="UPDATE course_schedu SET cr_name = @name, credit_hr = @crh, cr_symp = @smp, stack = @stk WHERE (cr_Id = @cr_Id)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="cr_Id"></asp:Parameter>
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="name"></asp:Parameter>
                                                <asp:Parameter Name="crh"></asp:Parameter>
                                                <asp:Parameter Name="smp"></asp:Parameter>
                                                <asp:Parameter Name="stk"></asp:Parameter>
                                                <asp:Parameter Name="cr_Id"></asp:Parameter>
                                            </UpdateParameters>

                                        </asp:SqlDataSource>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
