
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">


 <header class="header">
    <nav id="myNavbar" class="navbar navbar-default" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <label class="menu-icon" for="menu-btn"><span class="fa fa-bars"></span></label>
                </button>
                <a class="logo" href="http://localhost:8080">INSARAG</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right menu">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle order-1">Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu d-flex flex-row bd-highlight">
                            <div><li><a href="${pageContext.request.contextPath}/utilisateur/listAll">Pompiers</a></li></div>
                            <div><li><a href="${pageContext.request.contextPath}/mission/listAll">Missions</a></li></div>
                            <div><li><a href="#">Gérer les organigrammes</a></li></div>
                            <div><li><a href="#" id="doc">Gérer les documents</a></li></div>
                        </ul>
                    </li>
                    <li><a href="#chat" class="chat order-2">
                        <span style="color: blue;">
                              <i class="far fa-comments"></i>
                        </span>  Chat</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/carte" class="map order-3">
                        <span style="color: #006600;">
                              <i class="fas fa-map-marked-alt"></i>
                        </span>  Map</a>
                    </li>
                    <li><a href="#doc" class="doc order-4">
                             <span style="color: #004C99;">
                              <i class="fas fa-file-alt"></i>
                        </span>  Documents</a>
                    </li>
                    <li>
                        <a href="#organigramme" class="organigramme order-5">
                             <span style="color: #660033;">
                              <i class="fas fa-users"></i>
                        </span>  Organigramme</a>
                    </li>
                    <li><a href="#links" class="links order-6">
                    <span style="color: #E9DB0E;">
                              <i class="fas fa-link"></i>
                        </span>  Liens utiles</a>
                    </li>
                    <li><a href="#fiches" class="fiches order-7">
                    <span style="color: #CC6600;">
                              <i class="fas fa-folder-open"></i>
                        </span>  Fiches</a>
                    </li>
                    <li><a href="#contact" class="contact order-8">
                    <span style="color: #0080FF;">
                              <i class="far fa-id-card"></i>
                        </span>  Contacts</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/utilisateur/get/5" class="name order-sm-0" style="font-weight: bold;">Richard Dupont</a></li>
                    

                </ul>
            </div><!-- /.navbar-collapse -->
    </nav>
</header>