import 'dart:convert';

class ContactModel {
  ContactModel({
    this.id,
    required this.name,
    required this.email,
    required this.timestamp,
  });

  final String? id;
  final String name;
  final String email;
  final DateTime timestamp;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'timestamp': timestamp.millisecondsSinceEpoch});

    return result;
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) => ContactModel.fromMap(json.decode(source));
}
