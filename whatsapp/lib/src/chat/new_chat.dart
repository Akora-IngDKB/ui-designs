import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/src/chat/conversation.dart';
import 'package:whatsapp/src/models/user.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class NewChatScreen extends StatelessWidget {
  final List<User> users;

  const NewChatScreen(this.users);

  @override
  Widget build(BuildContext context) {
    // Sort users alphabetically
    users.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: GREEN_COLOR,
              ),
            ),
            Text(
              '${users.length} contacts',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined, color: GREEN_COLOR),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.refresh_outlined, color: GREEN_COLOR),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: GREEN_COLOR),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: GREEN_COLOR.withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: Border.all(color: GREEN_COLOR, width: 2),
                    ),
                    child: Icon(
                      Icons.group_add_outlined,
                      size: 36,
                      color: GREEN_COLOR,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'New Group',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(width: 36),
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: GREEN_COLOR.withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: Border.all(color: GREEN_COLOR, width: 2),
                    ),
                    child: Icon(
                      Icons.person_add_outlined,
                      size: 36,
                      color: GREEN_COLOR,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'New Contact',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) {
                return ListTile(
                  leading: Hero(
                    tag: Key(users[i].image),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(users[i].image),
                      radius: 25,
                    ),
                  ),
                  title: Text(
                    users[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) => ConversationScreen(
                          users[i],
                          isNewChat: true,
                        ),
                      ),
                    );
                  },
                  subtitle: Text("Hey there! I'm using WhatsApp."),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
