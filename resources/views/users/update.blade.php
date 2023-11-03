@extends('layouts.app')

@section('content')
    <div class="container">
        <form action="{{ route('user.update', $user->id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="row">
                <div class="form-group col-4">
                    <label for="User_Name">User Name</label>
                    <input type="text" name="username" value="{{ old('username', $user->username) }}"
                        class="form-control @error('username') is-invalid @enderror" id="User_Name" placeholder="User Name">
                    @error('username')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group col-4">
                    <label for="number">Phone Number</label>
                    <input type="number" name="phone" value="{{ old('phone', $user->phone) }}"
                        class="form-control @error('phone') is-invalid @enderror" id="number" placeholder="Phone Number">
                    @error('phone')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group col-4">
                    <label for="password">password</label>
                    <input type="password" name="password" value="{{ old('password') }}"
                        class="form-control @error('password') is-invalid @enderror" id="password" placeholder="password">
                    @error('password')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group col-4">
                    <label for="exampleFormControlSelect1">select Admin</label>
                    <select name="admin" class="form-control @error('admin') is-invalid @enderror"
                        id="exampleFormControlSelect1">
                        <option @if ($user->admin == 0) selected @endif value="0">User</option>
                        <option @if ($user->admin == 1) selected @endif value="1">Admin</option>
                    </select>
                    @error('admin')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                    @enderror
                </div>
            </div>

            <button type="submit" class="btn btn-primary mt-4">Update</button>
        </form>
    </div>
@endsection
