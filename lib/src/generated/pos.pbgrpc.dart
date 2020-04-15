///
//  Generated code. Do not modify.
//  source: pos.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'pos.pb.dart' as $0;
export 'pos.pb.dart';

class UserClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$0.SignUpRequest, $0.SignUpReply>(
      '/pos.User/signUp',
      ($0.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignUpReply.fromBuffer(value));
  static final _$logIn = $grpc.ClientMethod<$0.LogInRequest, $0.LogInReply>(
      '/pos.User/logIn',
      ($0.LogInRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogInReply.fromBuffer(value));

  UserClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.SignUpReply> signUp($0.SignUpRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signUp, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.LogInReply> logIn($0.LogInRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$logIn, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'pos.User';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $0.SignUpReply>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($0.SignUpReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogInRequest, $0.LogInReply>(
        'logIn',
        logIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogInRequest.fromBuffer(value),
        ($0.LogInReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignUpReply> signUp_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.LogInReply> logIn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LogInRequest> request) async {
    return logIn(call, await request);
  }

  $async.Future<$0.SignUpReply> signUp(
      $grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$0.LogInReply> logIn(
      $grpc.ServiceCall call, $0.LogInRequest request);
}
