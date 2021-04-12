@extends('layouts.app')

@section('content')
<div class="container mx-auto mx-sm-auto mx-md-auto mx-lg-auto">
    <h1 class="text-white">Trains Schedule</h1>
    <h3 class="text-white">Choose start and stop destination</h3>
    <img src="https://upload.wikimedia.org/wikipedia/sr/4/44/Serbian_Railways.svg.png" class=" float-right" alt="">
    <form class="bg-primary rounded-lg px-5 py-5">
      @csrf
      <div class="form-group mt-5">
        <label class="text-white font-weight-bold">FROM :</label>
        <select name="start" id="start" class="form-control select2" style="width: 100%">
          @foreach ($starts as $start )
            <option value="{{ $start->name }}">{{ $start->name }}</option>
          @endforeach
        </select>
      </div>
      <div class="form-group">
        <label class="text-white font-weight-bold">TO :</label>
        <select name="stop" id="stop" class="form-control select2" style="width: 100%">
          @foreach ($stops as $stop )
            <option value="{{ $stop->name }}">{{ $stop->name }}</option>
          @endforeach
        </select>
      </div>
      
      <button type="submit" id="submit" class="btn btn-secondary">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
</svg>
      </button>
    </form>
    <div class="alert bg-white" style="display: none">
      <p class="text-center text-danger text-uppercase font-weight-bold">Stations between you and the destination:</p>
      
      <p class="text-center" id="list" style="list-style-type: none;">

      </p>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>

 $(document).ready(function() {
    $('.select2').select2({
      width: 'resolve'
    });
});


$(document).ready(function(){
  $('#submit').click(function(e){
    e.preventDefault();
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $("meta[name='csrf-token']").attr('content')
      }
    });

    $.ajax({
      url: "{{ route('ajax') }}",
      method: "GET",
      data: {start: $('#start').val(), 
             stop: $('#stop').val()},
      dataType: 'json',

      success: function(results){
        $('.alert').fadeIn();
        var stops = results.stations;
        var st = "";
        for(var i=0;i<stops.length;i++)
        {
          st += "<li class='text-center text-uppercase'> <strong>Station name:   </strong> "+stops[i].name+"<strong>  Time:   </strong>"+stops[i].time+"<strong>  Train number:   </strong>"+stops[i].train_number+"</li><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-down-square-fill' viewBox='0 0 16 16'><path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0z'/></svg>";
        }
        
        $('#list').html(st);
        
      }    
    })

  });
});

</script>
@endsection