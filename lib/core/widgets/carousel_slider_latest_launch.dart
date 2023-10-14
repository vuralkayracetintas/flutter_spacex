import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';

class CarouselSliderLatestLaunch extends StatelessWidget {
  const CarouselSliderLatestLaunch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.9,
          aspectRatio: 10.0,
          initialPage: 2,
          height: 300),
      items: ImageConstans().imageList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        i,
                        fit: BoxFit.cover,
                        width: 1000.0,
                        height: 300,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}
