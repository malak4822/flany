import 'package:flany/game2.dart';
import 'package:flany/zmienne.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class resGamePage extends StatefulWidget {
  final firTime;
  final secTime;
  final missed;
  final missed1;
  const resGamePage(
      {Key? key, this.firTime, this.secTime, this.missed, this.missed1})
      : super(key: key);
  @override
  _resGamePageState createState() => _resGamePageState();
}

class _resGamePageState extends State<resGamePage> {
  final _scrollController = ScrollController();

  _resGamePageState();

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
    var msdcntr2 = Provider.of<ZmienneClass>(context).missedcounter2;
    var suma1 = Provider.of<ZmienneClass>(context).sumaczasu1;
    var suma2 = Provider.of<ZmienneClass>(context).sumaczasu2;

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
                  "Czasy drużyn:",
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
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${suma2 / 1000}",
                          style: GoogleFonts.overpass(
                              fontSize: 50.0, color: Colors.white),
                        ),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 8, 240, 196),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ]),
                SizedBox(height: 60.0),
                Text(
                  "Nietrafienia drużyn:",
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
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "$msdcntr2",
                        style: GoogleFonts.overpass(
                            fontSize: 50.0, color: Colors.white),
                      ),
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 240, 196),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
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
                              return SecGamePage();
                            }));
                    Provider.of<ZmienneClass>(context, listen: false).dodRund();
                    print("es");
                  },
                  child: Text("End Round",
                      style: GoogleFonts.almarai(
                          fontSize: 20.0, color: Colors.white)),
                )
              ]),
              Text(
                "W drużynie jest po ${_gracze} graczy",
                style:
                    GoogleFonts.overpass(fontSize: 20.0, color: Colors.white),
              ),
            ])));
  }
}