import 'package:flutter/material.dart';
import 'package:workout_tracker/models.dart';
import 'package:workout_tracker/screens/workout_details_screen.dart';

import 'add_workout_screen.dart';

class WorkoutListScreen extends StatefulWidget {
  WorkoutListScreen({Key? key}) : super(key: key);

  @override
  _WorkoutListScreenState createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  List<Workout> workouts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Tracker'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(workouts[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailsScreen(workout: workouts[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddWorkoutScreen(
                onSave: (workout) {
                  setState(() {
                    workouts.add(workout);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }

}
