import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/data.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: GREEN_COLOR),
        ),
        iconTheme: IconThemeData(color: GREEN_COLOR),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: Key('user-avatar'),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(CURRENT_USER.image),
                    radius: 120,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: (MediaQuery.of(context).size.width * 0.5) - 120,
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 8),
                    color: GREEN_COLOR,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Akora Ing. DKB',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'This is not your username or pin.'
                  ' This name will be visible to your WhatsApp contacts',
                ),
              ],
            ),
            isThreeLine: true,
            trailing: Icon(Icons.edit_outlined),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
            subtitle: Text(
              "Hey there! I'm using WhatsApp.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.edit_outlined),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone_outlined),
            title: Text(
              'Phone',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
            subtitle: Text(
              '+233 24 628 813',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
