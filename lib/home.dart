import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FLUTTERX',
          style:
              GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
