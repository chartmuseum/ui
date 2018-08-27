
<body>
{{ block "header" .}}{{end}}

<div class="content">

<div class="container ">
    <div class="row">

{{range $key, $v:= .charts}}
<div class="card tile" style="width: 15rem;">
  {{ if (index $v 0).Icon}}
  <img class="card-img-top" src={{ (index $v 0).Icon }} alt="Card image cap" style="width: 6rem; height: 6rem">
  {{else}}
  <img class="card-img-top" src="static/img/icon_default.png" alt="Card image cap" style="width: 6rem; height: 6rem">
  {{end}}
  <div class="card-body">
    <h5 class="card-title">{{ (index $v 0).Name }}</h5>
  </div>
    <div class="card-footer">
    {{ (index $v 0).Version }}
  </div>
</div>

{{end}}

</div>
</div>
</div>

{{ block "footer" .}}{{end}}
  
  <div class="backdrop"></div>

  <script src="/static/js/reload.min.js"></script>
</body>
</html>



