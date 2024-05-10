<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor.Master" AutoEventWireup="true" CodeBehind="ins_cr.aspx.cs" Inherits="Absent_MG.ins_cr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5 mt-4">
            <h1 class="display-2 text-white mb-3 animated slideInDown">View Courses </h1>
            <nav aria-absentel="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <div class="container-xxl py-5">
        <div class="container px-lg-5">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="wow fadeInUp" data-wow-delay="0.3s">
                        <div class=" row g-4 text-center">
                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cr_Id"
                                        DataSourceID="SqlDataSource1" Width="100%" CssClass="table cart-table">
                                        <Columns>
                                            <asp:BoundField DataField="cr_Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="cr_Id"></asp:BoundField>
                                            <asp:BoundField DataField="cr_name" HeaderText="Course Name" SortExpression="cr_name"></asp:BoundField>
                                            <asp:BoundField DataField="cr_symp" HeaderText="Sympol" SortExpression="cr_symp"></asp:BoundField>
                                            <asp:BoundField DataField="credit_hr" HeaderText="Credit Hours" SortExpression="credit_hr"></asp:BoundField>

                                            <asp:BoundField DataField="stack" HeaderText="Stack" SortExpression="stack"></asp:BoundField>
                                        </Columns>
                                        <HeaderStyle CssClass="table-header" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Absent %>' SelectCommand="SELECT course_schedu.cr_name, course_schedu.cr_Id, course_schedu.credit_hr, course_schedu.cr_symp, course_schedu.stack, instructor.name FROM course_schedu INNER JOIN ins_cr ON course_schedu.cr_Id = ins_cr.cr_id INNER JOIN instructor ON ins_cr.inst_id = instructor.Inst_Id WHERE (instructor.name = @name)">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="n" Name="name"></asp:SessionParameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Contact End -->
</asp:Content>

