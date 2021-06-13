import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_app_assignment/controllers/todolist_repository.dart';

Future<void> initDatabase() async {
  try {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast.db");
    final db = await databaseFactoryIo.openDatabase(databasePath);

    // var store = StoreRef.main();
    GetIt.I.registerSingleton<Database>(db);
    GetIt.I
        .registerLazySingleton<ToDoListRepository>(() => ToDoListRepository());
  } catch (e) {
    print(e.toString());
  }
}
