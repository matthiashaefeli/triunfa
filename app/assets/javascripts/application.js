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
//= require jquery_ujs

//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$( document ).on('turbolinks:load', function() {

  // creates new table for conversation
  $(".mySearch").on("keyup", function() {
    let tableId = $(this).siblings("table")[0].id
    let table = document.getElementById(tableId);
    tr = table.getElementsByTagName("tr");
    var value = $(this).val().toLowerCase();
    $(tr).filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

  // show folders list
  $('.folders').on("click", function() {     
    let paperNew = $(this);
    paperNew.parent().parent().next().children().children().toggle();
  })

  // show paper list
  $(".papers-text").click(function(){
    let paperShow = $(this);
    paperShow.closest(".folder-names").siblings(".papers-all").toggle();
  });

  // shos list off all users online
  $("#who-is").click(function(){
    $("#who-is-online").toggle();
  });

  // show course create form
  $("#new-course").click(function(){
    $("#new-course-hidden").toggle();
  });

  // show course edit form
  $("#edit-course").click(function(){
    $("#edit-course-hidden").toggle();
  });

  // show group create form
  $("#new-group").click(function(){
    $("#new-group-hidden").toggle();
  });

  // show group edit form
  $("#edit-group").click(function(){
    $("#edit-group-hidden").toggle();
  });

  // show create new teacher form
  $("#new-teacher").click(function(){
    $("#new-teacher-hidden").toggle();
  });

  // show statistic list
  $(".stat-show").click(function(){
    $(".stat-show-child").toggle();
  });

  // show teacher list
  $(".teacher-show-text").click(function(){
    $(".teacher-show-all").toggle();
  });

  // show admin list
  $(".admin-show-text").click(function(){
    $(".admin-show-all").toggle();
  });

  // show create new folder
  $(".create-new-folder-text").click(function(){
    $(".create-new-folder").toggle();
  });

  // show create admin form
  $("#new-admin").click(function(){
    $("#new-admin-hidden").toggle();
  });

  // show comment form on all chats
  $(".all-forums").on("click",".show-comments", function(){
    let comment = $(this)
    comment.siblings(".comments").toggle();
  });

  // send delete conversation data to controller
  $(".conv-x").click(function(event){
    event.preventDefault()
    let $that = $(this);
    let $id = $that.attr('href').match(/\d/g).join("")
    $.ajax({
        type: 'DELETE',
        url: $that.attr('href'),
        datatype: 'html'
    })
  })

  // submit like to controller
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

  // reset chat form after submit
  $('.chat_send').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  // reset message form after submit
  $('#room-message-text-submit').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  // reset talk form after submit
  $('#talk-text-submit').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  // reset publication form after submit
  $('#publication-text-submit').on("click", function() {
    $that = $(this);
    setTimeout(function() {
      $that.closest('form').get(0).reset()
    }, 1000)
  })

  // send create todo data to controller and update on page
  $(".todo-form").on("submit", function(event) {
    event.preventDefault();
    let $form = $(this);

    $.ajax({
      type: $form.attr("method"),
      url: $form.attr("action"),
      data: $form.serialize()

    }).done(function(response) {
      $form.get(0).reset()
      $(".todos-all").append(response);
    });
  })

  // send update todo data to controller and update on page
  $(".todos-all").on("click", ".todo-done", function() {
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

  // send delete todo data to controller and update on page
  $(".todos-all").on("click", ".todo-delete", function() {
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

    // send create grocery data to controller and update on page
    $(".grosery-form").on("submit", function(event) {
      event.preventDefault();
      let $form = $(this);
  
      $.ajax({
        type: $form.attr("method"),
        url: $form.attr("action"),
        data: $form.serialize()
  
      }).done(function(response) {
        $form.get(0).reset()
        $(".grocery-all").append(response);
      });
    })

  // send update grocery data to controller and update on page
  $(".grocery-all").on("click", ".grosery-done", function() {
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

  // send delete grocery data to controller and updae page
  $(".grocery-all").on("click", ".grosery-delete", function() {
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

  // send data to controller translate api
  $(".translate-button").on("click", function() { 
    let language
    if(document.getElementById("es-en").checked){
      language = "es-en"
    }else {
      language = "en-es"
    }
    // let text = document.getElementById("text-to-translate").innerText.replace(/\r?\n|\r/g, "")
    let text = $(this).closest('.button-div').siblings('#text-to-translate').children(".textarea")[0].value
    $.ajax({
      type: "GET",
      url: "/translate",
      data: {language: language, text: text}

    }).done(function(response) {
      document.getElementById("text-translated").innerText = ""
      document.getElementById("text-translated").append(response.text.join(" "))
    })
  })

  // clear comment form after submit
  $(".comment-text").on("keydown", function() {
    let text = $(this);
    if(event.keyCode === 13) {
      setTimeout(function() {
        text[0].value = ""
      },1000)
    }
  })

  // change value c and f
  $(".unit").on("click", function() {
    let newValue
    let value = document.getElementsByClassName("value")[0].innerText;
    let type = document.getElementsByClassName("type")[0].innerText;
    if(type === "°C"){
      newValue = ((parseFloat(value)*1.8)+32).toFixed(2);
      document.getElementsByClassName("value")[0].innerText = newValue;
      document.getElementsByClassName("type")[0].innerText = "°F ";
      document.getElementsByClassName("unit")[0].innerText = "Cambiar a °C";
    }else {
      newValue = ((parseFloat(value)-32)*0.556).toFixed(2);
      document.getElementsByClassName("value")[0].innerText = newValue;
      document.getElementsByClassName("type")[0].innerText = "°C ";
      document.getElementsByClassName("unit")[0].innerText = "Cambiar a °F";
    };
  });

  // send data to controller grammar api
  $(".grammar-button").on("click", function() {
    let text = $(this).closest('.button-div').siblings('#text-grammar').children(".textarea")[0].value
    // let text = document.getElementById("text-grammar").innerText.replace(/\r?\n|\r/g, "")
    $.ajax({
      type: "GET",
      url: "/grammar",
      data: {text: text}
    }).done(function(response) {
      document.getElementById("errors").innerHTML = ""
      for (let i = 0; i < response.matches.length; i++) {
        let word = text.substr(response.matches[i].context.offset, response.matches[i].context.length)
        if(response.matches[i].replacements.length > 0) {
          text = text.replace(word, response.matches[i].replacements[0].value)
        }
        document.getElementById("errors").append(response.matches[i].message + ",")
      }
      document.getElementById("text-checked").innerHTML = text
    });
  });

  // slideshow resources index page

  $("#slideshow > div:gt(0)").hide();

  $("#arrow-right").on("click", function() {
    $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
  })

  $("#arrow-left").on("click", function() {
    $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
  })

  // setInterval(function() { 
  //   $('#slideshow > div:first')
  //     .fadeOut(1000)
  //     .next()
  //     .fadeIn(1000)
  //     .end()
  //     .appendTo('#slideshow');
  // },  3000);

  // jquery and ajax create new chat in comunity
  // $(".save-chat").on("submit",function(event) {
  //   event.preventDefault();
  //   let $form = $(this)
  //   $.ajax({
  //     type: $form.attr("method"),
  //     url: $form.attr("action"),
  //     data: $form.serialize(),

  //   }).done(function(response) {
  //     $form.get(0).reset()
  //     $(".publication-themes").append(response)
  //   })
  // })

  // change teacher status with jquery and ajax
  $(".thumbs-teacher").on("click", function() {
    let $form = $(this);
    let id = $form.find('span')[0].innerText;
    let url = '/teachers/'+id;
    $.ajax({
      type: "delete",
      url: url
    }).done(function(response) {
      if(response.status === true) {
        $form.removeClass("fa-thumbs-down").addClass("fa-thumbs-up")
      }else {
        $form.removeClass("fa-thumbs-up").addClass("fa-thumbs-down")
      }
    });
  });

  // change language on index without login
  $("#change-lang-to-en").on("click", function() {
    $("#change-lang-to-en").addClass("active-lang")
    $("#change-lang-to-es").removeClass("active-lang")
    $(".english").removeClass("change-language");
    $(".spanish").addClass("change-language");
  });

  $("#change-lang-to-es").on("click", function() {
    $("#change-lang-to-en").removeClass("active-lang")
    $("#change-lang-to-es").addClass("active-lang")
    $(".spanish").removeClass("change-language");
    $(".english").addClass("change-language");
  });

})
