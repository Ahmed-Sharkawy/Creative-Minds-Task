<?php

namespace App\Http\Resources\Auth;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RegisterResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'                => $this->id,
            'username'          => $this->username,
            'phone'             => $this->phone,
            'phone_verified_at' => $this->phone_verified_at,
            'created_at'        => $this->created_at->format('Y m d'),
            'updated_at'        => $this->updated_at->format('Y m d'),
            'expiration_token'  => $this->expiration_token,
            'token'             => $this->token,
        ];
    }
}
