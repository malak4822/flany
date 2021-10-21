import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List imageList = [
  "images/flany1.png",
  "images/flany1.png",
  "images/flany1.png"
];
int activeIndex = 0;

class Rules2 extends StatefulWidget {
  const Rules2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Rules2> createState() => _MyRules2PageState();
}

class _MyRules2PageState extends State<Rules2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 84, 84, 84),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.0,
        backgroundColor: Colors.amber,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("IMAGE",
              style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                      fontSize: 50.0, color: Color.fromARGB(255, 84, 84, 84)))),
          Text(
            "In Rules",
            style: GoogleFonts.overpass(
                textStyle:
                    const TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
        ]),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 20.0),
              CarouselSlider(
                options: CarouselOptions(
                  height: 600.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                items: imageList
                    .map((e) => ClipRRect(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Transform.rotate(
                                angle: pi / 360,
                                child: Image.asset(
                                  e,
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
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
