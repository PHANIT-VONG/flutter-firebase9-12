import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({Key? key}) : super(key: key);

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final gender = TextEditingController();
  final address = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addContact() {
    return users.add({
      'firstName': firstName.text,
      'lastName': lastName.text,
      'gender': gender.text,
      'address': address.text
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User added')),
      );
    }).catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            TextField(
              controller: firstName,
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
            ),
            const SizedBox(height: 26.0),
            TextField(
              controller: lastName,
              decoration: const InputDecoration(
                hintText: 'Last Name',
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
              controller: address,
              decoration: const InputDecoration(
                hintText: 'Address',
              ),
            ),
            const SizedBox(height: 26.0),
            ElevatedButton.icon(
              onPressed: () {
                addContact();
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
