import 'package:flutter/material.dart';
import 'package:workout_tracker/models.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final Workout workout;

  WorkoutDetailsScreen({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: ListView.builder(
        itemCount: workout.days.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Day ${index + 1}'),
            subtitle: Text('${workout.days[index].sets.length} sets'),
            onTap: () {
              // Navigate to day details screen
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to add day screen
        },
      ),
    );
  }
}
