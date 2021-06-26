import 'package:corona_tracker/network.dart';
import 'package:corona_tracker/ui/after_splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getCountryData() async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://disease.sh/v2/countries/bangladesh?yesterday=false&strict=true');

    NetworkHelper networkHelperGlobal = NetworkHelper(
        url:
        'https://disease.sh/v2/all');


    var countryData = await networkHelper.getData();
    var globalData = await networkHelperGlobal.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AfterSplash(
        country: countryData,
        global: globalData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      loadingText: Text(
        "Corona Tracker BD",
        style: GoogleFonts.lato(fontSize: 30.0, fontWeight: FontWeight.w500),
      ),
      image: Image.asset(
        "images/bacteria.png",
        scale: 1.5,
      ),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 70.0,
      loaderColor: Colors.deepPurple,
    );
  }
}
