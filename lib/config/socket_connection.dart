import 'package:socket_io_client/socket_io_client.dart';
import 'package:turismo_flutter/config/constants/https_routes.dart';

class SocketManage {
  static connectServer() {
    Socket socket = io(
      RoutesHTTP,
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.connect();
    socket.on('recibir-mensajes', (payload) => {print(payload)});
    socket.disconnect();
  }
}
