import 'package:flutter/material.dart';
import 'package:workout_tracker/models.dart';

class AddDayScreen extends StatefulWidget {
  final Function(Day) onSave;

  AddDayScreen({Key? key, required this.onSave}) : super(key: key);

  @override
  _AddDayScreenState createState() => _AddDayScreenState();
}

class _AddDayScreenState extends State<AddDayScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Set> _sets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Day'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Add widgets to add sets here
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSave(Day(date: DateTime.now(), sets: _sets));
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
