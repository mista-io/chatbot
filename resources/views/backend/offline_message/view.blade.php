@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
	<div class="panel-heading">{{ _lang('View Offline Message') }}</div>

	<div class="panel-body">
	  <table class="table table-bordered">
		<tr><td>{{ _lang('Name') }}</td><td>{{ $offlinemessage->name }}</td></tr>
			<tr><td>{{ _lang('Email') }}</td><td>{{ $offlinemessage->email }}</td></tr>
			<tr><td>{{ _lang('Mobile') }}</td><td>{{ $offlinemessage->mobile }}</td></tr>
			<tr><td>{{ _lang('Message') }}</td><td>{!! $offlinemessage->message !!}</td></tr>
			
	  </table>
	</div>
  </div>
 </div>
</div>
@endsection


