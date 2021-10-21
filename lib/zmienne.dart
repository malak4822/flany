import 'package:flutter/material.dart';

class ZmienneClass extends ChangeNotifier {
  var graczepoczatkowi = 0;
  var _gracze;
  var _rundy;
  var msdcntr2 = 0;
  var msdcntr1 = 0;
  List<int> czasy1 = [];
  List<int> czasy2 = [];

  int get iloscGraczy {
    return _gracze;
  }

  int? get plrsInEachTeam {
    return graczepoczatkowi ~/ 2;
  }

  int? get missedcounter2 {
    return msdcntr2;
  }

  int? get missedcounter1 {
    return msdcntr1;
  }

  int get iloscRund {
    return _rundy;
  }

  void liczenienietrafien1() {
    msdcntr1++;
  }

  void liczenienietrafien2() {
    msdcntr2++;
  }

  void dodajczas1(czas1) {
    czasy1.add(czas1);
  }

  int get sumaczasu1 {
    int suma1 = 0;
    for (int czas1 in czasy1) {
      suma1 += czas1;
    }
    return suma1;
  }

  void dodajczas2(czas2) {
    czasy2.add(czas2);
  }

  int get sumaczasu2 {
    int suma2 = 0;
    for (int czas2 in czasy2) {
      suma2 += czas2;
    }
    return suma2;
  }

  void setPlayerCount({required int liczbagraczy}) {
    _gracze = liczbagraczy;
    graczepoczatkowi = liczbagraczy;
  }

  void setRoundCount({required int liczbarund}) {
    _rundy = liczbarund;
  }
}
