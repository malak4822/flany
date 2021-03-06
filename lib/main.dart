import 'package:flany/informations.dart';
import 'package:flany/rules.dart';
import 'package:flany/zmienne.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ZmienneClass()),
      ],
      child: const MaterialApp(
        home: MyHomePage(title: "Flunny"),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 84, 84, 84),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("FLANKI",
              style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                      fontSize: 50.0, color: Color.fromARGB(255, 84, 84, 84)))),
          Text(
            "The Game",
            style: GoogleFonts.overpass(
                textStyle:
                    const TextStyle(fontSize: 20.0, color: Colors.black45)),
          ),
        ]),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.fastOutSlowIn);

                          return ScaleTransition(
                            scale: animation,
                            child: child,
                            alignment: Alignment.topCenter,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 100),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return const InfoPage();
                        }));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white10,
                side: const BorderSide(width: 2, color: Colors.white),
                padding: const EdgeInsets.all(80),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
              ),
              child: SizedBox(
                  width: 160.0,
                  height: 160.0,
                  child: Column(
                    children: [
                      const RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.not_started_rounded,
                            size: 140.0,
                          )),
                      Text("Start", style: GoogleFonts.aBeeZee(fontSize: 16.0))
                    ],
                  ))),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                splashColor: Colors.black,
                iconSize: 50.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation,
                              Widget child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.fastOutSlowIn);

                            return ScaleTransition(
                              scale: animation,
                              child: child,
                              alignment: Alignment.bottomCenter,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation) {
                            return const Rules(title: 'Zasady');
                          }));
                },
                icon: const Icon(Icons.rule),
                highlightColor: Colors.black45,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
