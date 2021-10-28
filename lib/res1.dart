import 'package:flany/zmienne.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class resoneGamePage extends StatefulWidget {
  final firTime;
  final secTime;
  final missed;
  final missed1;
  const resoneGamePage(
      {Key? key, this.firTime, this.secTime, this.missed, this.missed1})
      : super(key: key);
  @override
  _resoneGamePageState createState() => _resoneGamePageState();
}

class _resoneGamePageState extends State<resoneGamePage> {
  final _scrollController = ScrollController();

  _resoneGamePageState();

  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
    _scrollController;
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  @override
  Widget build(BuildContext context) {
    var _gracze = Provider.of<ZmienneClass>(context).plrsInEachTeam;
    var msdcntr1 = Provider.of<ZmienneClass>(context).missedcounter1;
    var suma1 = Provider.of<ZmienneClass>(context).sumaczasu1;

    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ZmienneClass()),
        ],
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 84, 84, 84),
            body: Stack(alignment: Alignment.bottomCenter, children: [
              Column(children: [
                SizedBox(height: 50.0),
                Text(
                  "Czas drużyny:",
                  style:
                      GoogleFonts.overpass(fontSize: 40.0, color: Colors.white),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${suma1 / 1000}",
                          style: GoogleFonts.overpass(
                              fontSize: 50.0, color: Colors.white),
                        ),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 8, 236, 124),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ]),
                SizedBox(height: 60.0),
                Text(
                  "Nietrafienia drużyny:",
                  style:
                      GoogleFonts.overpass(fontSize: 38.0, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "$msdcntr1",
                        style: GoogleFonts.overpass(
                            fontSize: 50.0, color: Colors.white),
                      ),
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 236, 124),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ]),
              Text(
                "W drużynie jest po $_gracze graczy",
                style:
                    GoogleFonts.overpass(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 30.0)
            ])));
  }
}
