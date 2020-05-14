import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .35,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/cov_back.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Covid-19 Tracker",
                      style: GoogleFonts.ubuntu(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Bangladesh",
                        style: GoogleFonts.ubuntu(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Last Update 1 hour ago",
                      style: GoogleFonts.ubuntu(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 0.1,
                              offset: Offset(2, 2))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Grid(
                          title: "Confirmed",
                          no: "5000",
                          color: 0xff2AA847,
                          icon: Icons.arrow_upward,
                          today: "25",
                        ),
                        Grid(
                          title: "Recovered",
                          no: "1200",
                          color: 0xff077eff,
                          icon: Icons.arrow_upward,
                          today: "120",
                        ),
                        Grid(
                          title: "Death",
                          no: "290",
                          color: 0xffFe083b,
                          icon: Icons.arrow_downward,
                          today: "19",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Global Outbreak",
                    style: GoogleFonts.ubuntu(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 0.1,
                              offset: Offset(2, 2))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Grid(
                          title: "Confirmed",
                          no: "5000",
                          color: 0xff2AA847,
                          icon: Icons.arrow_upward,
                          today: "25",
                        ),
                        Grid(
                          title: "Recovered",
                          no: "1200",
                          color: 0xff077eff,
                          icon: Icons.arrow_upward,
                          today: "120",
                        ),
                        Grid(
                          title: "Death",
                          no: "290",
                          color: 0xffFe083b,
                          icon: Icons.arrow_downward,
                          today: "19",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Grid extends StatelessWidget {
  final String title;
  final String no;
  final int color;
  final IconData icon;
  final String today;

  Grid({this.title, this.no, this.color, this.icon, this.today});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style:
                GoogleFonts.ubuntu(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            no,
            style: GoogleFonts.ubuntu(fontSize: 35.0, color: Color(color)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 15.0,
                color: Color(color),
              ),
              Text(
                today,
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, color: Color(color)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
