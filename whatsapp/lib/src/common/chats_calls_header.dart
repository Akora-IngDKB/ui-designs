import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class ChatCallHeader extends StatelessWidget {
  final bool isChatSelected;
  final VoidCallback onChatsTapped;
  final VoidCallback onCallsTapped;

  const ChatCallHeader({
    this.isChatSelected = true,
    this.onChatsTapped,
    this.onCallsTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _HeaderItem('CHATS', isSelected: isChatSelected, onTap: onChatsTapped),
        _HeaderItem('CALLS', isSelected: !isChatSelected, onTap: onCallsTapped),
      ],
    );
  }
}

class _HeaderItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  _HeaderItem(this.label, {this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: kThemeAnimationDuration,
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: isSelected ? GREEN_COLOR : Colors.grey,
                ),
                child: Text(label),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: isSelected ? GREEN_COLOR : Colors.grey,
                radius: 4,
              ),
            ],
          ),
          AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: 3.5,
            width: 32,
            margin: const EdgeInsets.only(top: 6, right: 9),
            decoration: BoxDecoration(
              color: isSelected ? GREEN_COLOR : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          )
        ],
      ),
    );
  }
}
