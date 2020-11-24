import 'package:flutter/material.dart';
import 'package:onboarding/src/bottom_notch_clipper.dart';
import 'package:onboarding/src/onboarding_item.dart';
import 'package:onboarding/src/onboarding_model.dart';
import 'package:onboarding/src/page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  final items = [
    OnboardingModel(
      title: 'Manage your task',
      description: "Organize all your to do's and projects. "
          "Color them to set their priorities and categories",
      image: 'assets/images/onboarding-1.png',
    ),
    OnboardingModel(
      title: 'Work on time',
      description: "When you're overwhelmed by the amount of work you have "
          "on your plate, stop and rethink",
      image: 'assets/images/onboarding-2.png',
    ),
    OnboardingModel(
      title: 'Get your reminder on time',
      description: "When you encounter and small task that takes less than "
          "5 minutes to complete",
      image: 'assets/images/onboarding-3.png',
    ),
  ];

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _OnboardingBackground(),
          PageView.builder(
            onPageChanged: onPageChanged,
            itemCount: items.length,
            itemBuilder: (context, index) => OnboardingItem(
              items[index],
              index: index,
              isLast: index == items.length - 1,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.703,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.fast_forward_outlined,
                size: 40,
                color: Colors.white.withOpacity(0.85),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 24,
            right: 24,
            child: PageIndicator(currentIndex, itemCount: items.length),
          ),
        ],
      ),
    );
  }
}

class _OnboardingBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.indigoAccent,
      child: Column(
        children: [
          ClipPath(
            clipper: BottomNotchClipper(),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                width: size.width,
                height: size.height * 0.75,
                color: Color(0xFFEEEEF9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.25,
          ),
        ],
      ),
    );
  }
}
