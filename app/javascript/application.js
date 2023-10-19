// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"

import "bootstrap" '>=4.0.0'

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap/dropdown
//= require turbolinks

function toHide()
{
  $('.Institution').hide()
  $('.College_field').hide()
  $('.School_field').hide()
  $('.Teacher_Student').hide()
  $('.Teacher').hide()
  $('.Student').hide()
  $('.Student_Warden').hide()
  // $('.Guest').hide()
};


function clearInput() {
    document.getElementById("new_user").reset();
};


$(document).ready(function()
{
  toHide()
  $('#user_role_id').click(function()
  {
    var selectedText = $(this).find(":selected").text();

    var sel_Text = document.getElementById('user_role_id').value;
    clearInput()
    document.getElementById('user_role_id').value = sel_Text;


    if (selectedText == 'Principal' || selectedText == 'Teacher' || selectedText == 'Student' || selectedText == 'Warden' || selectedText == 'Peon')
    {
      toHide()
      $('.' + 'Institution').show()
      $('#user_institution_type').click(function()
      {
        var selectedText2 = $(this).find(":selected").text();
        if (selectedText2 == 'College')
        {
          $('.' + 'School').hide()
          $('.' + selectedText2).show()
          clearInstitute();
        }
        else if(selectedText2 == 'School')
        {
          $('.College').hide()
          $('.' + selectedText2).show()
          clearInstitute();
        }
      });
    }

    if(selectedText == 'Teacher')
    {
      toHide();
      $('.' + selectedText).show()
      $('.' + 'Teacher_Student').show()
    }
    else if(selectedText == 'Student')
    {
      toHide();
      $('.' + selectedText).show()
      $('.' + 'Teacher_Student').show()
      $('.Student_Warden').show()
    }
    else if(selectedText == 'Warden')
    {
      toHide();
      $('.' + 'Student_Warden').show()
    }
    
    if(selectedText == 'Visitor')
    {
      toHide();
      alert('Welcome')
    }
  });
});
