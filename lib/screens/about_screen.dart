//import 'package:platform/platform.dart' as platform;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location:",
                style: GoogleFonts.jaldi(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange.shade800),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  //borderRadius: BorderRadius.circular(70),
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(15.5708246, 32.5712095),
                    zoom: 15,
                  ),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                ),
                margin: EdgeInsets.only(bottom: 10),
              ),
              Text(
                " About UDRA:",
                style: GoogleFonts.jaldi(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange.shade800),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '   Is an educational and knowledge refrence that provides trining programs on its platform URDA Hub. And aims to be a New Education Model. that Qualifies fully trained graduates with higher knowledge abilities.',
                overflow: TextOverflow.fade,
                softWrap: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.jaldi(
                    fontSize: 18, fontWeight: FontWeight.w200),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " Contact us:",
                style: GoogleFonts.jaldi(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange.shade800),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'udra.Institute@gmail.com\n(+249)912253663\n(+249)123020403\n(+249)1170333371 ',
                overflow: TextOverflow.fade,
                softWrap: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.jaldi(
                    fontSize: 20, fontWeight: FontWeight.w200),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await launch("tel://00249117033371");
        },
        child: Icon(Icons.call),
      ),
    );
  }
}
