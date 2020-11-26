import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_manager/src/new_task/task_bar.dart';
import 'package:project_manager/src/util/theme_values.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ORANGE,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Taskbar(),
          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 24),
              Expanded(
                child: TextFormField(
                  enabled: false,
                  initialValue: '4:00',
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Start time',
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('PM'),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                        ),
                      ],
                    ),
                  ),
                  style: TextStyle(color: BLACK, fontSize: 17),
                ),
              ),
              SizedBox(width: 56),
              Expanded(
                child: TextFormField(
                  enabled: false,
                  initialValue: '6:00',
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'End time',
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('PM'),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                        ),
                      ],
                    ),
                  ),
                  style: TextStyle(color: BLACK, fontSize: 17),
                ),
              ),
              SizedBox(width: 24),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: TextFormField(
              enabled: false,
              initialValue: 'Add product categories to the dashboard, '
                  'change vertical scroll to horizontal. '
                  'Draw new icons in blue.',
              maxLines: 3,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
              style: TextStyle(
                color: BLACK,
                fontSize: 17,
                height: 1.28,
                wordSpacing: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Wrap(
              spacing: 32,
              children: [
                Chip(
                  label: Text(
                    'SPORT APP',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: RED_ORANGE,
                ),
                Chip(
                  label: Text(
                    'MEDICAL APP',
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                Chip(
                  label: Text(
                    'RENT APP',
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                Chip(
                  label: Text(
                    'BANKING APP',
                  ),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              child: Text(
                'Create task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(LIGHT_BLUE),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(StadiumBorder()),
                minimumSize: MaterialStateProperty.all(
                  Size(double.maxFinite, 50),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
