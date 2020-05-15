import 'package:flutter/material.dart';

class CoronaHelpScreen extends StatefulWidget {
  @override
  _CoronaHelpScreenState createState() => _CoronaHelpScreenState();
}

class _CoronaHelpScreenState extends State<CoronaHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40.0,
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Text("প্রইয়োজনীয় নাম্বার সমূহ",textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ),
            ],
          ),

          BoldText("সর্দি-কাশি ও জ্বরে চিকিৎসকের পরামর্শ"),
          Row(
            children: <Widget>[
              SubText("আইইডিসিআর: "),
              PhoneText("10655"),
              Text(" & "),
              PhoneText("01944333222")
            ],
          ),
          Row(
            children: <Widget>[
              SubText("স্বাস্থ্য বাতায়নের হটলাইন নম্বর: "),
              PhoneText("16263"),

            ],
          ),
          Row(
            children: <Widget>[
              SubText("স্বাস্থ্য অধিদপ্তরের  হটলাইন নম্বর: "),
              PhoneText("333"),

            ],
          ),

          Row(
            children: <Widget>[
              BoldText("স্বাস্থ্য অধিদপ্তরের  হটলাইন নম্বর: "),
              PhoneText("01769045739"),
            ],
          ),
          BoldText("মিথ্যা বা গুজব প্রচারের বিষয়টি নজরে এলে: "),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              PhoneText("999"),
              Text(" , "),
              PhoneText("9512264"),
              Text(" এবং "),
              PhoneText("9514988"),
            ],
          ),

          BoldText("দাফন কার্যক্রমে সহায়তা পেতে: "),
          SubText("স্বাস্থ্য মন্ত্রণালয়ের দুই যুগ্ম সচিবের নাম্বার: "),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              PhoneText("01712080983"),Text(" ও "),
              PhoneText("01552204208"),

            ],
          ),
          BoldText("মুঠোফোনে দন্ত রোগের চিকিৎসা: "),
          SubText("মুখ ও দাঁতের চিকিৎসা পেতে বাংলাদেশ ডেন্টাল সোসাইটির সদস্যদের মুঠোফোনে যোগাযোগ করে চিকিৎসা নেওয়া যাবে:"),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[

              SizedBox(
                width: 10.0,
              ),
              Text("নম্বর: "),PhoneText("01711136362"),Text(" , "),PhoneText("01741490134"),Text(" , "),PhoneText("01711540045"),


            ],
          ),
          Row(
            children: <Widget>[

              SizedBox(
                width: 10.0,
              ),
              PhoneText("01711937590"),Text(" , "),PhoneText("01711800049"),Text(" , "),PhoneText("01712486548"),


            ],
          ),
          BoldText("জরুরি ত্রাণ পেতে: "),
          Row(
            children: <Widget>[
              SubText("ঢাকা জেলা প্রশাসনের হটলাইন: "),
              PhoneText("0247110891"),
            ],
          ),


          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              PhoneText("01987852008"),
            ],
          ),

          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              SubText("ঢাকা দক্ষিণ সিটি করপোরেশন: "),
              PhoneText("01709900703"),
            ],
          ),

          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              PhoneText("01709900704"),
            ],
          ),
          BoldText("ঢাকা উত্তর সিটি করপোরেশনের পরামর্শ সেবা: "),
          SubText("পাঁচটি অঞ্চলে করোনাভাইরাস–সংক্রান্ত চিকিৎসা তথ্য ও পরামর্শ সেবা চালু: "),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[

              SubText("মগবাজার: "),PhoneText("9355277"),SubText("মোহাম্মদপুর: "),PhoneText("01311946432"),
            ],
          ),
          Row(
            children: <Widget>[

              SubText("মাজার রোড: "),PhoneText("0130159683"),SubText("বর্ধিত পল্লবী: "),PhoneText("01770722194"),
            ],
          ),
          Row(
            children: <Widget>[

              SubText("উত্তরা: "),PhoneText("01314766545"),
            ],
          ),
        ],
      )),
    );
  }
}



class PhoneText extends StatelessWidget {

  final String phnNumber;

  PhoneText(this.phnNumber);

  @override
  Widget build(BuildContext context) {
    return Text(phnNumber,style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 15.0),);
  }
}

class SubText extends StatelessWidget {

  final String title;

  SubText(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(title),
    );
  }
}

class BoldText extends StatelessWidget {

  final String title;

  BoldText(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(title,style: TextStyle(
        fontWeight: FontWeight.bold,fontSize: 16.0
      ),),
    );
  }
}
