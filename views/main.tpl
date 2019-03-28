<!DOCTYPE html>

<html>
{{ template "head.tpl" . }}
<article class="page">

  <section>
      <a href="/">{{ template "header.tpl" . }}</a>
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
          </div>
          <div class="card-title">
            <h5>{{ (index $v 0).Name }}</h5>
          </div>
          <div class="card-footer" chart-name={{ (index $v 0).Name }}>
            {{ (index $v 0).Version }}
          </div>           
        </div>        
       {{end}}
        <div class="card tile addchart" chart-name="Add Chart">
          <div class="card-body">
            <div class="icon-container"> 
                <img class="card-img-top" src="static/img/plus.png">
            </div>
          </div>
          <div class="card-title">
            <h5>Add Chart</h5>
          </div>
          <div class="card-footer" chart-name="Add Chart">
          </div>           
        </div> 
				<input type="file" id="uploader" multiple hidden>
      </div>

  </section>

  <section>
    {{ template "footer.tpl" . }}
  </section>

</article>

<script>

  $(document).ready(function(){
			
      $(".card:not(.addchart)").click(function(){
          location.href += 'chart/?name=' + $(this).attr("chart-name");
      });

			var inputUploader = $("#uploader");
			inputUploader.change(function(){
					console.log("SELECTED", inputUploader.prop("files"));
					uploadChart(inputUploader.prop("files"));
			});

			$(".card.addchart").click(function(){
					inputUploader.click();
			});
  });

function uploadChart(files){

		if(!files.length){
			return;
		}

     var formData = new FormData();
     formData.append("chart", files[0])       

    $.ajax({  
         async: true,
         type: "POST",  
         url: "/receive/",  
         data: formData,
         cache: false,
         contentType: false,
         processData: false,
         success: function(data) {
             location.reload();
         }
    });

}

</script>
</html>




