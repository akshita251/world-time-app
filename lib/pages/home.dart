import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String bgImg = data['isDay'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDay'] ? Colors.blue[800] : Colors.blue[900];
    // print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit_location,
                    size: 60.0,
                  ),
                  color: Colors.white,
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDay': result['isDay']
                      };
                    });
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  data['location'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28.0, letterSpacing: 2.0, color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Text(data['time'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 48.0,
                        letterSpacing: 2.0,
                        color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
