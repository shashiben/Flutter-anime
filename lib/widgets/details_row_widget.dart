import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsRow extends StatelessWidget {
  final String heading;
  final String details;

  const DetailsRow({Key key, @required this.heading, @required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String yolo=details.replaceAll(",", "\n");
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            heading.toString(),
            style: GoogleFonts.quicksand(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          details.contains(",")?Text(yolo.toString(),
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.white.withOpacity(0.6))):Text(
            details.toString(),
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.white.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}
