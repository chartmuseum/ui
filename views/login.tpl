<!DOCTYPE html>

<html>
{{ template "head.tpl" . }}
  <div class="login-page">
   <div class="form">
    <form class="login-form">
      <input id="username" type="text" placeholder="username"/>
      <input id="password" type="password" placeholder="password"/>
      <button type="submit" id="login-button">login</button>
    </form>
   </div>
  </div>

<script>


$(document).ready(function(){
  
  console.log("ready");

  $(".login-form").submit(function(){
        username = $("#username").val(); 
        password = $("#password").val();

        $.post("/login/",
        {
            username: username,
            password: password
        });

        return false;
    });

});


</script>

</html>


