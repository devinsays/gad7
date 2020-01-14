import 'package:flutter/material.dart';

import 'package:anxiety_tracker/styles/palette.dart';

class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_horiz,
        color: Palette.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'history',
          child: Text(
            'Responses',
          ),
        ),
        PopupMenuItem(
          value: 'about',
          child: Text(
            'About',
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
