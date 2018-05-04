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
        let idOfTable = $(this).siblings("table")[0].id
        let table = document.getElementById(idOfTable);
        tr = table.getElementsByTagName("tr");
        var value = $(this).val().toLowerCase();
        $(tr).filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });


    $('.folders').on("click", function() {        
        let paperNew = $(this);
        paperNew.parent().siblings(".add-papper").toggle();
    })

    $(".papers-text").click(function(){
        let paperShow = $(this);
        paperShow.parent().siblings(".papers-all").toggle();
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

    $(".conv-x").click(function(event){
        event.preventDefault()
        let $that = $(this);
        let $id = $that.attr('href').match(/\d/g).join("")
        $.ajax({
            type: 'DELETE',
            url: $that.attr('href'),
            datatype: 'html'

        })
        .done(function(response){
            let id = "#conv"+$id
            // $(id).remove()   
        });
    })

  })

