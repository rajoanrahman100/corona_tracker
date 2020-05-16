import 'package:corona_tracker/ui/countryscreen.dart';
import 'package:corona_tracker/ui/faqs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../network.dart';
import 'coronahelp.dart';

class AfterSplash extends StatefulWidget {
  final country;
  final global;

  AfterSplash({this.country, this.global});

  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  String countrydata;
  int cases;
  int recovered;
  int death;
  int todaycases;
  int todaydeath;
  int totaltests;
  int testPerMill;

  int globalcases;
  int globalrecovered;
  int globaldeath;
  int globaltodaycases;
  int globaltodaydeath;
  int globalTest;
  double globalTestPerMill;

  void updateUi(dynamic countryData) {
    countrydata = countryData['country'];
    cases = countryData['cases'];
    recovered = countryData['recovered'];
    death = countryData['deaths'];
    todaycases = countryData['todayCases'];
    todaydeath = countryData['todayDeaths'];
    totaltests = countryData['tests'];
    testPerMill=countryData['testsPerOneMillion'];
  }

  void updateUiCountry(dynamic countryData) {
    setState(() {
      countrydata = countryData['country'];
      cases = countryData['cases'];
      recovered = countryData['recovered'];
      death = countryData['deaths'];
      todaycases = countryData['todayCases'];
      todaydeath = countryData['todayDeaths'];
      totaltests = countryData['tests'];
      testPerMill=countryData['testsPerOneMillion'];
    });
  }

  void updateUiGlobal(dynamic countryData) {
    globalcases = countryData['cases'];
    globalrecovered = countryData['recovered'];
    globaldeath = countryData['deaths'];
    globaltodaycases = countryData['todayCases'];
    globaltodaydeath = countryData['todayDeaths'];
    globalTest=countryData['tests'];
    globalTestPerMill=countryData['testsPerOneMillion'];
  }

  void getCountryData(String countryName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://disease.sh/v2/countries/$countryName?yesterday=false&strict=true');

    var countryData = await networkHelper.getData();

    updateUiCountry(countryData);
  }

  @override
  void initState() {
    // TODO: implement initState

    updateUi(widget.country);
    updateUiGlobal(widget.global);
    updateUiCountry(widget.country);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = 150.0;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.question_answer,color: Colors.red,),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return FAQPage();
                }));
          },
        ),
        title: Text("Covid-19 Tracker",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w500,
          color: Colors.redAccent
        ),),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: GestureDetector(onTap:(){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return CoronaHelpScreen();
                  }));
            },child: Icon(Icons.help,color: Colors.redAccent,)),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: size.height * .35,
              width: double.infinity,
              /*decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/corona.jpg"),
                          fit: BoxFit.cover))*/
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Select a country",
                      style: GoogleFonts.ubuntu(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var typesCountry = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CountryScreen();
                          }));

                          getCountryData(typesCountry);
                        },
                        child: Text(
                          '$countrydata',
                          style: GoogleFonts.ubuntu(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
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
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                        GridBD(
                          title: "Confirmed",
                          no: '$cases',
                          color: 0xff2AA847,
                          icon: Icons.arrow_upward,
                          today: '$todaycases',
                        ),
                        GridBD(
                          title: "Recovered",
                          no: '$recovered',
                          color: 0xff077eff,
                          icon: Icons.arrow_upward,
                          today: "",
                        ),
                        GridBD(
                          title: "Death",
                          no: '$death',
                          color: 0xffFe083b,
                          icon: Icons.arrow_downward,
                          today: '$todaydeath',
                        ),
                        GridBD(
                          title: "TotalTests",
                          no: '$totaltests',
                          color: 0xff077eff,
                          icon: Icons.arrow_forward,
                          today: '$testPerMill',
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Global Outbreak",
                style: GoogleFonts.ubuntu(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
             height: 110,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                    no: '$globalcases',
                    color: 0xff2AA847,
                    icon: Icons.arrow_upward,
                    today: '$globaltodaycases',
                  ),
                  Grid(
                    title: "Recovered",
                    no: '$globalrecovered',
                    color: 0xff077eff,
                    icon: Icons.arrow_upward,
                    today: "",
                  ),
                  Grid(
                    title: "Death",
                    no: '$globaldeath',
                    color: 0xffFe083b,
                    icon: Icons.arrow_downward,
                    today: '$globaltodaydeath',
                  ),
                  Grid(
                    title: "TotalTests",
                    no: '$globalTest',
                    color: 0xff077eff,
                    icon: Icons.arrow_forward,
                    today: '$globalTestPerMill',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 10.0),
              child: Text(
                "Symptoms",
                style: GoogleFonts.ubuntu(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 200.0,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: itemWidth / itemHeight,
                children: <Widget>[
                  Symptoms(title: "Hard cough",image: "images/hardcough.png",),
                  Symptoms(title: "Fever",image: "images/fever.png",),
                  Symptoms(title: "Soar throat",image: "images/soarthroat.png",),
                  Symptoms(title: "Musscle Pain",image: "images/mussclepain.png",),
                  Symptoms(title: "Short Breath",image: "images/shortbreath.png",),
                  Symptoms(title: "loss of taste or smell",image: "images/nosmell.png",),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 10.0),
              child: Text(
                "Prevention",
                style: GoogleFonts.ubuntu(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),

            Container(
              height: 220.0,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: itemWidth / itemHeight,
                children: <Widget>[
                  Prevention(title: "Cover your cough",image: "images/cough.png",),
                  Prevention(title: "Wear a mask",image: "images/mask.png",),
                  Prevention(title: "Keep safe distance",image: "images/distance.png",),
                  Prevention(title: "Wash your hands",image: "images/hands.png",),
                  Prevention(title: "Use hand wash",image: "images/spray.png",),
                  Prevention(title: "Stay home",image: "images/home.png",)
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}

class Prevention extends StatelessWidget {
  final String title;
  final String image;

  Prevention({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Text(
            title,
            style:
                GoogleFonts.ubuntu(fontSize: 12.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}


class Symptoms extends StatelessWidget {
  final String title;
  final String image;

  Symptoms({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(image,height: 50.0,width: 50.0,),
          SizedBox(
            height: 4.0,
          ),
          Text(
            title,
            style:
            GoogleFonts.ubuntu(fontSize: 12.0, fontWeight: FontWeight.w500),
          )
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
  final String totalTests;


  Grid({this.title, this.no, this.color, this.icon, this.today,this.totalTests});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            title,
            style:
                GoogleFonts.ubuntu(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            no,
            style: GoogleFonts.ubuntu(fontSize: 15.0, color: Color(color)),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
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
          height: 10.0,
        ),
      ],
    );
  }
}

class GridBD extends StatelessWidget {
  final String title;
  final String no;
  final int color;
  final IconData icon;
  final String today;
  final String totaltests;


  GridBD({this.title, this.no, this.color, this.icon, this.today,this.totaltests});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style:
            GoogleFonts.ubuntu(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            no,
            style: GoogleFonts.ubuntu(fontSize: 18.0, color: Color(color)),
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
          height: 10.0,
        ),
      ],
    );
  }
}
