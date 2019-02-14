<%-- <header>
		<nav class="navbar">
		<div class="container">
		<div class="navbar-header">
		 
		<ul class="menu">
			<li><a href="#s1">Gestion Missions</a>
				<ul class="submenu">
					<li><a href="${pageContext.request.contextPath}/mission/new">Nouvelle mission</a></li>
					<li><a href="${pageContext.request.contextPath}/mission/listAll">Lister Tous</a></li>
				</ul>
			</li>
    
 		</ul>	
		 
	 </div>
   </div>
  </nav>
 </header>
  --%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<style>

body {
  margin: 0;
  font-family: Raleway, sans-serif;
  background-color: #f4f4f4;
}

a {
  color: #000;
}


/* header */

.dropdown-menu li a{
    padding: 10px 12px !important; 
    
}

.dropdown-menu li {
    width: 100%;
    
}

.header li a:hover,
.header .menu-btn:hover {
  background-color: #f2f2f2;
}

.header li {
    float: left;
}
.header li a {
  display: block;
  padding: 25px 25px;
  text-decoration: none;
  font-size: 1.2em;
}

.header .logo {
  display: block;
  float: left;
  font-size: 1.6em;
  padding: 20px 25px;
  text-decoration: none;
}


.navbar-toggle{
    border: none;
}

.navbar-toggle .fa{
  position: relative;
  width: 32px;
  font-size: 20px;
  margin:0px;
  padding: 5px;
    cursor: pointer;
}

@media (max-width: 1520px) {
.header li a {
  padding: 25px 20px !important;
  font-size: 1.1em;
}

}
    
    
@media (max-width: 1280px) { 
    
            .navbar-header {
            float: none;
            }
            .navbar-toggle {
            display: block;
            }
            .navbar-collapse {
            border-top: 1px solid transparent;
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
            }
            .navbar-collapse.collapse {
            display: none!important;
            }
            .navbar-nav {
            float: none!important;
            margin: 7.5px -15px;
            }
            .navbar-nav>li {
            float: none;
            }
            .navbar-nav>li>a {
            padding-top: 10px;
            padding-bottom: 10px;
            }
            .navbar-text {
            float: none;
            margin: 15px 0;
            }
            /* cette classe est à ajouter lorsque que vous utilisez une version de Bootstap supérieure ou égale à la 3.1.0 */
            .navbar-collapse.collapse.in {
            display: block!important;
            }
            .collapsing {
            overflow: hidden!important;
            }
    
            .header li a {
              padding: 18px 15px !important;

             }
    
            .dropdown-menu li a{
            padding: 12px 15px !important; 

            }
    
             #doc{
                padding-bottom:30px !important; 
             }
    
    
}    

</style>


 <header class="header">
    <nav id="myNavbar" class="navbar navbar-default" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <label class="menu-icon" for="menu-btn"><span class="fa fa-bars"></span></label>
                </button>
                <a class="logo" href="#">INSARAG</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right menu">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle order-1">Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu d-flex flex-row bd-highlight">
                            <div><li><a href="#">Pompiers</a></li></div>
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
                    <li><a href="#map" class="map order-3">
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
                    <li><a href="#name" class="name order-sm-0" style="font-weight: bold;">Richard Dupont</a></li>
                    

                </ul>
            </div><!-- /.navbar-collapse -->
    </nav>
</header>