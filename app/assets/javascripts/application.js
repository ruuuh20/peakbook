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
//= require rails-ujs

//= require jquery

$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {

// // $('#student_form_id').hide();
//
// $('add_student_id').click(function(e) {
//   e.preventDefault();
//   $('#student_form_id').show();
// })

  // $grades = $('#grade_assignment_id').html();
// dynamicdependent dropdown list
  // $("#student']").click(function(){
  //   var url = '/get_drop_down_options?category_id=' + $(this).val()
  //   $("#group").removeOption(/./)
  //   $.get(url, function(data) {
  //     $('#group').addOption(data, false);
  //   });
  // });

  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $(".sidebar-wrapper").toggleClass("active");
  });

// click to see list of assignments
  $("a.show_assignments").one("click", function(e) {
  e.preventDefault();
  const courseId = $(this).attr("data-courseid")

  $.get(`/courses/${courseId}/assignments.json`).success(function(json) {
    var $ol = $("div.courses ol")
    json.forEach(function(assignment) {
       $(".load_assignments").append("<h4>" + assignment.name + "</h4>");
    })
    // const filtered = json.filter(assignment => assignment.date.slice(0, 4) === "2017")

  // filtered.forEach(function(assignment) {
  //   // debugger
  //   $(".load_assignments").append("<h2>" + assignment.name + "</h2>")
  //
  // })
  })
})
}

function Student(student) {
  // debugger
  this.id = student.id;
  this.last_name = student.last_name
  this.first_name = student.first_name
}

Student.prototype.formatIndex = function() {
  // console.log(this)
  let html = ""
  html = `<h1>${this.last_name}</h1>` +
          `<h3>${this.first_name}</h3>`


  $("#studentName").append(html)
}

//Submit via ajax
$(function() {
  $("#new_student").on("submit", function(e) {
    e.preventDefault();
    // url = $(this).url
    const action = $(this).attr('action') + ".json"
    const id = $(this).attr("data-id")
    const values = $(this).serialize();
    // debugger
    //using low-level ajax instead of $.post
    $.ajax({
      url: action,
      data: values,
      dataType: "json",
      method: "POST"
    })
    .success(json => {


      const newStudent= new Student(json)

      newStudent.formatIndex();


    })
    .error(function() {
      alert("You are not authorized to do this..")
    })
  })
})
