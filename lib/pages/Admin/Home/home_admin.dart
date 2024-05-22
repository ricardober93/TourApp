import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Admin/home_admin_controller.dart';
import 'package:myapp/pages/Admin/components/card_admin_preview.dart';
import 'package:myapp/pages/Admin/components/drawer_admin.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    HomeAdminController homeAdminController = Get.put(HomeAdminController());

    return Scaffold(
       drawer: const DrawerAdmin(),
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                spacing: 1,
                runSpacing: .8,
                children: [
                  ...homeAdminController.data.map((e) {
                    return CardAdmin(
                      data: e,
                    );
                  })
                ]),
          ),
        ));
  }
}
