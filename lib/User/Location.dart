import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: ListView(
        children: [
          _buildLocationContainer(),
          _buildLocationContainer(),
          _buildLocationContainer(),
          _buildLocationContainer(),
        ],
      ),
    );
  }

  Widget _buildLocationContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Location",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Add functionality here
                },
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  // Add functionality here
                },
              ),
              Icon(Icons.location_on), // Replace with your location logo
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LocationPage(),
  ));
}
