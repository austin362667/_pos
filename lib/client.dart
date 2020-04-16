// import 'package:grpc/grpc.dart';

// import 'package:pos/src/generated/pos.pb.dart';
// import 'package:pos/src/generated/pos.pbgrpc.dart';

// Future<void> main(List<String> args) async {
//   final channel = ClientChannel(
//     'localhost',
//     port: 50051,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   );
//   final stub = UserClient(channel);

//   final email = "austin362667@gmail.com";
//   final password = "00000000";

//   try {
//     final response = await stub.signUp(SignUpRequest()
//                                                 ..email = email
//                                                 ..password = password);
//     print('Client received: ${response.message}');

//   } catch (e) {
//     print('Caught error: $e');
//   }
//   await channel.shutdown();
// }
