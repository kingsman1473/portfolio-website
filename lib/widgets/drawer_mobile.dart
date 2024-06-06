import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: CustomeColor.scaffoldBg,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
            for (int i = 0; i < navIcons.length; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                titleTextStyle: const TextStyle(
                  color: CustomeColor.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                onTap: () {},
                leading: Icon(navIcons[i]),
                title: Text(navTitles[i]),
              ),
          ],
        ),
      );
  }
}