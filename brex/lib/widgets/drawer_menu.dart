import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const DrawerMenu({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_balance, size: 48, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  "Brex App",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Budgets"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Reports"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            title: Text("Toggle Theme"),
            onTap: toggleTheme,
          ),
        ],
      ),
    );
  }
}
