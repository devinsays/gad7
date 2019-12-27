import 'package:flutter/material.dart';

import 'package:gad7/styles/palette.dart';

class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: Palette.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'history',
          child: Text(
            'Response History',
          ),
        ),
        PopupMenuItem(
          value: 'about',
          child: Text(
            'About',
          ),
        ),
        PopupMenuItem(
          value: 'notifications',
          child: Text(
            'Notifications',
          ),
        ),
        PopupMenuItem(
          value: 'privacy',
          child: Text(
            'Privacy Policy',
          ),
        ),
      ],
      onSelected: (selected) async {
        print(selected);
        Navigator.pushNamed(context, '/$selected');
      },
      tooltip: 'Menu',
    );
  }
}
