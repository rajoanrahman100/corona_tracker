import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../datasorce.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('FAQs',style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w500,
          color: Colors.red
        ),),
        iconTheme: IconThemeData(color: Colors.red),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.questionAnswers[index]['question'],
                style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(DataSource.questionAnswers[index]['answer'],style: GoogleFonts.roboto()),
                )
              ],
            );
          }),
    );
  }
}
