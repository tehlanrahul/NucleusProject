<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
  prefix="security"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

</head>
<body>

    <!-- NavBar Starts -->
    <nav class="navbar navbar-expand-sm navbar-light bg-light" >
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03 ">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                <li class="nav-item mx-2">
                    <a class="nav-link" href="<%= request.getContextPath()%>/product">Product <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown dmenu mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarPolicyDropdown" data-toggle="dropdown">
                        Policy Setup
                    </a>
                    <div class="dropdown-menu sm-menu">
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/showRepaymentPolicy">Repayment Policy</a>
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/eligibilityPolicy/">Eligibility Policy</a>
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/chargePolicy/searchScreen">Charge Policy</a>
                    </div>
                </li>

                <li class="nav-item dropdown dmenu mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarParametersDropdown" data-toggle="dropdown">
                        Parameters
                    </a>
                    <div class="dropdown-menu sm-menu">
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/main/eligibilityparameter">Eligibility Parameter</a>
                        <sec:authorize access = "hasRole('MAKER')">
                            <a class="dropdown-item" href="<%= request.getContextPath()%>/charges/makerList">Charge</a>
                        </sec:authorize>
                        <sec:authorize access = "hasRole('CHECKER')">
                            <a class="dropdown-item" href="<%= request.getContextPath()%>/charges/checkerList">Charge</a>
                        </sec:authorize>
                    </div>
                </li>

                <li class="nav-item mx-2">
                    <a class="nav-link" href="<%=request.getContextPath() %>/loanApplication">Application</a>
                </li>



                  <li class="nav-item dropdown dmenu mx-2">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarReportDropdown" data-toggle="dropdown">
                         Receipt
                      </a>
                      <div class="dropdown-menu sm-menu">
                          <a class="dropdown-item" href="<%= request.getContextPath()%>/receiptChecker">Receipt Overview</a>
                          <a class="dropdown-item" href="<%= request.getContextPath()%>/receiptSearch">Receipt Search</a>
                      </div>
                  </li>

                <%--<li class="nav-item mx-2">
                    <a class="nav-link" href="<%= request.getContextPath()%>/receiptSearch">Receipt <span class="sr-only">(current)</span></a>
                </li>--%>

                <li class="nav-item dropdown dmenu mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarAccountingDropDown" data-toggle="dropdown">
                        Accounting
                    </a>
                    <div class="dropdown-menu sm-menu">
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/payment">Payment</a>
                    </div>
                </li>

                <li class="nav-item mx-2">
                    <a class="nav-link" href="<%= request.getContextPath()%>/customerServiceHome">Customer Service</a>
                </li>

                <li class="nav-item dropdown dmenu mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarReportDropdown" data-toggle="dropdown">
                        Report
                    </a>
                    <div class="dropdown-menu sm-menu">
                        <a class="dropdown-item" href="#">Link 1</a>
                        <a class="dropdown-item" href="#">Link 2</a>
                        <a class="dropdown-item" href="#">Link 3</a>
                    </div>
                </li>
                <li class="nav-item dropdown dmenu mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop5" data-toggle="dropdown">
                        BOD
                    </a>
                    <div class="dropdown-menu sm-menu">
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/receiptBOD/run">Receipt BOD</a>
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/main/loanClosureBod">Loan Closure BOD</a>
                        <a class="dropdown-item" href="<%= request.getContextPath()%>/main/loanClosureForm">Loan Closure Search</a>

                    </div>
                </li>
                <li class="nav-item mx-4">
                    <security:authorize access="isAuthenticated()">
                        <b>Welcome!  <security:authentication property="principal.username" /></b>
                        |
                        <sec:authentication property="principal.authorities"/>
                        |
                      </security:authorize>
                </li>
                <li class="nav-item mx-4">
                    <security:authorize access="isAuthenticated()">
                        <a href="<%= request.getContextPath()%>/logout">
                            <img src="<c:url value="/images/logout.png" />" alt="logout">
                        </a>
                    </security:authorize>
                </li>
            </ul>
        </div>
    </nav>
    <!-- NavBar Ends -->