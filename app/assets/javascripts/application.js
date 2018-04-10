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
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $(".sidebar-wrapper").toggleClass("active");
    // console.log("hi")

  });

  $("a.show_assignments").on("click", function(e) {
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
