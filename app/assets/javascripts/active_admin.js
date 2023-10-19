//= require arctic_admin/base

$(document).ready(function()
{
  $('#school_medium_input').hide()
});

$( document ).ready(function() {
  $('#school_affiliation').change(function(){
    if($(this).val() == 'State'){
      $('#school_medium_input').show('normal')
    }
    else
      $('#school_medium_input').hide('fast')
  });
});

function toHide()
{
  $('.Institution').hide()
  $('.College').hide()
  $('.School').hide()
  $('.Teacher_Student').hide()
  $('.Teacher').hide()
  $('.Student').hide()
  $('.Student_Warden').hide()
  // $('.Guest').hide()
};


function clearInput() {
    document.getElementById("new_user").reset();
};



function clearInstitute()
{
  document.getElementById("user_college_id").empty().attr('disabled','disabled');
  document.getElementById("user_school_id").val([]);
}



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

