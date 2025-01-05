import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innbucks/util/dimensiona.dart';

class ImageScrollTemplate extends StatefulWidget {
  final List<String> imageScrollList;
  final double height;
  final double? width;
  final bool isScrollIndicatorVisible;
  final bool isTimer;
  const ImageScrollTemplate(
      {super.key,
      required this.imageScrollList,
      required this.height,
      this.width,
      this.isScrollIndicatorVisible = true,
      this.isTimer = true});

  @override
  State<ImageScrollTemplate> createState() => _ImageScrollTemplateState();
}

class _ImageScrollTemplateState extends State<ImageScrollTemplate> {
  final PageController _pageViewController = PageController(initialPage: 0);
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _stopTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (widget.isTimer) {
        setState(() {
          _currentPage = (_currentPage + 1) % 3;
          _pageViewController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: PageView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              onPageChanged: (int index) {
                setState(() {});
              },
              itemCount: widget.imageScrollList.length,
              itemBuilder: (context, index) {
                return widget.imageScrollList.map((page) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall),
                    decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusSmall),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.imageScrollList[index],
                            ),
                            fit: BoxFit.fill)),
                  );
                }).toList()[index];
              },
            ),
          ),
        ),
        if (widget.isScrollIndicatorVisible)
          Container(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
              ],
            ),
          )
      ],
    );
  }
}
