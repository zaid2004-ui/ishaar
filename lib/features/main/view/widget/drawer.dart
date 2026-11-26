import 'package:flutter/material.dart';
import 'package:ishaar/core/utils/widgets/custom_listtile_drawer.dart';

class DreaweWidget extends StatelessWidget {
  const DreaweWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomListTileDrawer(
              iconData: Icons.settings_outlined,
              title: 'Settings',
            ),
            const SizedBox(height: 20),
            CustomListTileDrawer(iconData: Icons.info_outline, title: 'About'),
          ],
        ),
      ),
    );
  }
}
