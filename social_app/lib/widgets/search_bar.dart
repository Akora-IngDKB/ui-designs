import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        enableInteractiveSelection: true,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          hintText: 'Search for name...',
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.indigo),
        ),
      ),
    );
  }
}
