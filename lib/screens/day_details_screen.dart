import 'package:flutter/material.dart';
import 'package:workout_tracker/models.dart';

class DayDetailsScreen extends StatelessWidget {
  final Day day;

  DayDetailsScreen({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day Details'),
      ),
      body: ListView.builder(
        itemCount: day.sets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Set ${index + 1}'),
            subtitle: Text('${day.sets[index].reps} reps, ${day.sets[index].weight} kg'),
          );
        },
      ),
    );
  }
}
