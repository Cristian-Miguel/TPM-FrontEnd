import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/user/login.dart';
import 'package:turismo_flutter/middleware/jwt_manage.dart';
import 'package:turismo_flutter/middleware/check_rol.dart';
import 'package:turismo_flutter/views/user/administrator.dart';
import 'package:turismo_flutter/views/user/enterprice.dart';
import 'package:turismo_flutter/views/user/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  var isCloseSession = false;
  int position = 3;

  getValidaciones() async {
    var isValidToken = await JwtManage.validToken();
    int position = 3;
    if (isValidToken.toString() == 'true') {
      var rol = await CheckRol.validRol();
      switch (rol.toString()) {
        case '1':
          position = 0;
        case '2':
          position = 1;
        case '3':
          position = 2;
        default:
          position = 3;
      }
    }
    setState(() {
      this.position = position;
    });
  }

  @override
  void initState() {
    super.initState();
    getValidaciones();
  }

  final List<Widget> roleViews = [
    const Administrator(),
    const User(),
    const Enterprice(),
    const Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: position,
      children: roleViews,
    );
  }
}
