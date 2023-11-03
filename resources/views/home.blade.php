@extends('layouts.app')

@section('content')
    <div class="container">
        <button type="button" class="btn btn-success mb-4">Create User</button>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">username</th>
                    <th scope="col">phone</th>
                    <th scope="col">admin</th>
                    <th scope="col">code</th>
                    <th scope="col">phone_verified_at</th>
                    <th scope="col">created_at</th>
                    <th scope="col">updated_at</th>
                    <th colspan="2" scope="col">action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($users as $user)
                    <tr>
                        <th scope="row">{{ $user->id }}</th>
                        <th>{{ $user->username }}</th>
                        <th>{{ $user->phone }}</th>
                        <th>{{ $user->admin }}</th>
                        <th>{{ $user->code }}</th>
                        <th>{{ $user->phone_verified_at }}</th>
                        <th>{{ $user->created_at }}</th>
                        <th>{{ $user->updated_at }}</th>
                        <th>
                            <a href="{{ route('user.edit', $user->id) }}" class="btn btn-info">Update</a>
                        </th>
                        <th>
                            <a href="{{ route('user.destroy', $user->id) }}" class="btn btn-danger">Delete</a>
                        </th>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection
