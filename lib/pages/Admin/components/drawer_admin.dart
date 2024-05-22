import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerAdmin extends StatelessWidget {
  const DrawerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text(
              'Admin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Admin'),
            onTap: () {
              Navigator.pop(context); 
              Get.toNamed('/admin');
            },
          ),
          ListTile(
            leading: const Icon(Icons.tour),
            title: const Text('Toures'),
            onTap: () {
              Navigator.pop(context); 
              Get.toNamed('/admin/tour');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Reservas'),
            onTap: () {
              Navigator.pop(context); 
              Get.toNamed('/admin/reservas');
            },
          ),
          
        ],
      ),
    );
  }
}
