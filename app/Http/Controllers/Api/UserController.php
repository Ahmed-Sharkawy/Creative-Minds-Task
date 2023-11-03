<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;

class UserController extends Controller
{
    public function show()
    {
        $user = UserResource::make(auth('api')->user());
        return responseSuccessData($user, 'Success',  201);
    }
}
