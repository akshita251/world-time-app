import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String time;
  String flag;
  bool isDay;

  WorldTime({this.location, this.url, this.flag});

  Future<void> getdata() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['raw_offset'].toString();
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(seconds: int.parse(offset)));
      isDay = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat().add_jm().format(now);
    } catch (e) {
      print(e);
      time = 'error';
    }
  }
}
