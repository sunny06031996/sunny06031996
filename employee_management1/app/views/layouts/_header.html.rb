<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Navbar with Social Media Icons</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Raleway">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body{
  background: #eeeeee;
  font-family: 'Varela Round', sans-serif;
}
.form-inline {
  display: inline-block;
}
.navbar-header.col {
  padding: 0 !important;
}
.navbar {
  background: #fff;
  padding-left: 16px;
  padding-right: 16px;
  border-bottom: 1px solid #d6d6d6;
  box-shadow: 0 0 4px rgba(0,0,0,.1);
}
.nav-link {
  margin: 0 5px;
}
.nav-link img {
  border-radius: 50%;
  width: 36px;
  height: 36px;
  margin: -8px 0;
  float: left;
  margin-right: 10px;
}
.navbar .navbar-brand {
  color: #555;
  padding-left: 0;
  font-size: 20px;
  padding-right: 50px;
  font-family: 'Raleway', sans-serif;
}
.navbar .navbar-brand b {
  font-weight: bold;
  color: #eb5844;
}
.navbar .navbar-nav a:hover, .navbar .navbar-nav a:focus {
  color: #f08373 !important;
}
.navbar .navbar-nav a.active, .navbar .navbar-nav a.active:hover {
  color: #eb5844 !important;
  background: transparent !important;
}
.search-box {
  position: relative;
}
.search-box input.form-control {
  padding-right: 35px;
  border-radius: 0;
  padding-left: 0;
  border-width: 0 0 1px 0;
  box-shadow: none;
}
.search-box input.form-control:focus {
  border-color: #f08373;
}
.search-box .input-group-text {
  min-width: 35px;
  border: none;
  background: transparent;
  position: absolute;
  right: 0;
  z-index: 9;
  padding: 7px 0 7px 7px;
  height: 100%;
}
.search-box i {
  color: #a0a5b1;
  font-size: 19px;
}
.navbar .nav-item i {
  font-size: 18px;
}
.navbar .dropdown-item i {
  font-size: 16px;
  min-width: 22px;
}
.navbar .nav-item.show > a {
  background: none !important;
}
.navbar .dropdown-menu {
  border-radius: 1px;
  border-color: #e5e5e5;
  box-shadow: 0 2px 8px rgba(0,0,0,.05);
}
.navbar .dropdown-menu a {
  color: #777;
  padding: 8px 20px;
  line-height: normal;
  font-size: 15px;
}
.navbar .navbar-form {
  margin-right: 0;
  margin-left: 0;
  border: 0;
}
@media (min-width: 992px){
  .form-inline .input-group {
    width: 250px;
    margin-right: 30px;
  }
}
@media (max-width: 991px){
  .form-inline {
    display: block;
    margin-bottom: 10px;
    margin-top: 0;
  }
  .input-group {
    width: 100%;
  }
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
 
  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
    <span class="navbar-toggler-icon"></span>
  </button>
  <!-- Collection of nav links, forms, and other content for toggling -->
  <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
    <div class="navbar-nav">


      <%= link_to "SignUp", new_employee_registration_path, :class =>"nav-item nav-link"%>
      <%= link_to "LogIn", employee_session_path, :class =>"nav-item nav-link"%>
      <%= link_to 'Sign Out', destroy_employee_session_path, method: :delete, class: "nav-item nav-link" %>
      </div>
    <div class="navbar-nav ml-auto">
      <div class="navbar-form-wrapper">
        <form class="navbar-form form-inline">
          <div class="input-group search-box">
            <input type="text" id="search" class="form-control" placeholder="Search Here...">
            <div class="input-group-append">
              <span class="input-group-text">
                <i class="material-icons">&#xE8B6;</i>
              </span>
            </div>
          </div>
                </form>
            </div>

        </div>
  </div>
</nav>
</body>
</html>
