@extends('layouts.app') <!-- Extending app.blade.php -->

@section('content') <!-- This is the main content that is going to show in app.blade.php -->
<div class="container mx-auto mx-sm-auto mx-md-auto mx-lg-auto"> <!-- Creating bootstrap container and setting it to be responsive -->
    <h1 class="text-white">Trains Schedule</h1>
    <h3 class="text-white">Choose start and stop destination</h3>
    <img src="https://upload.wikimedia.org/wikipedia/sr/4/44/Serbian_Railways.svg.png" class=" float-right" alt=""> <!-- Transparent image for the form -->
    <form class="bg-primary rounded-lg px-5 py-5"> <!-- Bootstrap form with blue background, rounded cornter, vertial and horizontal padding -->
      @csrf <!-- Cross-site request forgery for security -->
      <div class="form-group mt-5"> <!-- First form group with top margin -->
        <label class="text-white font-weight-bold">FROM :</label>
        <select name="start" id="start" class="form-control select2" style="width: 100%"> <!-- Select pane  -->
          @foreach ($starts as $start ) <!-- Loop through every start station and display it in select -->
            <option value="{{ $start->name }}">{{ $start->name }}</option> <!-- Value of the option is equal to name // See Controller for more // Displaying its name to the user-->
          @endforeach <!-- Ending for loop -->
        </select>
      </div>
      <div class="form-group"> <!-- Second form group -->
        <label class="text-white font-weight-bold">TO :</label>
        <select name="stop" id="stop" class="form-control select2" style="width: 100%"> <!-- Select pane -->
          @foreach ($stops as $stop ) <!-- Loop through every stop station and display it in select -->
            <option value="{{ $stop->name }}">{{ $stop->name }}</option> <!-- Value of the option is equal to name // See Controller for more // Displaying its name to the user-->
          @endforeach <!-- Ending for loop -->
        </select>
      </div>
      
      <button type="submit" id="submit" class="btn btn-secondary"> <!-- Submit search button with svg from bootstrap -->
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
</svg>
      </button>
    </form>
    <div class="alert bg-white" style="display: none"> <!-- This will be displayed when script executes -->
      <p class="text-center text-danger text-uppercase font-weight-bold">Stations between you and the destination:</p>
      
      <p class="text-center" id="list" style="list-style-type: none;"> <!-- Sending Line and list of stations from ajax script here -->

      </p>

    </div>
</div>
<!-- JQUERY , SELECT2 SCRIPT-->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
/* SELECT2 function that helps us make searchable dropdown*/
 $(document).ready(function() {
    $('.select2').select2({ 
      width: 'resolve' /* Overwrites responsive */
    });
});

/* JQUERY AJAX SCRIPT */
$(document).ready(function(){
  $('#submit').click(function(e){
    e.preventDefault(); /* Do not refresh page when submit button is clicked */
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $("meta[name='csrf-token']").attr('content') /* Setting up ajax header CSRF */
      }
    });

    $.ajax({
      url: "{{ route('ajax') }}", /* Sending Ajax Script to the route with name ajax */
      method: "GET", /* We can't use POST because in the same time we need to take input values and get data based on the inputs */
      data: {start: $('#start').val(),  /* Storing input in variable */
             stop: $('#stop').val()},
      dataType: 'json', /* Data type is JSON because we are returning json response from back-end */

      success: function(results){ /* On success show .alert div*/
        $('.alert').fadeIn(); /* Nice fade in  */
        var stops = results.stations; /* Storing array of objects  */
        var st = ""; /* Empty variable  */
        for(var i=0;i<stops.length;i++) /* loop through the array */
        {
          /* add list item to the st variable, display name of the station, 
          train take off time
          and train number that is going through the station */
          st += "<li class='text-center text-uppercase'> <strong>Station name:   </strong> "+stops[i].name+"<strong>  Time:   </strong>"+stops[i].time+"<strong>  Train number:   </strong>"+stops[i].train_number+"</li><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-down-square-fill' viewBox='0 0 16 16'><path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0z'/></svg>";
        }
        
        $('#list').html(st); /* Put st variable in the list as HTML */
        
      }    
    })

  });
});

</script>
@endsection <!-- Ending the main section-->