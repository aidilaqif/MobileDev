import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/person.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //accessing user data from provider
    final user = Provider.of<Person?>(context);

    //return either home or authenticate
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
