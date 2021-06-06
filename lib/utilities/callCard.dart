import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:url_launcher/url_launcher.dart';

class CallCard extends StatelessWidget {
  CallCard({@required this.image, @required this.phNo, @required this.title});
  String image, phNo, title;

  Future<void> _makeCall(String phCode) async {
    if (await launch(phCode)) {
      await launch(phCode);
    } else {
      throw "could not make the call";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Palette.kSecondaryColor,
              blurRadius: 30,
              spreadRadius: 2,
              offset: Offset(0, 19),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              stops: [0.2, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Palette.kPrimaryColor, Colors.grey[600]])),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              child: IconButton(
                  onPressed: () {
                    _makeCall('tel:$phNo');
                  },
                  icon: Icon(Icons.call, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
