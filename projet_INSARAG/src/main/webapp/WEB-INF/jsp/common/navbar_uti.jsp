<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light ombre">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/Accueil">INSARAG</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample" aria-controls="navbarsExample" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample">
        <ul class="navbar-nav ml-auto ">
         
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="#"> -->
<!--                 <span style="color: blue;"> -->
<!--                     <i class="far fa-comments"></i> -->
<!--                 </span>  Chat</a> -->
<!--           </li> -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/carte">
                <span style="color: #006600;">
                    <i class="fas fa-map-marked-alt"></i>
                </span>  Map</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/documents">
                <span style="color: #004C99;">
                    <i class="fas fa-file-alt"></i>
                </span>  Documents</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/organigramme">
                <span style="color: #660033;">
                    <i class="fas fa-users"></i>
                </span>  Organigramme</a>
          </li>
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="#"> -->
<!--                 <span style="color: #E9DB0E;"> -->
<!--                     <i class="fas fa-link"></i> -->
<!--                 </span>  Liens utiles</a> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="#"> -->
<!--                 <span style="color: #CC6600;"> -->
<!--                     <i class="fas fa-folder-open"></i> -->
<!--                 </span>  Fiches</a> -->
<!--           </li> -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/utilisateur/listAllInMision">
                <span style="color: #0080FF;">
                    <i class="far fa-id-card"></i>
                </span>  Contacts</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-weight: bold;" href="${pageContext.request.contextPath}/utilisateur/get/${sessionScope.id}">Mon profil</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/" >
                   <i class="fas fa-power-off"></i>
            </a>
          </li>
                    
        </ul>
      </div>
    </nav>