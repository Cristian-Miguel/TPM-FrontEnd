// import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'RutasHTTP.dart';

class SocketManage {
  static connectServer() {
    Socket socket = io(
      RutasHTTP.url,
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.connect();
    socket.on('recibir-mensajes', (payload) => {print(payload)});
    socket.disconnect();
  }
}
