import 'package:flutter/material.dart';
import 'package:workout_tracker/models.dart';
import 'package:workout_tracker/screens/add_day_screen.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  final Workout workout;

  WorkoutDetailsScreen({Key? key, required this.workout}) : super(key: key);

  @override
  _WorkoutDetailsScreenState createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.name),
      ),
      body: ListView.builder(
        itemCount: widget.workout.days.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Day ${index + 1}'),
            subtitle: Text('${widget.workout.days[index].sets.length} sets'),
            onTap: () {
              // Navigate to day details screen
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
              builder: (context) => AddDayScreen(
                onSave: (day) {
                  setState(() {
                    widget.workout.days.add(day);
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
