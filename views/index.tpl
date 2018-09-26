

<!DOCTYPE html>

<html>
  <head>
    <title>ChartMuseumUI</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="static/img/logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/static/js/reload.min.js"></script> 
    <style type="text/css">
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
        display: grid;
        grid-template-columns: repeat(4, minmax(15rem, 1fr));
        grid-row-gap: 20px;
        grid-column-gap: 20px;
        place-item: center;
      }

      .page{
        height: 100%;
        display: grid;
        grid-template-rows: auto 1fr auto;
        grid-template-columns: 1fr;
        grid-row-gap: 20px;
      }

      .chart-scroller{
        overflow-y: auto;
        overflow-x: hidden;
      }    

      .chart-content {
        display: flex;
        place-items: center;
      }
      .card.tile {
        width: 15rem;
        height: 15rem;
        display: flex;
      }
      .card-body {
        display: flex;
        flex-direction: column;
        place-items: center;
      }

      .card-footer {
        display: flex;
        justify-content: center;
      }

      .icon-container {
        width: 50%;
        height: 100%;
        display: flex;
        place-items: center;
      }

      .icon-container > img {
        max-width: 100%;
        max-height: 100%;
      }

      .logo {
        background-image: url(static/img/logo_white.png);
        background-repeat: no-repeat;
        -webkit-background-size: 200px 100px;
        background-size: 310px 150px;
        background-position: center center;
        text-align: center;
        font-size: 42px;
        padding: 260px 0 20px;
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

  </style>
</head>

<body>
  {{ template "main.tpl" . }}
</body>

</html>