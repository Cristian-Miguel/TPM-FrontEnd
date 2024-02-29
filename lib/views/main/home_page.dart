import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/Socket.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Michoacan Ofrece",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, left: 20),
              child: TextButton(
                onPressed: () => SocketManage.connectServer(),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    return const Size(300, 40);
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : Colors.black38;
                  }),
                  alignment: Alignment.center,
                ),
                child: const Text('SOCKET'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
