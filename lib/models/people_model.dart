import 'package:cloud_firestore/cloud_firestore.dart';

class PeopleModel {
  String? id;
  String? name;
  String? gender;
  String? email;

  PeopleModel({
    this.id,
    this.name,
    this.gender,
    this.email,
  });

  PeopleModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc['name'];
    gender = doc['gender'];
    email = doc['email'];
  }
  Map<String, dynamic> get toMap => {
        'name': name,
        'gender': gender,
        'email': email,
      };
}
