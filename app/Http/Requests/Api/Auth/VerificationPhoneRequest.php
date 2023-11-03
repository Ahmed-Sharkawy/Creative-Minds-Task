<?php

namespace App\Http\Requests\Api\Auth;

use Faker\Provider\Base;
use App\Http\Requests\Api\BaseFormRequest;

class VerificationPhoneRequest extends BaseFormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'code' => 'required|numeric'
        ];
    }
}
