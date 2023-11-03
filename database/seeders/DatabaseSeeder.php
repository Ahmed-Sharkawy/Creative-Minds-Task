<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::create([
            'username'          => 'Admin',
            'phone'             => '123456789',
            'admin'             => 1,
            'phone_verified_at' => now(),
            'password'          => Hash::make(123456789),
        ]);

        User::factory(20)->create();
    }
}
