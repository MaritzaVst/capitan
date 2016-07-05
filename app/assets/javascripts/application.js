//= require jquery-1.11.3.min
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require codemirror
//= require jquery.mousewheel-min
//= require mode/xml
//= require mode/javascript
//= require mode/css
//= require mode/htmlmixed
//= require addons/display/placeholder
//= require addons/display/fullscreen
//= require addons/fold/foldcode
//= require addons/fold/foldgutter
//= require addons/fold/brace-fold
//= require addons/fold/xml-fold
//= require addons/fold/markdown-fold
//= require addons/fold/comment-fold
//= require addons/scroll/simplescrollbars
//= require pagedown_bootstrap
//= require pagedown_init
//= require jquery_nested_form
//= require sweetalert.min
//= require Markdown.Extra
//= require pages/form
//= require pages/show
//= require_self

$(document).ready(function() {
    $(".alert").fadeTo(4000, 500).slideUp(500, function(){
        $(this).alert('close');
    });
    $(".arrow").on("click", function(a) {
        a.preventDefault();
        var elemClass = $(this).attr("data-el"); 
        $(this).toggleClass("hide"); 
        $(this).siblings("." + elemClass).toggleClass("hide");
    });
});