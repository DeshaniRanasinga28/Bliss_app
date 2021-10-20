import 'package:bliss/app/global/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common_widget.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  // String bag = "guitar";
  // String purse = "piano";

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: h < 770.0 ? 55.0 : 70.0,
      // color: Colors.green,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          smallCardImageView(
             context,
             h,
             pink159,
            'images/guitar.png',
            'Guitar',
            'guitar'
          ),
          smallCardImageView(
            context,
            h,
            yellow,
            'images/piano.png',
            'Piano',
             'piano'
          ),
          smallCardImageView(
            context,
            h,
            green,
            'images/drums.png',
            'Drums',
            'drums'
          ),
        ],
      ),
    );
  }
}


