import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(80)),
            FlatButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'isDaytime': result['isDaytime'],
                    'location': result['location'],
                    'flag': result['flag']
                  };
                });
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[300],
              ),
              label: Text(
                'Edit Location',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                ),
              ),
            ),
            const SizedBox(
              // between {edit location} and {country}
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/${data['flag']}'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  data['location'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data['time'],
              style: const TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
