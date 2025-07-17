import 'package:first_application/utils/routes.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Vikram Kumar"),
                accountEmail: Text("modivikram18@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/boy.jpg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              leading: Icon(Icons.home),
              title: Text('home'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back_ios),
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('Contact'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
