import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tryproject/User/Location.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController aadharController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/User/ambulance_image.png'), // Replace 'assets/ambulance_image.png' with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 10) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: aadharController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Aadhar Card Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 12) {
                          return 'Please enter a valid 12-digit Aadhar card number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LocationPage()),);
                        }
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
