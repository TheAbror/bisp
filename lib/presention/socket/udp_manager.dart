// import 'dart:io';
// import 'package:udp/udp.dart';

// class UdpManager {
//   static Future<void> init() async {
//     var multicastEndpoint = Endpoint.multicast(
//         InternetAddress("192.168.100.107"),
//         port: Port(8080));

//     var senderEndpoint = Endpoint.multicast(InternetAddress("192.168.100.89"),
//         port: const Port(8081));

//     var receiver = await UDP.bind(multicastEndpoint);

//     var sender = await UDP.bind(senderEndpoint);

//     receiver.asStream().listen((datagram) {
//       if (datagram != null) {
//         var str = String.fromCharCodes(datagram.data);

//         stdout.write(str);
//       }
//     });

//     await sender.send("Foo".codeUnits, multicastEndpoint);

//     await Future.delayed(const Duration(seconds: 5));

//     sender.close();
//     receiver.close();
//   }
// }

// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls


// main() async {
//   var sender = await UDP.bind(Endpoint.any(port: const Port(8081)));

//   // send a simple string to a broadcast endpoint on port 65001.
//   var dataLength = await sender.send(
//       "Hello World!".codeUnits, Endpoint.broadcast(port: const Port(8080)));

//   stdout.write("$dataLength bytes sent.");

//   var receiver = await UDP.bind(Endpoint.loopback(port: const Port(8080)));

//   // receiving\listening
//   receiver.asStream(timeout: const Duration(seconds: 20)).listen((datagram) {
//     var str = String.fromCharCodes(datagram!.data);
//     stdout.write(str);
//   });

//   // close the UDP instances and their sockets.
//   sender.close();
//   receiver.close();
// }

// void main() {
//   var data = "Hello, Sucker";
//   var codec = const Utf8Codec();
//   List<int> dataToSend = codec.encode(data);
//   var addressesIListenFrom = InternetAddress.anyIPv4;
//   print('adresses listened from');
//   int portIListenOn = 8080; //0 is random
//   RawDatagramSocket.bind(addressesIListenFrom, portIListenOn)
//       .then((RawDatagramSocket udpSocket) {
//     udpSocket.forEach((RawSocketEvent event) {
//       if (event == RawSocketEvent.read) {
//         Datagram? dg = udpSocket.receive();
//         dg?.data.forEach((x) => print(x));
//       }
//     });
//     udpSocket.send(dataToSend, addressesIListenFrom, portIListenOn);
//     print('Did send data on the stream..');
//   });
// }
