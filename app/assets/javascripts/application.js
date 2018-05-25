// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


$( document ).on('turbolinks:load', function() {


    $(".mySearch").on("keyup", function() {
        let tableId = $(this).siblings("table")[0].id
        let table = document.getElementById(tableId);
        tr = table.getElementsByTagName("tr");
        var value = $(this).val().toLowerCase();
        $(tr).filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });


    $('.folders').on("click", function() {     
        let paperNew = $(this);
        paperNew.parent().parent().next().children().children().toggle();
    })

    $(".papers-text").click(function(){
        let paperShow = $(this);
        paperShow.closest(".folder-names").siblings(".papers-all").toggle();
    });

    $("#who-is").click(function(){
        $("#who-is-online").toggle();
    });

    $("#new-course").click(function(){
        $("#new-course-hidden").toggle();
    });

    $("#edit-course").click(function(){
        $("#edit-course-hidden").toggle();
    });

    $("#new-group").click(function(){
        $("#new-group-hidden").toggle();
    });

    $("#edit-group").click(function(){
        $("#edit-group-hidden").toggle();
    });

    $("#new-teacher").click(function(){
        $("#new-teacher-hidden").toggle();
    });

    $(".stat-show").click(function(){
        $(".stat-show-child").toggle();
    });

    $(".teacher-show-text").click(function(){
        $(".teacher-show-all").toggle();
    });

    $(".admin-show-text").click(function(){
        $(".admin-show-all").toggle();
    });

    $(".create-new-folder-text").click(function(){
        $(".create-new-folder").toggle();
    });

    $("#new-admin").click(function(){
        $("#new-admin-hidden").toggle();
    });

    $(".show-comments").click(function(){
        let comment = $(this)
        comment.siblings(".comments").toggle();
    });

    $(".conv-x").click(function(event){
        event.preventDefault()
        let $that = $(this);
        let $id = $that.attr('href').match(/\d/g).join("")
        $.ajax({
            type: 'DELETE',
            url: $that.attr('href'),
            datatype: 'html'

        })
        // .done(function(response){
        //     // let id = "#conv"+$id
        //     // $(id).remove()   
        // });
    })

    $(".likeable").click(function(event) {
        event.preventDefault()
        let path
        let text
        let newValue
        let newString
        let $that = $(this)
        if($that.closest(".comment").siblings(".chats").find(".like-count").length == 0) {
            path = $that.closest(".comment").siblings(".chats").find(".like")[0];
            text = '<i class="fa fa-thumbs-o-up" aria-hidden="true"> 1</i>';
        }else {
            path = $that.closest(".comment").siblings(".chats").find(".like-count")[0];
            newValue = parseInt($that.closest(".comment").siblings(".chats").find(".like-count")[0].innerHTML) + 1
            newString = " "+newValue.toString()
            text = newString
        }
        $.ajax({
            type: "POST",
            url: $that.attr('href'),
            datatype: 'html'
        })
        .done(function(response) {
            console.log(response)
            path.innerHTML = text;
            $that.remove()
        })

    })

  })

