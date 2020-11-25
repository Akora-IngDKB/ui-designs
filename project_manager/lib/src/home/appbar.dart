import 'package:flutter/material.dart';
import 'package:project_manager/src/common/progress_container.dart';
import 'package:project_manager/src/util/theme_values.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: double.maxFinite,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ORANGE,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.format_align_left),
              Spacer(),
              Icon(Icons.search),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProgressContainer(
                percentComplete: 77,
                bgBorderColor: Colors.transparent,
                progressColor: RED_ORANGE,
                contentPadding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage:
                      AssetImage('assets/images/oladimeji_odunsi.jpg'),
                ),
              ),
              SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akora Ing. DKB',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Project Manager',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  )
                ],
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
