$(document).on('change', '#filter_team_id', function(){
  window.open("/shifts?team_id=" + $("#filter_team_id").val() ,"_self");
});

$(document).on('turbolinks:load', function() {
  $('#filter_team_id').select2({
    placeholder: "",
    allowClear: true
  })
});

function fnManageShift(member_id){
  $.ajax({
    type: "get",
    url: '/shifts/create_member_shift',
    dataType: "script",
    data: {
    	member_id: member_id,
      team_id:  $('#filter_team_id').val()
    }
  }).success(function (data) {});
}
