import 'package:flutter/material.dart';

class DriverPage extends StatefulWidget {
  @override
  _DriverPageState createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  bool _available = false;
  bool _working = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Driver: Niket",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: Text("Available"),
            value: _available,
            onChanged: (value) {
              setState(() {
                _available = value;
                if (!_available) {
                  _working = false;
                }
              });
            },
          ),
          SwitchListTile(
            title: Text("Working"),
            value: _working,
            onChanged: (value) {
              setState(() {
                _working = value;
                if (_working) {
                  _available = false;
                }
              });
            },
          ),
          if (_working)
            Expanded(
              child: Container(
                color: Colors.grey, // Placeholder for the map
                child: Center(
                  child: Text(
                    "Map goes here",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DriverPage(),
  ));
}
