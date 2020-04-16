import 'package:test/test.dart';
import 'package:grpc/grpc.dart';

import 'package:pos/src/generated/pos.pb.dart';
import 'package:pos/src/generated/pos.pbgrpc.dart';

Future<void> main() async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = UserClient(channel);

  final email = "tester@austincap.com";
  final password = "00000000";
  final wrongPwd = "12345678";

  test('User tester@austincap.com SignUp with password 00000000 should work!', () async {
    try {
      final response = await stub.signUp(SignUpRequest()
                                                ..email = email
                                                ..password = password);
      print('Client received: ${response.message}');
      expect(response.message, equals('SignUp, tester@austincap.com!'));
    } catch (e) {
      print('Caught error: $e');
    }
  });

  test('User tester@austincap.com SignUp with password 00000000 should not work..', () async {
    try {
      final response = await stub.signUp(SignUpRequest()
                                                ..email = email
                                                ..password = password);
      print('Client received: ${response.message}');
      expect(response.message, equals('Error: User already exist!'));
    } catch (e) {
      print('Caught error: $e');
    }
  });

  test('User tester@austincap.com LogIn with password 00000000 should work!', () async {
    try {
      final response = await stub.logIn(LogInRequest()
                                                ..email = email
                                                ..password = password);
      print('Client received: ${response.message}');
      expect(response.message, equals('LogIn, tester@austincap.com!'));
    } catch (e) {
      print('Caught error: $e');
    }
  });

  test('User tester@austincap.com LogIn with password 12345678 should not work..', () async {
    try {
      final response = await stub.logIn(LogInRequest()
                                                ..email = email
                                                ..password = wrongPwd);
      print('Client received: ${response.message}');
      expect(response.message, equals('Error: User login failed!'));
    } catch (e) {
      print('Caught error: $e');
    }
  });

  // await channel.shutdown();
  // gRPC disconnect error is ok
}
