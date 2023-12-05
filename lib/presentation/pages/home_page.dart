import 'package:contacts/domain/contact/contact.dart';
import 'package:contacts/presentation/providers/isar/isar_provider.dart';
import 'package:contacts/presentation/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Contact> contacts = [];

  /// Se ejecuta o llama antes del primer build.
  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts() async {
    final isar = ref.read(isarProvider);
    final db = await isar.db();

    /// Traemos todos los contactos de la base de datos.
    contacts = await db.contacts.where().findAll();
    setState(() {});
  }

  /// Se ejecuta cada vez que se tiene que construir los widgets en pantalla.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contactos')),
      body: ListView(
        children: contacts
            .map((e) => ContactListItem(
                  contact: e,
                  refresh: () {
                    _loadContacts();
                  },
                ))
            .toList(),
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
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () async {
                await Navigator.of(context).pushNamed('form');
                _loadContacts();
              },
              elevation: 0,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
