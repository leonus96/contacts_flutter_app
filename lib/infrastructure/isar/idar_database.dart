import 'package:contacts/domain/contact/contact.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  Isar? isar;

  /// Esta funcíon [db] devuelve la bsa de datos Isar.
  Future<Isar> db() async {
    /// Si es la primera vez qu ellamamos a la funcion [db]
    if(isar == null) {
      /// Traemos la carpeta donde se guardará la base de datos.
      final dir = await getApplicationDocumentsDirectory();

      /// Abrimos la base de datos
      isar = await Isar.open(
        [ContactSchema],
        directory: dir.path,
      );
      return isar!;
    }

    /// Si la base de datos ya esta abierta.
    return isar!;
  }
}
