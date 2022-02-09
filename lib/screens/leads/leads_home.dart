import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/constants.dart';

import '../../controllers/menu_controller.dart';
import '../../responsive.dart';
import '../dashboard/components/header.dart';
import '../main/components/side_menu.dart';

class LeadsHome extends StatelessWidget {
  const LeadsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final MenuController c = Get.put(MenuController());
    return Scaffold(
      key: c.scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    child: SideMenu(),
                  ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
