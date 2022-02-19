import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:windows_app/constants.dart';

import '../../controllers/menu_controller.dart';
import '../../responsive.dart';
import '../dashboard/components/header.dart';
import '../main/components/side_menu.dart';

class LeadsHome extends StatelessWidget {
  const LeadsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController c = Get.put(MenuController());
    return Scaffold(
      key: c.scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const Header(
                      header: 'Leads',
                    ),
                    const SizedBox(height: defaultPadding),
                    Responsive.isDesktop(context)
                        ? Row(
                            children: [
                              Expanded(child: LeadsActivity()),
                              Expanded(child: LeadsReport())
                            ],
                          )
                        : Column(
                            children: [LeadsActivity(), LeadsReport()],
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeadsReport extends StatelessWidget {
  const LeadsReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.timeline,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'LEADS REPORTS ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Returns data for Calls made, Appointments secured, Shared quotations, Closed leads,Leads: Calls conversion (%), Calls: Appointments conversion (%), Appointments: Closing conversion (%), Leads: Appointment: Closing ratio.',
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Filter options',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: primaryColor),
            ),
            const SizedBox(
              height: 8,
            ),
            MultiSelectChipDisplay(
              chipColor: Colors.grey.shade300,
              textStyle: TextStyle(color: context.theme.primaryColor),
              items: ['Sale Stage'].map((e) => MultiSelectItem(e, e)).toList(),
              onTap: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text(
                  'View Report',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LeadsActivity extends StatelessWidget {
  const LeadsActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.timeline,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'LEADS ACTIVITY',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Returns leads generated in the current month if a date is not specified. Filter options allows access to leads activity within the specified period.\nOnly 20 records will be displayed in-app, to get the whole list please extract to excel.',
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Filter options',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: primaryColor),
            ),
            const SizedBox(
              height: 8,
            ),
            MultiSelectChipDisplay(
              chipColor: Colors.grey.shade300,
              textStyle: TextStyle(color: context.theme.primaryColor),
              items: ['Date', 'Source', 'Date & Source']
                  .map((e) => MultiSelectItem(e, e))
                  .toList(),
              onTap: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text(
                  'View Report',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
