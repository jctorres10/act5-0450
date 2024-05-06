import 'dart:math';

import 'package:flutter/material.dart';

class TransformPageView extends StatefulWidget {
  const TransformPageView({Key? key}) : super(key: key);

  @override
  State<TransformPageView> createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  final _control = PageController(viewportFraction: 0.6);

  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _control.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _control.addListener(_listener);
  }

  @override
  void dispose() {
    _control.removeListener(_listener);
    _control.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<String> images = [
      "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/Bewitched.jpg",
      "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/RandomAccessMemories.jpeg",
      "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/flowerboy.jpg",
      "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/mbdtf.jpg",
      "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/roy.jpg"
    ];
    return Center(
      child: SizedBox(
        height: 450.0,
        child: PageView.builder(
          controller: _control,
          itemCount: images.length,
          itemBuilder: (_, i) {
            if (i == _currentPage) {
              return Transform.scale(
                scale: 1.3,
                child: _pageImages(images[i]),
              );
            } else if (i < _currentPage) {
              return Transform.scale(
                scale: max(1.3 - (_currentPage - i), 0.8),
                child: _pageImages(images[i]),
              );
            } else {
              return Transform.scale(
                scale: max(1.3 - (i - _currentPage), 0.8),
                child: _pageImages(images[i]),
              );
            }
          },
        ),
      ),
    );
  }

  _pageImages(String images) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff0b1104),
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
              image: NetworkImage(images), fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
