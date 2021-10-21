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
  const MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 84, 84, 84),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.amber,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("FLANKI",
              style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                      fontSize: 50.0, color: Color.fromARGB(255, 84, 84, 84)))),
          Text(
            "The Game",
            style: GoogleFonts.overpass(
                textStyle:
                    const TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
        ]),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              side: const BorderSide(width: 1, color: Colors.white),
              padding: const EdgeInsets.fromLTRB(100, 110, 100, 110),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            child: Text(
              "Start",
              style: GoogleFonts.overpass(
                  textStyle: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.black)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
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
                child: Text("rules",
                    style: GoogleFonts.oxygen(
                        textStyle: const TextStyle(color: Colors.white)))),
          ),
        ],
      ),
    );
  }
}
