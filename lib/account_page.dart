// account_page.dart
import 'package:flutter/material.dart';
import 'authentication.dart';

class AccountPage extends StatelessWidget {
  final UserData userData;

  AccountPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Name'),
              subtitle: Text(userData.name),
            ),
            ListTile(
              title: Text('Location'),
              subtitle: Text(userData.location),
            ),
            ListTile(
              title: Text('Blood Group'),
              subtitle: Text(userData.bloodGroup),
            ),
            ListTile(
              title: Text('Gender'),
              subtitle: Text(userData.gender),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to sign up page
                Navigator.pop(context);
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
