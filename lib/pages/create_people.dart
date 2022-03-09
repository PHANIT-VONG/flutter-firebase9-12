import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase9_12/models/people_model.dart';
import 'package:flutter_firebase9_12/services/people_service.dart';

class CreatePeoplePage extends StatefulWidget {
  const CreatePeoplePage({Key? key}) : super(key: key);

  @override
  State<CreatePeoplePage> createState() => _CreatePeoplePageState();
}

class _CreatePeoplePageState extends State<CreatePeoplePage> {
  final name = TextEditingController();
  final gender = TextEditingController();
  final email = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('tbPeople');

  Future<void> addContact() {
    return users.add({
      'name': name.text,
      'gender': gender.text,
      'email': email.text
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('People added')),
      );
    }).catchError((error) {
      debugPrint("Failed to add people: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create People'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 26.0),
            TextField(
              controller: gender,
              decoration: const InputDecoration(
                hintText: 'Gender',
              ),
            ),
            const SizedBox(height: 26.0),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 26.0),
            ElevatedButton.icon(
              onPressed: () async {
                var people = PeopleModel(
                  name: name.text,
                  gender: gender.text,
                  email: email.text,
                );
                PeopleService().createPeople(people);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add),
              label: const Text('SAVE'),
            )
          ],
        ),
      ),
    );
  }
}
