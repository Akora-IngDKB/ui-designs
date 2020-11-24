import 'package:flutter/material.dart';
import 'package:onboarding/src/onboarding_model.dart';
import 'package:onboarding/src/page_indicator.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;
  final int index;
  final bool isLast;

  const OnboardingItem(this.model, {this.index, this.isLast});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.deepPurple,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Container(
              width: size.width,
              height: size.height * 0.75,
              color: Colors.white.withOpacity(0.93),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PageIndicator(index),
                        if (!isLast)
                          Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 36),
                    Expanded(
                      child: Image.asset(
                        model.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      model.title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 36),
                    Text(
                      model.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: size.height * 0.75 * 0.12),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.25,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  primary: Colors.orange,
                  shape: StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                ),
                child: Text(
                  isLast ? 'Get Started' : 'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
