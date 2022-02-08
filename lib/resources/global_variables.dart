import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


String APIKey = 'a53b1acb4e0a42bf99074855a9383557';

Color primaryColor = Colors.white;


final TextStyle titleTextStyle = GoogleFonts.getFont('Oswald', textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800));
final TextStyle header = GoogleFonts.getFont('Ubuntu Condensed', textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800));
final TextStyle postTitle = GoogleFonts.getFont('Roboto', textStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600));
final TextStyle postDescription = GoogleFonts.getFont('Roboto', textStyle: TextStyle(color: Colors.black.withOpacity(.5), fontSize: 15, fontWeight: FontWeight.w400));
final TextStyle author = GoogleFonts.getFont('Roboto', textStyle: TextStyle(color: Colors.white.withOpacity(.8), fontSize: 15, fontWeight: FontWeight.w600));
final TextStyle publisher = GoogleFonts.getFont('Roboto', textStyle: TextStyle(color: Colors.white.withOpacity(.8), fontSize: 13, fontWeight: FontWeight.w400));