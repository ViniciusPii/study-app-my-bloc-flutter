class CollaboratorModel {
  CollaboratorModel({
    required this.job,
    required this.name,
  });

  final String job;
  final String name;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'job': job,
      'name': name,
    };
  }
}
