// Copyright (c) 2018, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Dart implementation of the gRPC pos.User server.
import 'package:grpc/grpc.dart';

import 'package:pos/src/generated/pos.pb.dart';
import 'package:pos/src/generated/pos.pbgrpc.dart';

import 'package:pos/user.dart';
import 'package:pos/api.dart';


class UserService extends UserServiceBase {

  @override
  Future<SignUpReply> signUp(ServiceCall call, SignUpRequest request) async {

    List<User> dbUsers = await API.findUser({'email': request.email, 'password': request.password});
    if(dbUsers.length == 0){
      await API.insertOneUser({'email': request.email, 'password': request.password});
      return SignUpReply()..message = 'SignUp, ${request.email}!';
    }else{
      return SignUpReply()..message = 'Error: User already exist!';
    }

  }

  @override
  Future<LogInReply> logIn(ServiceCall call, LogInRequest request) async {

    List<User> dbUsers = await API.findUser({'email': request.email, 'password': request.password});
    print(dbUsers.first.password);
    print(request.password);
    if(dbUsers.length == 1 && dbUsers.first.password == request.password){
      return LogInReply()..message = 'LogIn, ${request.email}!';
    }else{
      return LogInReply()..message = 'Error: User login failed!';
    }

  }
}

Future<void> main(List<String> args) async {

  final server = Server([UserService()]);
  await server.serve(port: 50051);
  await API.init();
  print('Server listening on port ${server.port}...');
}
