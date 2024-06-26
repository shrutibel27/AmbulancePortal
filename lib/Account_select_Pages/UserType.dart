import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tryproject/Driver/DDashboard.dart';
import 'package:tryproject/Hospital/HDashboard.dart';
import 'DriverSignInPage.dart';
import 'HospitalSignInPage.dart';
import 'UserSignInPage.dart';

class UserTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Account Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Account Type',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            _buildAccountTypeButton(context, 'User', UserSignInPage()),
            // _buildAccountTypeButton(context, 'Hospital', HospitalSignInPage()),
            _buildAccountTypeButton(context, 'Hospital', HospitalDashboard()),
            // _buildAccountTypeButton(context, 'Driver', DriverSignInPage()),
            _buildAccountTypeButton(context, 'Driver', DriverPage()),
          ],
        ),
      ),
    );
  }
  Widget _buildAccountTypeButton(BuildContext context, String text, Widget nextPage) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          },
          child: Text(text),
        ),
      ),
    );
  }
}