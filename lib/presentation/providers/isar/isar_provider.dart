import 'package:contacts/infrastructure/isar/isar_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';


/// Luego de escribir el provider,
/// ejecutamos: `flutter pub run build_runner build`
@riverpod
IsarDatabase isar(IsarRef ref) {
  return IsarDatabase();
}