import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  double rating = 0;
  Color starsColor = Colors.orangeAccent;
  double size = 15;

  Stars({this.rating, this.starsColor, this.size});

  @override
  Widget build(BuildContext context) {
    int ratingRounded = rating.round();

    return Container(
        child: Row(
      children: List.generate(5, (index) {
        IconData icon;

        if(index < ratingRounded) {
          icon = Icons.star;
        } else {
          icon = Icons.star_border;
        }

        return Icon(icon, color: this.starsColor, size: this.size,);
      }),
    ));
  }
}
