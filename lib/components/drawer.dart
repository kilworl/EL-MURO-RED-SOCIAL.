import 'package:flutter/material.dart';
import 'package:red_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfile;
  final void Function()? onSignOut;
  const MyDrawer({super.key, required this.onProfile, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),

              //home list tile
              MyListTile(
                  icon: Icons.home,
                  text: 'H O M E',
                  onTap: () => Navigator.pop(context)),

              //profile list tile
              MyListTile(
                  icon: Icons.person, text: 'P R O F I L E', onTap: onProfile),

              //logout list tile
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MyListTile(
                    icon: Icons.logout, text: 'L O G O U T', onTap: onSignOut),
              )
            ],
          )
        ],
      ),
    );
  }
}
