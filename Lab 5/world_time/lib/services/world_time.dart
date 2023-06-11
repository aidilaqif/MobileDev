import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WorldTime {
  String location; //location name for the  UI
  late String time; //the time in that location
  String flag; //url to an asset icon
  String url; //location url
  late bool isDaytime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    const maxRetries = 100;
    int retryCount = 0;
    while (retryCount < maxRetries) {
      try {
        //make the request
        Response response =
            await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

        Map data = jsonDecode(response.body);
        // print(data);

        //get properties from data
        String dateTime = data['datetime'];
        int offset = int.parse(data['utc_offset'].substring(0, 3));
        // print(dateTime);
        // print(offset);

        //create DateTime object
        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: offset));

        //set the time property
        isDaytime = now.hour >= 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
        return;
      } catch (e) {
        print('caught error: $e');
        time = 'could not get time data';
        retryCount++;
        if (retryCount < maxRetries) {
          print('Retrying...');
          await Future.delayed(
              Duration(seconds: 2)); // Wait for 2 seconds before retrying
        }
      }
    }
  }
}
