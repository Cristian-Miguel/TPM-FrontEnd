import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/check_response_status.dart';
import 'package:turismo_flutter/config/constants/error_message.dart';
import 'package:turismo_flutter/config/google_auth.dart';
import 'package:turismo_flutter/controllers/auth/google_auth_controller.dart';
import 'package:turismo_flutter/components/others/load_screen.dart';
import 'package:turismo_flutter/views/user/login.dart';
import 'package:turismo_flutter/views/user/sign_up.dart';

class ChooseAuth extends StatefulWidget {
  const ChooseAuth({super.key});

  @override
  State<ChooseAuth> createState() => _ChooseAuthState();
}

class _ChooseAuthState extends State<ChooseAuth> {
  bool isCharging = false;

  Future<void> _singUpGoogle(context) async {
    final idToken = await GoogleAuthAPI.login();
    setState(() {
      isCharging = true;
    });
    var response = await GoogleAuthController.postGoogleAuthSignUp(idToken);
    CheckResponseStatus.checkResponse(
        context, response, ErrorMessage.authGoogleError);
    setState(() {
      isCharging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Discovery Mich",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 10,
        ),
        backgroundColor: Colors.white,
        body: Center(
          //SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Find your dream trip",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 5),
                    child: TextButton(
                      onPressed: () {
                        _singUpGoogle(context);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(310, 40);
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
                              : const Color.fromRGBO(255, 55, 92, 1.0);
                        }),
                      ),
                      child: const Text('Sign up with Google'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(310, 40);
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
                              : const Color.fromRGBO(255, 55, 92, 1.0);
                        }),
                      ),
                      child: const Text('Create account'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 20, right: 20),
                width: 310,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text("or")),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black87,
                        ),
                      ),
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const Size(310, 40);
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
                          : const Color.fromRGBO(255, 55, 92, 1.0);
                    }),
                  ),
                  child: const Text('Sign in'),
                ),
              ),
              Visibility(
                visible: isCharging,
                child: const LoadScreen(loadText: 'changing data'),
              ),
            ],
          ),
        ));
  }
}
