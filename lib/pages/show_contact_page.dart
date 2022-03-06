import 'package:flutter/material.dart';
import 'package:flutter_firebase9_12/pages/create_contact.dart';

class ShowContactPage extends StatelessWidget {
  const ShowContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreateContactPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
