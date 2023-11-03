<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\Auth\LoginResource;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Resources\Auth\RegisterResource;
use App\Http\Requests\Api\Auth\RegisterRequest;
use App\Http\Requests\Api\Auth\VerificationPhoneRequest;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $code = random_int(100000, 999999);

        $user = User::create([
            'password' => Hash::make($request->password),
            'code'     => $code
        ] + $request->validated());

        $status = sendSMSUsingTwilio('01068173169', $code);

        if ($status->status() != 200)
            // When any error occurs in the transmission, I will write codes that secure this topic, and this is only for experience

            $user['token']            = auth('api')->login($user);
        $user['expiration_token'] = auth('api')->payload()['exp'];
        $registerData             = RegisterResource::make($user);

        return responseSuccessData($registerData, 'Success',  201);
    }

    public function login(LoginRequest $request)
    {
        if (! $token = Auth::guard('api')->attempt(['phone' => $request->phone, 'password' => $request->password]))
            return responseErrorMessage('تاكد من بيانات التسجيل', 401);

        $user                     = auth('api')->user();
        $user['token']            = $token;
        $user['expiration_token'] = auth('api')->payload()['exp'];
        $user = LoginResource::make($user);

        return responseSuccessData($user);
    }

    public function verificationPhone(VerificationPhoneRequest $request)
    {
        $user = User::find(auth('api')->id());

        if ($user->code != $request->code)
            return responseErrorMessage('رمز التحقق غير صحيح');

        $user->update(['phone_verified_at' => now(), 'code' => null]);
        return responseSuccessMessage('تم تاكيد رقم الهاتف بنجاح');
    }
}
