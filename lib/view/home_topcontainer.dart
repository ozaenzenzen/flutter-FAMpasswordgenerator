import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key key,
    @required this.consWidth,
    @required this.consHeight,
    @required this.constAppBarColor,
  }) : super(key: key);

  final double consWidth;
  final double consHeight;
  final MaterialColor constAppBarColor;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: consWidth,
      height: consHeight * 0.3,
      decoration: new BoxDecoration(
          color: constAppBarColor,
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
          boxShadow: [
            new BoxShadow(
                offset: Offset(2, 2),
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black54),
          ]),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: new Text(
              "FAM Password \nGenerator",
              style: new TextStyle(
                color: Colors.white,
                fontSize: consHeight * 0.055,
                fontFamily: "SF Text",
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: new Text(
              "Make your own password with password generator",
              style: new TextStyle(
                color: Colors.white,
                fontSize: consHeight * 0.020,
                fontFamily: "SF Text",
                // fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
