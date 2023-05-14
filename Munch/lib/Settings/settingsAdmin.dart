import 'package:flutter/material.dart';

import '../Login/admin_login.dart';

class SettingsAdmin extends StatefulWidget {
  const SettingsAdmin({super.key});

  @override
  State<SettingsAdmin> createState() => _SettingsAdminState();
}

class _SettingsAdminState extends State<SettingsAdmin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsAdmin'),
        backgroundColor: const Color(0xFFE85852),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Common',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFE85852),
              ),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text('English'),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            const ListTile(
              leading: Icon(Icons.account_tree_rounded),
              title: Text('Version'),
              subtitle: Text('V. 0.0.02'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFE85852),
              ),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            const ListTile(
              leading: Icon(Icons.mail),
              title: Text('Email'),
            ),
            const SizedBox(height: 16),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminLogin())
                    );
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Color(0xFFE85852),
                      fontSize: 18,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

