import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'kolkata', url: 'Asia/kolkata', flag: 'india.png');
    await instance.getdata();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitFadingCube(
        color: Colors.black,
        size: 50.0,
      ),
    ));
  }
}
