<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\StationsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index']); /* Showing home page on / route with function index */

Route::get('/', [StationsController::class, 'autocomplete']); /* Returning autocomplete function to the home page for SELECT*/

Route::get('/ajax',[StationsController::class, 'ajax'])->name('ajax'); /* Sending an json response to the ajax script */

Auth::routes(); /* Laravel routes for auth! */
