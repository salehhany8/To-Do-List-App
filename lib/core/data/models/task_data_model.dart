class TaskDataModel {
  final String name;
  final String description;
  final DateTime date;
  String? id;
  bool? isDone;

  TaskDataModel({
    this.id,
    this.isDone =false,
    required this.name,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'isDone':isDone
    };
  }

  factory TaskDataModel.fromJson(Map<String, dynamic> json) {
    return TaskDataModel(
      name: json['name'] ?? 'blank',
      description: json['description'] ?? '',
      date: json['date'].toDate() ?? DateTime.now(),
      isDone: json['isDone'] ?? false
    );
  }
}