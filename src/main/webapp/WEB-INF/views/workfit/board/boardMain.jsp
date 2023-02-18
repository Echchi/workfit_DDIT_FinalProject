<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<h1>TEST BOARD Main</h1>
	
 <div id="summernote-editmode" class="click2edit">
 <h5>Hello User, </h5>
    <p>We create simple, flat & responsive admin dashboard template.</p>
    <p>Please, write text here!</p>
    <p class="lead">Super simple WYSIWYG editor on bootstrap.</p>
</div>	
<!-- <button id="edit" class="btn btn-primary btn-sm"><i class="mdi mdi-pencil mr-1"></i> Edit</button> -->
<!-- <button id="save" class="btn btn-success btn-sm mt-2" style="display: none;"><i class="mdi mdi-content-save-outline mr-1"></i> Save Changes</button> -->





<script>
$(document).ready(function() {
// 	var edit = function() {
// 		  $('.click2edit').summernote({focus: true});
// 		};

// 		var save = function() {
// 		  var markup = $('.click2edit').summernote('code');
// 		  $('.click2edit').summernote('destroy');
// 		};
  $('.click2edit').summernote({
	  height: 400,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true    
  });
  
});

</script>