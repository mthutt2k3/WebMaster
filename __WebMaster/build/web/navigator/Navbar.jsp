<nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-dark">
    <div class="container">
        <a href="/_WebMaster/client/MainPage.jsp" class="navbar-brand mb-0 h1 text-info">
            <img class="d-inline-block align-top logo-prj" src="/_WebMaster/assests/images/logo/logo.png" width="30" height="30"/>
            PRJMaster
        </a>
        <button 
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            class="navbar-toggler"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav nav-item">
                <li class="nav-item dropdown active">
                    <a href="#" 
                       class="nav-link dropdown-toggle text-light"
                       id="navbarDropdown-1" 
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false"
                       >
                        Get Tools
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark"
                        aria-labelledby="navbarDropdown-1">
                        <li><a href="https://download.oracle.com/java/17/archive/jdk-17.0.9_windows-x64_bin.exe" 
                               class="dropdown-item">JDK 17.0.9</a></li>
                        <li><a href="https://www.filepuma.com/download/apache_tomcat_10.1.11-35716/download/?fbclid=IwAR1v5p_wQXuofMAeIbQLztnKpE2LWyD59rsYE_yYIWkwGpQFYTPDTGhqpgM" 
                               class="dropdown-item">Apache Tomcat 10.1.x</a></li>
                        <li><a href="https://archive.apache.org/dist/netbeans/netbeans-installers/17/Apache-NetBeans-17-bin-windows-x64.exe" 
                               class="dropdown-item">Netbeans 17</a></li>
                        <li><a href="https://download.microsoft.com/download/7/f/8/7f8a9c43-8c8a-4f7c-9f92-83c18d96b681/SQL2019-SSEI-Expr.exehttps://download.microsoft.com/download/7/f/8/7f8a9c43-8c8a-4f7c-9f92-83c18d96b681/SQL2019-SSEI-Expr.exe" 
                               class="dropdown-item">SQL Server 2019</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown active">
                    <a href="#" class="nav-link dropdown-toggle text-light"
                       id="navbarDropdown-2" 
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false"
                       >
                        Material
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark"
                        aria-labelledby="navbarDropdown-2">
                        <li><a href="https://www.w3schools.com/html/" 
                               class="dropdown-item">HTML</a></li>
                        <li><a href="https://www.w3schools.com/css/" 
                               class="dropdown-item">CSS</a></li>
                        <li><a href="https://getbootstrap.com/docs/versions/" 
                               class="dropdown-item">BOOTSTRAP</a></li>
                    </ul>
                </li>
            </ul>
            <!--Search-->
            <form class="search-form ms-auto" action="/_WebMaster/control" method="GET" onsubmit="return validateSearch()">
                <input type="hidden" name="target" value="Search"/>
                <input type="hidden" name="requestAction" value="Search"/>
                <input type="search" name="input" class="search-input form-control" placeholder="Search...">
                <button type="submit" class="search-button"></button>
            </form>


            <!--Blog Store item-->
            <ul class="navbar-nav nav-item">
                <li class="nav-item">
                    <form action="/_WebMaster/control" method="GET">
                        <input type="submit" class="nav-link bg-dark border border-0 text-light"
                               name="requestAction" 
                               value="Blog Tutorial"
                               >
                    </form>
                </li>
                <li class="nav-item">
                    <form action="/_WebMaster/control" method="GET">
                        <input type="hidden" name="action" value="ProductPage"/>
                        <input type="submit" 
                               class="nav-link border border-0 bg-success text-light"
                               name="requestAction" 
                               value="Code Store"
                               >
                    </form>
                </li>
                <!--Cart Icon-->
                <li class="nav-item">
                    <form class="container ms-2 mt-1 me-0" action="/_WebMaster/control">
                        <input type="hidden" name="requestAction" value="View Cart">
                        <button type="submit" class="btn btn-dark btn-sm p-1 d-flex" title="Go to Cart">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg>
                            <span id="NumberOfOrder" class="text-info fw-bolder" style="position: initial; transform: translate(2px, -7px);">
                                0
                            </span>
                        </button>
                    </form>
                </li>
            </ul>


            <!--user button-->
            <ul  class="navbar-nav nav-item">
                <%if(xUser.isAdmin()){%>
                <!--drop down admin--> 
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle text-light"
                       id="navbarDropdown-user"
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false"
                       >
                        <img class="d-inline-block align-top logo-prj" src="/_WebMaster/assests/images/logo/admin.png" width="30" height="30"/>
                        <%= xUser.getFirstName() + " (admin)"%>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark"
                        aria-labelledby="navbarDropdown">
                        
                        
                        <li>
                            <form action="/_WebMaster/client/Users/Profile.jsp">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill me-2" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
                                    </svg>
                                    Profile
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/control">
                                <input type="hidden" name="requestAction" value="Manage Users">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-fill me-2" viewBox="0 0 16 16">
                                    <path d="M3.904 1.777C4.978 1.289 6.427 1 8 1s3.022.289 4.096.777C13.125 2.245 14 2.993 14 4s-.875 1.755-1.904 2.223C11.022 6.711 9.573 7 8 7s-3.022-.289-4.096-.777C2.875 5.755 2 5.007 2 4s.875-1.755 1.904-2.223Z"/>
                                    <path d="M2 6.161V7c0 1.007.875 1.755 1.904 2.223C4.978 9.71 6.427 10 8 10s3.022-.289 4.096-.777C13.125 8.755 14 8.007 14 7v-.839c-.457.432-1.004.751-1.49.972C11.278 7.693 9.682 8 8 8s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                                    <path d="M2 9.161V10c0 1.007.875 1.755 1.904 2.223C4.978 12.711 6.427 13 8 13s3.022-.289 4.096-.777C13.125 11.755 14 11.007 14 10v-.839c-.457.432-1.004.751-1.49.972-1.232.56-2.828.867-4.51.867s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                                    <path d="M2 12.161V13c0 1.007.875 1.755 1.904 2.223C4.978 15.711 6.427 16 8 16s3.022-.289 4.096-.777C13.125 14.755 14 14.007 14 13v-.839c-.457.432-1.004.751-1.49.972-1.232.56-2.828.867-4.51.867s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                                    </svg>
                                    Manage
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/control">
                                <input type="hidden" name="requestAction" value="My Purchased">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-check-fill me-2" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zm-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                                    </svg>
                                    My Purchased
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/client/Users/TopUpBalance.jsp">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-coin me-2" viewBox="0 0 16 16">
                                    <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                    </svg>
                                    Top-up balance
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/control">
                                <input type="hidden" name="requestAction" value="Logout">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right me-2" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                    </svg>
                                    Logout
                                </button>
                            </form>
                        </li>
                    </ul>
                </li>
                <%}else{%>
                <!--drop down user-->
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle text-light"
                       id="navbarDropdown-user"
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false"
                       >
                        <img class="d-inline-block align-top logo-prj" src="/_WebMaster/assests/images/logo/Users.png" width="30" height="30"/>
                        <%= xUser.getFirstName() + " " + xUser.getLastName()%>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark"
                        aria-labelledby="navbarDropdown-user">
                        <li>
                            <div class="text-center text-warning">
                                Balance: 
                                <span id="balance" class="fw-semibold">
                                    <%= String.format("%.2f", xUser.getBalance())%>
                                </span>
                                $
                            </div>
                        </li>
                        <li>
                            <form action="/_WebMaster/client/Users/Profile.jsp">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill me-2" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
                                    </svg>
                                    Profile
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/control">
                                <input type="hidden" name="requestAction" value="My Purchased">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-check-fill me-2" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zm-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                                    </svg>
                                    My Purchased
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/client/Users/TopUpBalance.jsp">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-coin me-2" viewBox="0 0 16 16">
                                    <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                    </svg>
                                    Top-up balance
                                </button>
                            </form>
                        </li>
                        <li>
                            <form action="/_WebMaster/control">
                                <input type="hidden" name="requestAction" value="Logout">
                                <button type="submit" class="btn dropdown-item btn-dark d-flex align-items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right me-2" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                    </svg>
                                    Logout
                                </button>
                            </form>
                        </li>
                    </ul>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>
<script>
    function validateSearch() {
        var searchInput = document.querySelector('.search-input');
        if (searchInput.value.trim() === '') {
            return false;
        }
        return true;
    }
    setInterval(autoUpdateCart, 500);

    function autoUpdateCart() {
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var responseText = xhttp.responseText;
                document.getElementById("NumberOfOrder").innerHTML = responseText;
            }
        };
        xhttp.open("GET", "/_WebMaster/getnumberoforder", true);
        xhttp.send();
    }
</script>
<script type="text/javascript" type="text/javascript" src="/_WebMaster/assests/js/bootstrap.bundle.js"></script>