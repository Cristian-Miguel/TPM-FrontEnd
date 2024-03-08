import 'package:flutter/material.dart';

class ChooseAuth extends StatefulWidget {
  const ChooseAuth({super.key});

  @override
  State<ChooseAuth> createState() => _ChooseAuthState();
}

class _ChooseAuthState extends State<ChooseAuth> {
  _chooseAuthOption() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 5),
                child: Text(
                  'Discovery Mich',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 5),
                child: TextButton(
                  onPressed: _chooseAuthOption,
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
                margin: const EdgeInsets.only(top: 100, bottom: 5),
                child: TextButton(
                  onPressed: _chooseAuthOption,
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
                  child: const Text('Sign up with email'),
                ),
              ),
            ],
          ),
          Row(),
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 5),
            child: TextButton(
              onPressed: _chooseAuthOption,
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
              child: const Text('Sign up with email'),
            ),
          ),
        ],
      ),
    );
  }
}
