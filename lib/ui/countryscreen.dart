import 'package:flutter/material.dart';

const textField = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    suffixIcon: Icon(Icons.location_on),
    hintText: "Enter Country Name",
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ));

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.red,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: textField,
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            ButtonTheme(
              height: 50,
              minWidth: 180.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.red,
                padding: EdgeInsets.all(0),
                child: Text(
                  "Get Country Name",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
