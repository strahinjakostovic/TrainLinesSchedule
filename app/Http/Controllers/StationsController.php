<?php

namespace App\Http\Controllers;  /* Namespace for controller */

use Illuminate\Http\Request;
use App\Models\Start;
use App\Models\Stop;
use App\Models\Station;

class StationsController extends Controller /* Extending Controller from the namespace */
{
   /* Function for showing database values in the select array of objects */
    public function autocomplete(Request $request) 
    {
       $starts = Start::all(); /* All start stations // Accessing through model */
       $stops = Stop::all(); /* All stop stations */
       return view('index')->with(['starts' => $starts, /* Returning our index view with starts and stops values */
                                    'stops' => $stops]);            
    }
    /* Function to make our array of objects with the LINE */
    public function ajax(Request $request){
    /* Validation of the form */
            $this->validate($request, [
            'start' => 'required',
            'stop' => 'required'
        ]);

        /* Taking all the values where start and stopstation names are equal to users input.
            Than we transform it to array of objects. */
        $stations = \DB::table('stations')
            ->join('starts', 'start_id', '=', 'starts.id')
            ->join('stops', 'stop_id', '=', 'stops.id')
            ->select('stations.name','stations.time','stations.train_number')
            ->where('starts.name', $request->start)
            ->where('stops.name', $request->stop)
            ->get()->toArray();
            /* This is array_map  where we can create a callback function if we want */
         $finish = array_map(null, $stations); 
         /* Returning json response with an array of objects stored in $finish, and we can return users input to display it again*/
        return response()->json(['stations' => $finish,
                                 'start' => $request->start,
                                'stop' => $request->stop                              
                            
        ]);
    }

}

