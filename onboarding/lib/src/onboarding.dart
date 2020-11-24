import 'package:flutter/material.dart';
import 'package:onboarding/src/onboarding_item.dart';
import 'package:onboarding/src/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => OnboardingItem(
          items[index],
          index: index,
          isLast: index == items.length - 1,
        ),
      ),
    );
  }
}
