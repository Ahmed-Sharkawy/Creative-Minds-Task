<?php

namespace App\Http\Requests\Api\Auth;

use App\Http\Requests\Api\BaseFormRequest;

class RegisterRequest extends BaseFormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'username'              => 'required|string|max:255',
            'phone'                 => 'required|unique:users,phone|numeric',
            'password'              => 'required|string|max:255|min:6|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'required|string|min:6|max:255|required_with:password'
        ];
    }
}
