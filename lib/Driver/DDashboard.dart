// lib/driver_page.dart

import 'package:flutter/material.dart';

class DriverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Input field for name
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Available:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Toggle buttons for availability
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Off'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('On'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Working:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Toggle buttons for working status
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Off'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('On'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Sleeping raccoon image
            Image.asset('assets/images/sleeping_raccoon.jpg'),
            SizedBox(height: 16),
            Text(
              "You'll be notified when we need your help",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
