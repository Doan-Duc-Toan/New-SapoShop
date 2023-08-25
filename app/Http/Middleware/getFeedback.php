<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Feedback;
class getFeedback
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $feedbacks = Feedback::orderBy('created_at','desc')->get();
        view()->share('feedbacks', $feedbacks);

        return $next($request);
    }
}
