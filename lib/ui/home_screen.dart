import 'package:corona_tracker/ui/after_splash.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: AfterSplash(),
      loadingText: Text("Corona Tracker BD",style: GoogleFonts.lato(
        fontSize: 30.0,
        fontWeight: FontWeight.w500
      ),),
      image: Image.asset("images/bacteria.png",scale: 1.5,),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 70.0,
      loaderColor: Colors.deepPurple,
    );
  }
}
