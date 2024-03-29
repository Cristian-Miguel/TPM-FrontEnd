import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadScreen extends StatelessWidget {
  final String loadText;
  const LoadScreen({Key? key, required this.loadText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200, // Set a fixed height
        width: 200, // Set a fixed width
        child: Card(
          elevation: 15,
          child: Column(
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
              // const SizedBox(height: 10),
              Text(loadText),
            ],
          ),
        ),
      ),
    );

    // Positioned(
    //   bottom: BorderSide.strokeAlignCenter,
    //   top: BorderSide.strokeAlignCenter,
    //   left: BorderSide.strokeAlignCenter,
    //   right: BorderSide.strokeAlignCenter,
    //   child: Container(
    //     alignment: Alignment.center,
    //     decoration: const BoxDecoration(
    //       color: Color.fromRGBO(255, 255, 255, 0.9),
    //     ),
    //     child: Container(
    //       height: 170,
    //       width: 170,
    //       alignment: Alignment.center,
    //       child: Card(
    //         elevation: 15,
    //         color: Colors.white,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             SpinKitFadingCircle(
    //               itemBuilder: (BuildContext context, int index) {
    //                 return DecoratedBox(
    //                   position: DecorationPosition.foreground,
    //                   decoration: BoxDecoration(
    //                     color: index.isEven
    //                         ? const Color.fromRGBO(255, 55, 92, 1.0)
    //                         : Colors.deepPurpleAccent,
    //                   ),
    //                 );
    //               },
    //             ),
    //             Text(loadText),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
