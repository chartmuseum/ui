
<!DOCTYPE html>

<html>
{{ template "head.tpl" . }}
<article class="page">

  <section>
      {{ template "header.tpl" . }}
  </section>

  <section>  
    <div id="w">
    <div id="content" class="clearfix">
      {{ if (index .chart 0).Icon }}
        <div id="userphoto"><img src={{ (index .chart 0).Icon }} alt="default avatar"></div>
      {{else}}
        <div id="userphoto"><img src="static/img/icon_default.png" alt="default avatar"></div>
      {{end}}
      
      <h1>{{ (index .chart 0).Name }}</h1>

      <nav id="profiletabs">
        <ul class="clearfix">
          <li><a href="#description" class="sel">Description</a></li>
          <li><a href="#version">Version</a></li>
        </ul>
      </nav>
      
      <section id="description">
        <p>{{ (index .chart 0).Description }} </p>
      </section>
      
      <section id="version" class="hidden">
        {{range $v:= .chart}}
          <p>{{ $v.Version }}</p>
        {{end}}
      </section>
      
    </div><!-- @end #content -->
  </div><!-- @end #w -->
  </section>

  <section>
    {{ template "footer.tpl" . }}
  </section>

</article>

<script type="text/javascript">
$(function(){
  $('#profiletabs ul li a').on('click', function(e){
    e.preventDefault();
    var newcontent = $(this).attr('href');
    
    $('#profiletabs ul li a').removeClass('sel');
    $(this).addClass('sel');
    
    $('#content section').each(function(){
      if(!$(this).hasClass('hidden')) { $(this).addClass('hidden'); }
    });
    
    $(newcontent).removeClass('hidden');
  });
});
</script>
</html>