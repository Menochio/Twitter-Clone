<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="/static/images/favicon.ico"/>
    <title>Login Form</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <style>
     #main {
    min-height: 100%;
      /* Equal to height of footer */
    /* But also accounting for potential margin-bottom of last child */
    margin-bottom: -50px;
    }
html, body {

    height: 100%;
    margin: 0;
  }

body {
    /* font-family: 'Stylish', sans-serif !important; */
    /* font-family: 'Yanone Kaffeesatz', sans-serif !important; */
    font-family:     PayPal-Sans-Big, "Helvetica Neue", Arial, sans-serif !important;

}

@font-face {
    font-family: PayPal-Sans;
    font-style: normal;
    src: url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansSmall-Regular.woff2) format('woff2'), url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansSmall-Regular.woff) format('woff'), url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansSmall-Regular.eot) format('embedded-opentype'), url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansSmall-Regular.svg) format('svg')
}

@font-face {
    font-family: PayPal-Sans-Big;
    font-style: normal;
    src: url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansBig-Light.woff2) format('woff2'), url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansBig-Light.woff) format('woff'), url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansBig-Light.eot) format('embedded-opentype'), url(https://www.paypalobjects.com/digitalassets/c/paypal-ui/fonts/PayPalSansBig-Light.svg) format('svg')
}

a, a:link, a:visited {
    color: #0070ba !important;
    font-family: HelveticaNeue,"Helvetica Neue",Helvetica,Arial,sans-serif !important;
    font-weight: 400;
    text-decoration: none;
    -webkit-transition: color .2s ease-out;
    -moz-transition: color .2s ease-out;
    -o-transition: color .2s ease-out;
    transition: color .2s ease-out;
}

a:hover, a:focus {

    text-decoration: underline !important;
    outline: 0 !important;
}

/* .btn > a {
    color: #ffffff !important;
    text-decoration: none !important;
} */
.bg-darkblue {
    background: #44238b !important;
    color: #fcfcfc;
}

.bg-lil-white {
        background: #fcfcfc !important;
    /* color: #F7F5EB; */
}
.title {
    color: #0070ba;
    padding: 15px;
    font-family:     PayPal-Sans-Big, "Helvetica Neue", Arial, sans-serif;
font-weight: 800;
font-style: normal;
font-size: 30px;
line-height: 36px;
}

.sub-title {
font-family:     PayPal-Sans-Big, "Helvetica Neue", Arial, sans-serif;
font-weight: 300;
font-style: normal;
font-size: 30px;
line-height: 36px;
Color: #000000;
}

#login-page {

    min-height: 100vh;
}


input {

    margin-bottom: 15px !important;
    /* border-radius: 10px !important; */

    padding: 20px !important;


}

#content {
    border: 1px solid #eaeced;
    background: #ffffff;
    width: 40% !important;
    padding: 20px 20px 0 20px;
    margin: 10px;
    box-shadow: 0px 6px 5px #e3e3e3;
}


.form-control:focus {
    border-color: #009cde !important;
    box-shadow: 0 0 0 0.05rem #009bde73 !important;
}

.form-control {
    width: 100%;
    height: 50px;
    padding: 12.5px;
    border: 1px solid #9da3a6;
    border-radius: 5px;
    background: #fff;
    -webkit-transition: border-color .15s;
    -o-transition: border-color .15s;
    transition: border-color .15s;

}

::placeholder {
    color: #7c7c7c !important;
line-height: 28.8px;
    font-size: 14px !important;
}

#loginBtn {

    background-color: #0070ba;
    border-radius: 1.5rem;
    border: .0625rem solid #0070ba;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-family: PayPal-Sans,Helvetica Neue,Arial,sans-serif;
    font-size: .9375rem;
    line-height: 1.5rem;
    margin-bottom: 1.5rem;
    min-width: 6rem;
    padding: .6875rem 1.4375rem;
    text-align: center;
    text-decoration: none;
    transition: color 240ms,background-color 240ms,border-color 240ms,box-shadow 240ms;
    font-weight: 700;
    -webkit-font-smoothing: antialiased;
}



#loginBtn:hover {
    background-color: #003087;
    border-color: #003087;
}


#sign-Up-Btn{
    width: 100%;
    min-height: 44px;
    padding: 0;
    border: 0;
    display: block;
    background-color: #E1E7EB;
    color: #2C2E2F;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -khtml-border-radius: 4px;
    border-radius: 4px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    cursor: pointer;
    -webkit-appearance: none;
    -moz-appearance: none;
    -ms-appearance: none;
    -o-appearance: none;
    appearance: none;
    -webkit-tap-highlight-color: transparent;
        font-size: 1em;
    text-align: center;
    font-weight: 700;
    font-family: HelveticaNeue-Medium,"Helvetica Neue Medium",HelveticaNeue,"Helvetica Neue",Helvetica,Arial,sans-serif;
    text-shadow: none;
    text-decoration: none;
    -webkit-transition: background-color .4s ease-out;
    -moz-transition: background-color .4s ease-out;
    -o-transition: background-color .4s ease-out;
    transition: background-color .4s ease-out;
    -webkit-font-smoothing: antialiased;
}

#sign-Up-Btn a:hover {
font-weight: 600;
}

#sign-Up-Btn a{
    background-color: #E1E7EB;
    color: #2C2E2F;
text-decoration: none !important
}


.footer {
    margin-top: 10px;
    padding: 7px 0 0;
    clear: both;
    color: #9e9e9e;
    text-align: center !important;
       background-color: #f7f9fa;
}


.checkmark {
    position: absolute;
    top: 5px;
    left: 0;
    right: 0;
    height: 25px;
    width: 25px;
border-radius: 5px;

}


  /* Hide default checkbox */

  input[type="checkbox"] {
    position: absolute;
    opacity: 0 !important;
    cursor: pointer;
    height: 0 !important;
    width: 0 !important;
  }

  input:checked ~ .checkmark:after {
    display: block;
  }

  /* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
  }

  input:checked ~ .checkmark {
    background-color: #0070ba !important;
  }

  input ~ .checkmark {
    background-color: #e3e3e3;
  }

.checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
  }

.form-check-input {
    position: relative !important;
    margin-top: 0;
    margin-left: 0;
}

.checkBoxContent {
    padding-left: 15px;
margin-top:0;
cursor: pointer;
}

@media only screen and (max-width:786px) {
    #content {
        border: 1px solid #eaeced;
        background: #ffffff;
        width: 100% !important;
        padding: 20px 20px 0 20px;
        margin: 10px;
        box-shadow: 0px 6px 5px #e3e3e3;
    }

#loginBtn {
    width: 100% !important;
    border-radius: 5px !important;
}
}

/* The pwErrMessage box is shown when the user clicks on the password field */
#pwErrMessage ,  #confirm__Pw__ErrMessage{
    display:none;
    background: #f9f8f8;
    color: #000;
    position: relative;
    padding: 20px;
    margin-top: 10px;
  }

  #pwErrMessage p ,#confirm__Pw__ErrMessage p  ,#CheckPassword{
    padding: 0px 35px;
    font-size: 12px;

  }

  /* Add a green text color and a checkmark when the requirements are right */
  .valid  , .isMatched {
    color: #0070ba;
  }

  .valid:before  ,.isMatched::before{
    position: relative;
    left: -35px;
    content: "✔";
  }

  /* Add a red text color and an "x" when the requirements are wrong */
  .invalid ,.isMatched {
    color: #ff0000;
  }

  .invalid:before ,  .notMatched::before  {
    position: relative;
    left: -35px;
    content: "X";
  }
</style>
</head>
<body>
    <!doctype html>
<html lang="en">

<head>
  <title>Sign up | Lending App</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
  </script>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <!-- font -->
  <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
</head>

<body class="bg-lil-white">
  <div class="container-fluid" id="main">
    <div class="row  d-flex align-items-center justify-content-center" id="login-page">
      <div class="col-lg-4 col-sm-12 col-xs-12 col-md-6" id="content"> <span class="text-center">
 </span>
        <div class="text-center">
          <h1 class="title">TWITTER</h1>
          <p class="sub-title">Connect to social Media</p>
          <p class="sub-title">Sign up now</p>
        </div>
        <!-- login form starts -->
        <div class="form-group d-block mx-auto">
          <form action="" method="post" class="mx-auto" autocomplete="off">
            <input type="email" class="form-control" name="userEmail" id="user-email-id"
              aria-describedby="helpEmail" placeholder="Enter your email ID" autocomplete="off" required autocomplete="off">
            <input type="password" class="form-control" name="userPW" id="user-password" placeholder="Enter your password">

            <div class="text-center">
              <button type="button" class="btn btn-primary mt-3" id="loginBtn">Login</button>
            </div>
            <h2 class="text-center" id="showCon" style="color:red ;display: none;"> </h2>
          </form>
        </div>
      </div>
    </div>

  <script>
    $(document).ready(function(){
      let email,password,error;
      function validateForm(){
        if(!email){
          if(!error)error="InValidCredentials Filled";
        }
        else if(!password){
          if(!error)error="InValidCredentials Filled";
        }
        else if(password.length<3){
          error="Password Length must be greater than 3"
        }
        if(!error)return true;
        else return false;
      }
      $("#loginBtn").click(function(){
        email = $("#user-email-id").val();
        password =$("#user-password").val();
        error = null;
        let user={
          "email":email,
          "password":password
        }
        let cond = validateForm();

        if(error){
          $("#showCon").html(error);
          $("#showCon").show();
        }

        else{
          $.ajax({
            type:"POST",
            url:"/login/welcome",
            data:JSON.stringify(user),
            success:function(response){
            console.log(response)
                 if(response.is_loggedIn == true){
                    location.href = "/user/home"
                 }
                 else{
                    $("#user-email-id").val("");
                    $("#user-password").val("");
                    alert("Please Enter correct Credentials");
                 }
            },
            contentType:"application/json"
          })
        }
      })
    })



  </script>
</body>
</html>