<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ud_sec.aspx.cs" Inherits="Absent_MG.ud_sec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5 mt-4">
            <h1 class="display-2 text-white mb-3 animated slideInDown">View Sections</h1>
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
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="table cart-table" DataSourceID="SqlDataSource1" DataKeyNames="sec_Id">
                                            <Columns>
                                                <asp:BoundField DataField="sec_Id" HeaderText="Id" SortExpression="sec_Id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="sec_name" HeaderText="Name" SortExpression="sec_name"></asp:BoundField>
                                                <asp:BoundField DataField="cr_name" HeaderText="Course Name" SortExpression="cr_name"></asp:BoundField>
                                                <asp:BoundField DataField="name" HeaderText="Instructor" SortExpression="name"></asp:BoundField>
                                                <asp:BoundField DataField="st_stack" HeaderText="Student stack" SortExpression="st_stack"></asp:BoundField>
                                                <asp:HyperLinkField DataNavigateUrlFields="sec_Id" ControlStyle-CssClass="btn btn-primary" DataNavigateUrlFormatString="updt_sec.aspx?id={0}" HeaderText="Details" Text="View"></asp:HyperLinkField>

                                            </Columns>
                                            <HeaderStyle CssClass="table-header" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Absent %>' SelectCommand="SELECT section.sec_Id, section.sec_name, section.st_stack, section.cr_id, section.inst_id, course_schedu.cr_name, instructor.name FROM course_schedu INNER JOIN section ON course_schedu.cr_Id = section.cr_id INNER JOIN instructor ON section.inst_id = instructor.Inst_Id" DeleteCommand="DELETE FROM section WHERE (sec_Id = @sec_Id)" UpdateCommand="UPDATE section SET sec_name = @name, st_stack = @stk, inst_id = @inst_Id FROM section INNER JOIN instructor ON section.inst_id = instructor.Inst_Id WHERE (section.sec_Id = @sec_Id)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="sec_Id"></asp:Parameter>
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="name"></asp:Parameter>
                                                <asp:Parameter Name="stk"></asp:Parameter>
                                                <asp:Parameter Name="inst_Id"></asp:Parameter>
                                                <asp:Parameter Name="sec_Id"></asp:Parameter>
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
