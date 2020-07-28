import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:travel/countries.dart';
import 'package:travel/constants.dart';
import 'package:travel/screens/country_page.dart';
import 'package:travel/stars.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentSlideIndex;

  @override
  void initState() {
    super.initState();

    _currentSlideIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back)),
          Spacer(),
          CircleAvatar(backgroundColor: Colors.blue, child: Text('GM')),
          Spacer(),
          IconButton(icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 10, left: defaultPadding, right: defaultPadding),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Discover',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: ' new adventures',
                    style: TextStyle(fontSize: 24, color: Colors.black87))
              ])),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                'More than 50 countries',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                  height: screenSize.height * 0.74,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  autoPlay: false,
                  aspectRatio: 1,
                  viewportFraction: .75,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlideIndex = index;
                    });
                  }),
              items: List.generate(countries.length, (int index) {
                Map country = countries[index];

                return AnimatedOpacity(
                    opacity: _currentSlideIndex == index ? 1 : .3,
                    duration: Duration(milliseconds: 300),
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 25),
                        width: double.infinity,
                        height: screenSize.height * 0.6,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.black54,
                                  Colors.blueGrey
                                ]),
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage(country['image']),
                                colorFilter: new ColorFilter.mode(
                                    Colors.white.withOpacity(0.4),
                                    BlendMode.dstATop),
                                fit: BoxFit.cover)),
                        child: Column(children: [
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Container(
                                height: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Stars(rating: country['rating'], starsColor: Colors.orangeAccent,),
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
                                    Text(country['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Labrador A',
                                            fontSize: 48)),

                                    Text(country['shortDescription'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Labrador A',
                                            fontSize: 16)),
                                    SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, PageRouteTransition(
                                            animationType: AnimationType.fade,
                                            builder: (context) => CountryPage(country)));
                                      },
                                      child: Text('Read more', style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Labrador A',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16)),
                                    )
                                  ],
                                )),
                          )
                        ])));
              }),
            )
          ],
        ),
      ),
    );
  }
}
