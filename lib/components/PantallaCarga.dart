import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PantallaCarga extends StatelessWidget {
  final textoCarga;
  const PantallaCarga({super.key, this.textoCarga});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: BorderSide.strokeAlignCenter,
      top: BorderSide.strokeAlignCenter,
      left: BorderSide.strokeAlignCenter,
      right: BorderSide.strokeAlignCenter,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.9),
        ),
        child: Container(
          height: 170,
          width: 170,
          alignment: Alignment.center,
          child: Card(
            elevation: 15,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? const Color.fromRGBO(255, 55, 92, 1.0)
                            : Colors.deepPurpleAccent,
                      ),
                    );
                  },
                ),
                Text(textoCarga),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
