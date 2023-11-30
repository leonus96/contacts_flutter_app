import 'package:contacts/domain/contact/contact.dart';
import 'package:contacts/presentation/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';

final List<Contact> contacts = [
  Contact(name: 'Joseph', lastName: 'Leon', phone: '9232328971'),
  Contact(name: 'Cesar', lastName: 'Faggiani', phone: '23423423'),
  Contact(name: 'Miguel', lastName: 'Castillo', phone: '6432421'),
  Contact(name: 'Katerin', lastName: 'Villalobos', phone: '98163291'),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: contacts.map((e) => ContactListItem(contact: e)).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              ],
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('form');
              },
              elevation: 0,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
