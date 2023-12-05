import 'package:contacts/presentation/pages/contact_detail.dart';
import 'package:contacts/presentation/pages/contact_form.dart';
import 'package:contacts/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class ContactsApp extends StatelessWidget {
  const ContactsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        'detail': (_) => const ContactDetail(),
        'form': (_) => const ContactForm(),
      },
    );
  }
}
