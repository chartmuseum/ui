<head>
    <title>ChartMuseumUI</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="static/img/logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/static/js/reload.min.js"></script> 
    <style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #0db7ed;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #0db7ed;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #0db7ed;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #384d54; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #384d54, #384d54);
  background: -moz-linear-gradient(right, #384d54, #384d54);
  background: -o-linear-gradient(right, #384d54, #384d54);
  background: linear-gradient(to left, #384d54, #384d54);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

html, body {
  height: 100vh;
  width: 100vw;
  overflow: hidden;
}

*,body {
  margin: 0px;
  padding: 0px;
}

body {
  margin: 0px;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  line-height: 20px;
}

header,
footer {
  width: 100%;
  margin-left: auto;
  margin-right: auto;
  background-color: #384d54;
  color: white;
}

.gallery{
  width: 70vw;
  margin: auto;
  display: grid;
  grid-template-columns: repeat(4, minmax(15rem, 1fr));
  grid-row-gap: 20px;
  grid-column-gap: 20px;
  place-items: center;
}

.page{
  height: 100%;
  display: grid;
  background-color: #d3dbdb;
  grid-template-rows: auto 1fr auto;
  grid-template-columns: 1fr;
  grid-row-gap: 20px;
}

.chart-scroller{
  overflow-y: auto;
  overflow-x: hidden;
}    

.chart-content {
  position: relative;
  display: flex;
  place-items: center;
}
.card.tile {
  width: 15rem;
  height: 15rem;
  display: flex;
  cursor: pointer;
}

.card.addchart{
    opacity: 0.5;
}
.card.addchart:hover{
    opacity: 1.0;
}

.card-body {
  position: relative;
}

.card-title{
  margin: 0 auto;
}

.card-footer {
  display: flex;
  justify-content: center;
}

.icon-container {
  width: 50%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
}

.icon-container > img {
  max-width: 100%;
  max-height: 100%;
}

.logo {
  background-image: url(/static/img/logo_white.png);
  background-repeat: no-repeat;
  background-size: 10rem 10rem;
  background-position: 50% 1rem;
  text-align: center;
  font-size: 3rem;
  padding: 12rem 0rem 0.5rem;
  font-weight: normal;
}

header {
  padding: 0;
}

footer {
  width: 100%;
  height: 60px;   /* Height of the footer */
  background: #384d54;
  line-height: 1.8;
  text-align: center;
  padding: 10px 0;
  color: #999;
}

.description {
  text-align: center;
  font-size: 16px;
}

.content {
  text-align: center;
  font-size: 16px;      
}

a {
  color: white;
  text-decoration: none;
}

.backdrop {
  position: absolute;
  width: 100%;
  height: 100%;
  box-shadow: inset 0px 0px 100px #ddd;
  z-index: -1;
  top: 0px;
  left: 0px;
}

.tile {
  display: inline-block;
}

.author {
  color: white;
}

.my-card {
  padding-right: 40px;
  padding-left: 40px;
  padding-bottom: 40px;
}

  ::selection { background: #a4dcec; }
  ::-moz-selection { background: #a4dcec; }
  ::-webkit-selection { background: #a4dcec; }
  
  ::-webkit-input-placeholder { /* WebKit browsers */
    color: #ccc;
    font-style: italic;
  }
  :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color: #ccc;
    font-style: italic;
  }
  ::-moz-placeholder { /* Mozilla Firefox 19+ */
    color: #ccc;
    font-style: italic;
  }
  :-ms-input-placeholder { /* Internet Explorer 10+ */
    color: #ccc !important;
    font-style: italic;  
  }
  
  br { display: block; line-height: 2.2em; } 
  
  article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
  ol, ul { list-style: none; }
  
  input, textarea { 
    -webkit-font-smoothing: antialiased;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    outline: none; 
  }
  
  blockquote, q { quotes: none; }
  blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
  strong { font-weight: bold; } 
  
  table { border-collapse: collapse; border-spacing: 0; }
  img { border: 0; max-width: 100%; }
  
  #topbar {
    background: #4f4a41;
    padding: 10px 0 10px 0;
    text-align: center;
    height: 36px;
    overflow: hidden;
    -webkit-transition: height 0.5s linear;
    -moz-transition: height 0.5s linear;
    transition: height 0.5s linear;
  }
  #topbar a {
    color: #fff;
    font-size:1.3em;
    line-height: 1.25em;
    text-decoration: none;
    opacity: 0.5;
    font-weight: bold;
  }
  #topbar a:hover {
    opacity: 1;
  }
  
  
  h2 {
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    font-size: 2.1em;
    line-height: 1.4em;
    letter-spacing: normal;
    margin-bottom: 20px;
    padding: .1em 0;
    color: #444;
      position: relative;
      overflow: hidden;
      white-space: nowrap;
      text-align: center;
  }
  
  p {
    display: block;
    font-size: 1.4em;
    line-height: 1.55em;
    margin-bottom: 22px;
    color: #555;
  }
    
  .center { display: block; text-align: center; }
  
  /** page structure **/
  #w {
    display: block;
    width: 750px;
    margin: 0 auto;
    padding-top: 30px;
    padding-bottom: 45px;
  }
  
  #content {
    display: block;
    width: 100%;
    background: #fff;
    padding: 25px 20px;
    padding-bottom: 35px;
    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
    -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  }
  
  #userphoto {
    display: block;
    float: right;
    margin-left: 10px;
    margin-bottom: 8px;
  }
  #userphoto img {
    display: block;
    padding: 2px;
    background: #fff;
    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.4);
    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.4);
    box-shadow: 0 1px 3px rgba(0,0,0,0.4);
  }
  
  
  /** profile nav links **/
  #profiletabs {
    display: block;
    margin-bottom: 4px;
    height: 50px;
  }
  
  #profiletabs ul { list-style: none; display: block; width: 70%; height: 50px; }
  #profiletabls ul li { float: left; }
  #profiletabs ul li a { 
    display: block;
    float: left;
    padding: 8px 11px;
    font-size: 1.2em;
    font-weight: bold;
    background: #eae8db;
    color: #666;
    margin-right: 7px;
    border: 1px solid #fff;
    -webkit-border-radius: 5px;
    -webkit-border-bottom-left-radius: 0;
    -moz-border-radius: 5px;
    -moz-border-radius-bottomleft: 0;
    border-radius: 5px;
    border-bottom-left-radius: 0;
  }
  #profiletabs ul li a:hover {
    text-decoration: none;
    background: #dad7c2;
    color: #565656;
  }
  
  #profiletabs ul li a.sel {
    background: #fff;
    border-color: #d1cdb5;
  }
  
  
  /** profile content sections **/
  .hidden {
    display: none;
  }
  
  .activity {
    border-bottom: 1px solid #d6d1af;
    padding-bottom: 4px;
  }
  
  .setting {
    display: block;
    font-weight: normal;
    padding: 7px 3px;
    border-top: 1px solid #d6d1af;
    margin-bottom: 5px;
  }
  .setting span {
    float: left; 
    width: 250px;
    font-weight: bold;
  }
  .setting span img { 
    cursor: pointer;
  }
  
  
  #friendslist {
    display: block;
    font-size: 1.1em;
    font-weight: bold;
  }
  #friendslist li { line-height: 30px; }
  #friendslist li a {
    float: left;
    height: 30px;
    padding: 3px 6px;
    line-height: 22px;
     margin-right: 15px;
    border: 1px solid #c9d8b8;
  }

  #friendslist li a img { float: left; margin-right: 5px; }
  
  /** clearfix **/
  .clearfix:after { content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0; }
  .clearfix { display: inline-block; }
   
  html[xmlns] .clearfix { display: block; }
  * html .clearfix { height: 1%; }
  
  </style>
</head>