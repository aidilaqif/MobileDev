import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:provider/provider.dart';

import '../../model/brew.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    brews.forEach((brew) {
      print(brew.name.toString());
      print(brew.sugars.toString());
      print(brew.strength.toString());
    });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
