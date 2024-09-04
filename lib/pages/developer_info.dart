import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DeveloperInfoScreen extends StatelessWidget {
  final String githubUrl = 'https://github.com/Yasir390';
  final String portfolioUrl = 'https://sites.google.com/view/yasirportfolio/home?authuser=0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yasir Arafat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'mail: yasirarafat6959@gmail.com',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'phone: 01876756959',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }


}