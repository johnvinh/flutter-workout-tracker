import 'package:flutter/material.dart';
import 'package:workout_tracker/models.dart';

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
              // Navigate to workout details screen
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to add workout screen
        },
      ),
    );
  }
}
