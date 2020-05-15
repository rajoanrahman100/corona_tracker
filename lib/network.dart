import 'dart:convert';

import 'package:http/http.dart';
import 'package:convert/convert.dart';


class NetworkHelper{
  final String url;

  NetworkHelper({this.url});


  Future getData()async{
    Response response=await get(url);

    if(response.statusCode==200){
      String data=response.body;
      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }
  }

}


 /*Stack(
        children: <Widget>[
          Container(
            height: size.height * .35,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/corona.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed:()async{
                          var typesCountry=await Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return CountryScreen();
                          }));

                          getCountryData(typesCountry);
                        },
                        child: Text(
                          '$countrydata',
                          style: GoogleFonts.ubuntu(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
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
                    height: 10.0,
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
                          no: '$cases',
                          color: 0xff2AA847,
                          icon: Icons.arrow_upward,
                          today: '$todaycases',
                        ),
                        Grid(
                          title: "Recovered",
                          no: '$recovered',
                          color: 0xff077eff,
                          icon: Icons.arrow_upward,
                          today: "",
                        ),
                        Grid(
                          title: "Death",
                          no: '$death',
                          color: 0xffFe083b,
                          icon: Icons.arrow_downward,
                          today: '$todaydeath',
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Prevention",
                      style: GoogleFonts.ubuntu(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),*/