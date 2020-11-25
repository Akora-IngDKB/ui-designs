import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class WhatsAppWebScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'WhatsApp Web',
          style: TextStyle(color: GREEN_COLOR),
        ),
        iconTheme: IconThemeData(color: GREEN_COLOR),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: GREEN_COLOR.withOpacity(0.3),
                    shape: BoxShape.circle,
                    border: Border.all(color: GREEN_COLOR, width: 2),
                  ),
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 100,
                    color: Colors.teal,
                  ),
                ),
                Container(
                  height: 2,
                  width: 100,
                  color: GREEN_COLOR,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Tap to scan and start new session',
              style: TextStyle(fontWeight: FontWeight.w500, color: GREEN_COLOR),
            ),
            SizedBox(height: 32),
            Text(
              'Visit web.whatsapp.com on your computer',
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
            ),
            SizedBox(height: 56),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logged In Devices',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: GREEN_COLOR,
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 50),
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.computer_outlined,
                      color: Colors.black54,
                    ),
                    title: Text('Current Session: Now'),
                    subtitle: Text('192.168.1.1 - Work Computer'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.desktop_mac_outlined,
                      color: Colors.black54,
                    ),
                    title: Text('Last Session: Today at 6:13AM'),
                    subtitle: Text('192.168.1.1 - Personal Laptop'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.laptop_mac_outlined,
                      color: Colors.black54,
                    ),
                    title: Text('Last Session: Yesterday at 6:13PM'),
                    subtitle: Text('192.168.1.1 - Chrome on MacOS'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
