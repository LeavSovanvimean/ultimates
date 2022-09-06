// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<Widget> _demo = [
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014063480778801152/Watch_1.jpg',
      fit: BoxFit.fill,
    ),
  ),
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014046026337898547/Poster1.png',
      fit: BoxFit.fill,
    ),
  ),
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014065433004998656/Watch_2.jpg',
      fit: BoxFit.fill,
    ),
  ),
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014066425314426971/Watch_3.jpg',
      fit: BoxFit.fill,
    ),
  ),
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014070196283129907/Watch_4.jpg',
      fit: BoxFit.fill,
    ),
  ),
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014071355077038121/Watch_5.jpg',
      fit: BoxFit.fill,
    ),
  ),
  SizedBox(
    height: 300,
    child: Image.network(
      'https://cdn.discordapp.com/attachments/976887812009906186/1014074189633826836/Watch_6.jpg',
      fit: BoxFit.fill,
    ),
  ),
];

class PromotionSlider extends StatefulWidget {
  const PromotionSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PromotionSliderState();
  }
}

class _PromotionSliderState extends State<PromotionSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _demo,
          carouselController: _controller,
          options: CarouselOptions(
              height: 250,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _demo.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 30.0,
                height: 3.0,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    //borderRadius: BorderRadius.circular(20),
                    color: (Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.1)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
