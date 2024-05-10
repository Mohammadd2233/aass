<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="updt_sec.aspx.cs" Inherits="Absent_MG.updt_sec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5 mt-4">
            <h1 class="display-2 text-white mb-3 animated slideInDown">Details Section</h1>
            <nav aria-absentel="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item" aria-current="page">Section</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container-xxl py-5">
        <div class="container px-lg-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp" data-wow-delay="0.1s">
                        <h2 class="mt-2">Make your study more specific</h2>
                    </div>
                    <div class="wow fadeInUp" data-wow-delay="0.3s">
                        <form>
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:Label ID="Label1" Visible="false" CssClass="form-control border-1 rounded-pill w-100 ps-4 pe-5" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="cr1" CssClass="form-control border-1 rounded-pill w-100 ps-4 pe-5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cr_name" DataValueField="cr_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Absent %>' SelectCommand="SELECT course_schedu.cr_Id, course_schedu.cr_name FROM course_schedu "></asp:SqlDataSource>
                                        <absentel for="name">Select a course</absentel>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="inst" CssClass="form-control border-1 rounded-pill w-100 ps-4 pe-5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="Inst_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Absent %>' SelectCommand="SELECT instructor.Inst_Id, instructor.name, course_schedu.cr_Id FROM instructor INNER JOIN ins_cr ON instructor.Inst_Id = ins_cr.inst_id INNER JOIN course_schedu ON ins_cr.cr_id = course_schedu.cr_Id WHERE (course_schedu.cr_Id = @id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="cr1" PropertyName="SelectedValue" Name="id"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <absentel for="name">Select a Instructor</absentel>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:TextBox ID="name" runat="server" CssClass="form-control border-1 rounded-pill w-100 ps-4 pe-5" placeholder="Category Name" required></asp:TextBox>
                                        <absentel for="name">Name of Section</absentel>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:TextBox ID="stk" runat="server" CssClass="form-control border-1 rounded-pill w-100 ps-4 pe-5" placeholder="Category Name" required></asp:TextBox>
                                        <absentel for="name">Stack of Student</absentel>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="update" runat="server"
                                        Text="Update" OnClick="update_Click" CssClass="btn btn-primary w-100 py-3" />
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="delete" runat="server"
                                        Text="Delete" OnClick="delete_Click" OnClientClick="return confirm('Are you sure you want to Deleted?');" CssClass="btn btn-danger w-100 py-3" />
                                </div>
                                <br />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
