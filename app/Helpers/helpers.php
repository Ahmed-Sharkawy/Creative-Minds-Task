<?php

use Faker\Core\Number;
use Illuminate\Support\Facades\Http;

if (!function_exists('responseSuccessData')) {
    function responseSuccessData(string|array|object $data, string $message = 'Success', int $status = 200)
    {
        return response()->json([
            'statusType' => true,
            'status'     => $status,
            'message'    => $message,
            'data'       => $data,
        ], $status);
    }
}

if (!function_exists('responseSuccessMessage')) {
    function responseSuccessMessage(string $message = 'Success', int $status = 200)
    {
        return response()->json([
            'statusType' => true,
            'status'     => $status,
            'message'    => $message,
        ], $status);
    }
}

if (!function_exists('responseErrorMessage')) {
    function responseErrorMessage(array|string|object $error, int $status = 400)
    {
        return response()->json([
            'statusType' => false,
            'status'     => $status,
            'error'      => $error,
        ], $status);
    }
}

if (!function_exists('sendSMSUsingTwilio')) {
    function sendSMSUsingTwilio(int $phone, string $message)
    {
        $url = 'https://api.twilio.com/2010-04-01/Accounts/' . env('TWILIO_ACCOUNT_SID'). '/Messages.json';

        $response = Http::asForm()
            ->withBasicAuth(env('TWILIO_ACCOUNT_SID'), env('TWILIO_AUTH_TOKEN'))
            ->post($url, [
                'From' => env('TWILIO_PHONE_NUMBER'),
                'To'   => '+20' . $phone,
                'Body' => $message,
            ]);

        return $response;
    }
}
