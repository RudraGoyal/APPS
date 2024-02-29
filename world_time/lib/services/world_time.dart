import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String time = 'loading';
  String flag;
  late bool isDaytime;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    int offsetHours = int.parse(data['utc_offset'].substring(1, 3));
    int offsetMinutes = int.parse(data['utc_offset'].substring(4, 6));
    DateTime now = DateTime.parse(data['datetime']);
    now = now.add(Duration(hours: offsetHours, minutes: offsetMinutes));
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
