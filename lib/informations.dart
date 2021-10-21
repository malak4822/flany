import 'package:flany/game1.dart';
import 'package:flany/main.dart';
import 'package:flany/zmienne.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, value}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

int liczbagraczy = 10;

class _InfoPageState extends State<InfoPage> {
  TextEditingController graczeCon = TextEditingController();
  TextEditingController rundyCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: ZmienneClass())],
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 84, 84, 84),
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              backgroundColor: Colors.amber,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Info",
                    style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                            fontSize: 50.0,
                            color: Color.fromARGB(255, 84, 84, 84))),
                  ),
                  Text(
                    "Gathering",
                    style: GoogleFonts.overpass(
                        textStyle: const TextStyle(
                            fontSize: 20.0, color: Colors.white)),
                  )
                ],
              ),
            ),
            body: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 250.0,
                      child: TextFormField(
                        onChanged: (gracze) {},
                        controller: graczeCon,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp("3,5,7,9"))
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Liczba graczy",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20.0),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80.0),
                  Center(
                    child: SizedBox(
                      width: 250.0,
                      child: TextFormField(
                        controller: rundyCon,
                        onChanged: (rundy) {},
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Liczba Rund",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20.0),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                  child: Text("back",
                      style: GoogleFonts.oxygen(
                          textStyle: const TextStyle(color: Colors.white))),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Provider.of<ZmienneClass>(context, listen: false)
                        .setPlayerCount(
                            liczbagraczy: int.parse(graczeCon.text));

                    Provider.of<ZmienneClass>(context, listen: false)
                        .setRoundCount(liczbarund: int.parse(rundyCon.text));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirGamePage()));
                  },
                  child: Text("more",
                      style: GoogleFonts.oxygen(
                          textStyle: const TextStyle(color: Colors.white))),
                ),
              ),
            ])));
  }
}
