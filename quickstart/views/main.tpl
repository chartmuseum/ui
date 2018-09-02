<!DOCTYPE html>

<html>
{{ template "head.tpl" . }}
<article class="page">

  <section>
      {{ template "header.tpl" . }}
  </section>

  <section class="chart-content chart-scroller">
  
      <div class="gallery">

        {{range $k, $v:= .charts}}
        <div class="card tile" chart-name={{ (index $v 0).Name }}>
          <div class="card-body">
            <div class="icon-container">
              {{ if (index $v 0).Icon}}  
                <img class="card-img-top" src={{ (index $v 0).Icon }}>
              {{else}}
                <img class="card-img-top" src="static/img/icon_default.png">
              {{end}}
            </div>
            <h5 class="card-title">{{ (index $v 0).Name }}</h5>
          </div>
          <div class="card-footer" chart-name={{ (index $v 0).Name }}>
            {{ (index $v 0).Version }}
          </div>           
        </div>        
      {{end}}

      </div>

  </section>

  <section>
    {{ template "footer.tpl" . }}
  </section>

</article>

<script>

$(document).ready(function(){
    $(".card").click(function(){
        location.href += '/chart/?name=' + $(this).attr("chart-name");
    });
});

</script>
</html>




