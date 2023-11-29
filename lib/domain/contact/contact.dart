class Contact {
  Contact({
    required this.name,
    required this.lastName,
    required this.phone,
    this.avatar,
    this.address,
  });

  String name;
  String lastName;
  String phone;
  String? avatar;
  String? email;
  String? address;
}
