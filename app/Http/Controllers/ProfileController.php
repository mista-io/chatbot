<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\User;
use Hash;
use Auth;

class ProfileController extends Controller
{

    public function my_profile()
    {
        $profile = User::find(Auth::User()->id);
        return view('backend.profile.profile_view',compact('profile'));
    }

    public function edit()
    {
        $profile = User::find(Auth::User()->id);
        return view('backend.profile.profile_edit',compact('profile'));
    }


    public function update(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => [
                'required',
                Rule::unique('users')->ignore(Auth::User()->id),
            ],
            'profile_picture' => 'nullable|image|max:5120',
        ]);

        $profile = User::find(Auth::User()->id);
        $profile->name = $request->name;
        $profile->email = $request->email;
		if ($request->hasFile('profile_picture')){
            $image = $request->file('profile_picture');
            $file_name = "profile_".time().'.'.$image->getClientOriginalExtension();
            $image->move(base_path('public/uploads/profile/'),$file_name);
            $profile->profile_picture = $file_name;
        }
		//$profile->facebook = $request->facebook=="" ? "#" : $request->facebook;
	    //$profile->twitter = $request->twitter=="" ? "#" : $request->twitter;
	    //$profile->linkedin = $request->linkedin=="" ? "#" : $request->linkedin;
	    //$profile->google_plus = $request->google_plus=="" ? "#" : $request->google_plus;
        $profile->save();

        return redirect('profile/my_profile')->with('success', _lang('Information has been updated'));
    }

    /**
     * Show the form for change_password the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function change_password()
    {
        return view('backend.profile.change_password');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update_password(Request $request)
    {
        $this->validate($request, [
            'oldpassword' => 'required',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = User::find(Auth::User()->id);
        if(Hash::check($request->oldpassword, $user->password)){
            $user->password = Hash::make($request->password);
            $user->save();
        }else{
            return back()->with('error', _lang('Old Password did not match !'));
        }
        return back()->with('success', _lang('Password has been changed'));
    }

}
