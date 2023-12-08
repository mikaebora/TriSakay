import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trisakay_app/Welcoming_Page/intropage1.dart';
import 'package:trisakay_app/Welcoming_Page/intropage2.dart';
import 'package:trisakay_app/Welcoming_Page/intropage3.dart';
import 'package:trisakay_app/Welcoming_Page/intropage4.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // tracking page
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: _controller,
            children: [
              intropage1(),
              intropage2(),
              intropage3(),
              IntroPage4(),
            ],
          ),
          // dot indicators
          Container(
            alignment: const Alignment(0 , 0.90),
            child: SmoothPageIndicator(controller: _controller, count: 4,
            effect: const ExpandingDotsEffect(
              activeDotColor:Colors.black,
              dotColor: Colors.grey,
              dotHeight: 15,
              dotWidth: 15,
              spacing: 5,
              ),
            ),
          ),
        ],
      )
    );
  }
}