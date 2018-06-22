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

  $(".all-forums").on("click",".show-comments", function(){
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

  $(".all-forums").on("click", ".likeable", function(event) {
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

  $('.chat_send').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  $('#room-message-text-submit').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  $('#talk-text-submit').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  $('#publication-text-submit').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  $(".todo-done").on("click", function() {
    $done = $(this)
    id = $done.closest(".todo-each")[0].id.match(/\d+/g)

    $.ajax({
      type: "PUT",
      url: "/todos/"+id,
      datatype: "Html" 
    }).done(function() {
      $done.closest(".todo-each").children(".todo-name").addClass("text-design")
    })
  })

  $(".todo-delete").on("click", function() {
    $done = $(this)
    id = $done.closest(".todo-each")[0].id.match(/\d+/g)

    $.ajax({
      type: "DELETE",
      url: "/todos/"+id,
      datatype: "Html" 
    }).done(function() {
      $done.closest(".todo-each").remove()
    })
  })

  $(".grosery-done").on("click", function() {
    $done = $(this)
    id = $done.closest(".grosery-each")[0].id.match(/\d+/g)

    $.ajax({
      type: "PUT",
      url: "/groseries/"+id,
      datatype: "Html" 
    }).done(function() {
      $done.closest(".grosery-each").children(".grosery-name").addClass("text-design")
    })
  })

  $(".grosery-delete").on("click", function() {
    $done = $(this)
    id = $done.closest(".grosery-each")[0].id.match(/\d+/g)

    $.ajax({
      type: "DELETE",
      url: "/groseries/"+id,
      datatype: "Html" 
    }).done(function() {
      $done.closest(".grosery-each").remove()
    })
  })

  $(".translate-button").on("click", function() { 
    let language
    if(document.getElementById("es-en").checked){
      language = "es-en"
    }else {
      language = "en-es"
    }
    let toAppend = $(this).parents().siblings(".text-translated")
    let text = $(this).parents().siblings(".text-to-translate")[0].innerText
    let key = "trnsl.1.1.20180621T203147Z.8164cf6a3861cf8b.b9853839b7381d066cd4ab6afe804f913ae7958e"
    let url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=" + key + "&lang=" + language + "&text=" + text
    $.getJSON( url, function(data) {
      toAppend.append(data.text)
    })
  })
})