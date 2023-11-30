import 'package:isar/isar.dart';

part 'contact.g.dart';

@collection
class Contact {
  Contact({
    required this.name,
    required this.lastName,
    required this.phone,
    this.avatar,
    this.address,
  });

  Id id = Isar.autoIncrement;
  String name;
  String lastName;
  String phone;
  String? avatar;
  String? email;
  String? address;
}
