import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingBar(
      {this.starCount = 5, this.rating = 0.0, this.color = Colors.black87});

  ///create star
  Widget buildStar(BuildContext context, int index) {
    IconData icName = Icons.star;
    Color icColor = color;

    if (index >= rating) {
      icName = Icons.star_border;
      icColor = color.withOpacity(0.6);
    } else if (index > rating - 1 && index < rating) {
      icName = Icons.star_half;
    }

    return Icon(icName, size: 16.0, color: icColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (i) => buildStar(context, i)),
    );
  }
}
