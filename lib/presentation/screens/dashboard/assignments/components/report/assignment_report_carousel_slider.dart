import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../infrastructure/Providers/AssetsPathProvider.dart';

class AssignmentReportCarouselSlider extends StatelessWidget {
  const AssignmentReportCarouselSlider({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200, viewportFraction: 0.5, enlargeCenterPage: true),
      items: images
          .map(
            (i) => Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: Image(
                    fit: BoxFit.contain,
                    width: double.infinity,
                    image: AssetImage(AssetsPathProvider().getHome(i)),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
