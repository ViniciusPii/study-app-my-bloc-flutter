import 'package:cloud_firestore/cloud_firestore.dart';

class CollaboratorModel {
  CollaboratorModel({
    this.id,
    required this.job,
    required this.name,
    required this.timestamp,
  });

  final String? id;
  final String job;
  final String name;
  final DateTime timestamp;

  factory CollaboratorModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    return CollaboratorModel(
      id: doc.id,
      job: doc['job'].toString(),
      name: doc['name'].toString(),
      timestamp: DateTime.parse(doc['timestamp'].toDate().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'job': job,
      'name': name,
      'timestamp': timestamp,
    };
  }
}
