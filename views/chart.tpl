
<!DOCTYPE html>

<html>
{{ template "head.tpl" . }}
<article class="page">

  <section>
      <a href="/">{{ template "header.tpl" . }}</a>
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
            <p style="display: inline;">{{ $v.Version }}</p>
            <button name="{{ $v.Name }}" version="{{ $v.Version }}" 
            style="background: url(/static/img/delete-button.png);border: none;background-size: contain;background-repeat: no-repeat;height: 30px;margin-left: 20px;" 
            type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="right" title="delete {{ $v.Name }}:{{ $v.Version }}"></button>
            <p></p>
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

document.querySelector('button').addEventListener('click', function () {
  console.log("ready");
  $.post("/delete/",
  {
      name: this.getAttribute("name"),
      version: this.getAttribute("version")
  });
}, false);

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