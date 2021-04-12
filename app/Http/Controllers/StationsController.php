<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Start;
use App\Models\Stop;
use App\Models\Station;

class StationsController extends Controller
{
   
    public function autocomplete(Request $request)
    {
       $starts = Start::all();
       $stops = Stop::all();
       return view('index')->with(['starts' => $starts,
                                    'stops' => $stops]);           
    }

    public function ajax(Request $request){

            $this->validate($request, [
            'start' => 'required',
            'stop' => 'required'
        ]);


        $stations = \DB::table('stations')
            ->join('starts', 'start_id', '=', 'starts.id')
            ->join('stops', 'stop_id', '=', 'stops.id')
            ->select('stations.name','stations.time','stations.train_number')
            ->where('starts.name', $request->start)
            ->where('stops.name', $request->stop)
            ->get()->toArray();

         $finish = array_map(null, $stations);

        return response()->json(['stations' => $finish,
                                 'start' => $request->start,
                                'stop' => $request->stop                              
                            
        ]);
    }

}

