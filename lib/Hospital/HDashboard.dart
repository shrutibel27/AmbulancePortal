import 'package:flutter/material.dart';
import 'package:tryproject/Hospital/DriverStatus.dart';

class HospitalDashboard extends StatelessWidget {
  const HospitalDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hospital Dashboard")),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SecondPage(heroTag: index)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Hero(
                              tag: index,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  _images[index],
                                  width: 200,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'User: $index',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20), // Add spacing between the ListView and the button
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the Driver Status button
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Driverstatus(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Driver Status',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;

  const SecondPage({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero ListView Page 2")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(_images[heroTag]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Content goes here",
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}

final List<String> _images = [
  'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/273935/pexels-photo-273935.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];
