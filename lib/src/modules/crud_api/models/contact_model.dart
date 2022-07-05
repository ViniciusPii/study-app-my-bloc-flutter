import 'dart:convert';

class ContactModel {
  ContactModel({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  static ContactModel get contactEmpty => ContactModel(id: '', name: '', email: '');

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) => ContactModel.fromMap(json.decode(source));
}
