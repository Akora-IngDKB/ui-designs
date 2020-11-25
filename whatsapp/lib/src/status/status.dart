import 'package:flutter/material.dart';
import 'package:whatsapp/src/status/dashed_circle.dart';
import 'package:whatsapp/src/utils/data.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class StatusList extends StatelessWidget {
  final List<User> users;

  const StatusList(this.users);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'STATUS',
          style: TextStyle(
            color: GREEN_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 16),
            _StatusItem(CURRENT_USER),
            _VerticalDivider(),
            SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (_, i) => _StatusItem(users[i]),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatusItem extends StatelessWidget {
  final User user;

  const _StatusItem(this.user);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DashedCircle(
              dashes: user.statusCount,
              color: GREEN_COLOR,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: GREEN_COLOR,
                  backgroundImage: AssetImage(user.image),
                  radius: 35,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              user.name.split(' ')[0],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      width: 3.2,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(1)),
      ),
    );
  }
}
