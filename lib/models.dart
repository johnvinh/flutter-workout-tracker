class Workout {
  String name;
  List<Day> days;

  Workout({required this.name, required this.days});
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
