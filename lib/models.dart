class Workout {
  int id;
  String name;
  List<Day> days;

  Workout({required this.id, required this.name, required this.days});

  // Convert a Workout object into a Map object
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  // Extract a Workout object from a Map object
  Workout.fromMapObject(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        days =
            []; // We'll need to update this later to load the days from the database
}

class Day {
  DateTime date;
  List<Set> sets;

  Day({required this.date, required this.sets});
}

class Set {
  int reps;
  double weight;

  Set({required this.reps, required this.weight});
}
