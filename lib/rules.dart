import 'package:flany/rules2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rules extends StatefulWidget {
  const Rules({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Rules> createState() => _MyRulesPageState();
}

class _MyRulesPageState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 84, 84, 84),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("RULES",
              style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                      fontSize: 50.0, color: Color.fromARGB(255, 84, 84, 84)))),
          Text(
            "Of The Game",
            style: GoogleFonts.overpass(
                textStyle:
                    const TextStyle(fontSize: 20.0, color: Colors.black45)),
          ),
        ]),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text("Piwo to moje paliwo \n~Friedrich Nietzsche",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.overpass(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Text(
                    "Ludzie od zalania dziejów pili piwo, lecz czasem nie mieli pretekstu aby zażyć tego enigmatycznego napoju, i wtedy właśnie powstały flanki. \n \n Gra polega na podzieleniu koneserów na 2 grupy, które stają naprzeciw siebie, w tej samej odjegłości od pustego piwa które stoi dumnie na środku. Na przemian po kolei degustatorzy z obydwu drużyn rzucają kamieniem w puszkę. \n\nGdy któryś z osobników trafi i przewróci puszkę jego drużyna ma zaszczyt zerowania piwa, lecz tylko dopóki któryś z osobników przeciwnej drużyny nie postawi puszki i nie wróci na swoje miejsce.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.overpass(
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 19.0))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Text("Drużyna która pierwsza wypije piwo wygrywa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.overpass(
                        textStyle: const TextStyle(
                            color: Colors.black, fontSize: 23.0))),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secAnimation,
                                    Widget child) {
                                  animation = CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.fastLinearToSlowEaseIn);

                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                    alignment: Alignment.center,
                                  );
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secAnimation) {
                                  return const Rules2(title: "zasady2");
                                }));
                      },
                      icon: const Icon(Icons.image,
                          color: Colors.white, size: 30)))),
          Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "back",
                    style: GoogleFonts.oxygen(
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                  )))
        ],
      ),
    );
  }
}
