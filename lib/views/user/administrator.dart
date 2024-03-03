import 'package:flutter/material.dart';
import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'package:turismo_flutter/views/user/login.dart';

class Administrator extends StatefulWidget {
  const Administrator({super.key});

  @override
  State<Administrator> createState() => _AdministratorState();
}

class _AdministratorState extends State<Administrator> {
  var isCloseSession = false;

  @override
  Widget build(BuildContext context) {
    return isCloseSession ? const Login() : administratorView();
  }

  administratorView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                'Admin profile',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: TextButton(
                onPressed: () async => {
                  await ManageSecureStorage.deleteToken(),
                  setState(() {
                    isCloseSession = true;
                  }),
                },
                child: const Text("Log out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
