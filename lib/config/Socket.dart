import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketManage {
  static const ruta = 'http://localhost:4040';
  // static const ruta = 'http://10.0.2.2:4040';

  static connectServer() {
    Socket socket = io(
      ruta,
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.connect();
  }
}
