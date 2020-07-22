import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imagesToShow;

  ImageCarousel(this.imagesToShow);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      child: new Carousel(
        images: widget.imagesToShow.map((imagePath) => AssetImage(imagePath)).toList(),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 1),
      ),
    );
    return imageCarousel;
  }
}
