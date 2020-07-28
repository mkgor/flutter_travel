import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:travel/constants.dart';
import 'package:travel/stars.dart';

class CountryPage extends StatelessWidget {
  Map country;

  CountryPage(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.black]),
              image: DecorationImage(
                  image: AssetImage(country['image']),
                  colorFilter: new ColorFilter.mode(
                      Colors.white24.withOpacity(0.6), BlendMode.dstIn),
                  fit: BoxFit.cover)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 28),
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {Navigator.pop(context);},
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white),
                  Spacer(),
                  CircleAvatar(backgroundColor: Colors.blue, child: Text('GM')),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                      color: Colors.white),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          text: 'Want to buy tickets \nto ',
                          children: [
                            TextSpan(
                                text: country['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: ' quick and easy?')
                          ],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18))),
                  SizedBox(height: 20),
                  MaterialButton(
                    color: TinyColor(country['color']).darken(20).color,
                    onPressed: () {},
                    child: Text('Click here to buy',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Welcome to',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Labrador A',
                          fontSize: 24)),
                  Text(country['name'],
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Labrador A',
                          fontSize: 72)),
                  Text(country['description'], style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.4,
                      fontSize: 16)),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: <Widget>[
                      Stars(rating: country['rating'], starsColor: Colors.white, size: 15),
                      Padding(
                        padding:
                        EdgeInsets.only(left: 10, top: 2),
                        child: Text(
                            country['rating'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: 10, top: 2),
                        child: Text(
                            '(${country['basedOn'].toString()})',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  Text(country['shortDescription'], style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                      fontSize: 14)),
                  SizedBox(height: 20)
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
