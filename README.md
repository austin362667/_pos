# pos

A new Flutter project using Dart to build backend, and gRPC for communication which means no json or http/1. 

## Getting Started
* constructing..

## gRPC quick-start
1. Protocol Buffers v3 
2. Update a gRPC service
3. Generate gRPC code..
```
protoc --dart_out=grpc:lib/src/generated -Iprotos protos/pos.proto
```
4. Update server and client and run the application!

## Database
using PostgreSQL

```
initdb.exe -D "C:\local\posDb"
pg_ctl -D "C:\local\posDb" -l logfile start
createdb db
psql db
CREATE TABLE "user" (email varchar(80),password varchar(80));
SELECT * FROM "user";
DELETE FROM "user";
```


## Testing Outcome

```
flutter test       
C:\Users\Austin\Desktop\cc\pos>flutter test        
00:03 +0: C:\Users\Austin\Desktop\cc\pos\test\unit_test.dart: User tester@austincap.com SignUp with password 00000000 should work!
Client received: SignUp, tester@austincap.com!     
00:03 +1: C:\Users\Austin\Desktop\cc\pos\test\unit_test.dart: User tester@austincap.com SignUp with password 00000000 should not work..
Client received: Error: User already exist!        
00:03 +2: C:\Users\Austin\Desktop\cc\pos\test\unit_test.dart: User tester@austincap.com LogIn with password 00000000 should work!
Client received: LogIn, tester@austincap.com!      
00:03 +3: C:\Users\Austin\Desktop\cc\pos\test\unit_test.dart: User tester@austincap.com LogIn with password 12345678 should not work..
Client received: Error: User login failed!
00:04 +5: All tests passed!
```