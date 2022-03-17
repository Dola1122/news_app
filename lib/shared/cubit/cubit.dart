// import 'package:bloc/bloc.dart';
// import 'package:first/shared/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
// import '../../modules/archived_tasks/archived_tasks_screen.dart';
// import '../../modules/done_tasks/done_tasks_screen.dart';
// import '../../modules/new_tasks/new_tasks_screen.dart';
//
// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppInitState());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//
//   int currentItem = 0;
//
//   List<Widget> Screens = [
//     NewTasksScreen(),
//     DoneTasksScreen(),
//     ArchivedTasksScreen(),
//   ];
//
//   late Database database;
//
//   List<Map> tasks = [];
//
//   IconData fabIcon = Icons.edit;
//   bool isBottomSheetShown = false;
//
//   void ChangeItem(int index) {
//     currentItem = index;
//     emit(AppChangeItem());
//   }
//
//   void changeBottomSheetState({required IconData icon, required bool isShown}) {
//     fabIcon = icon;
//     isBottomSheetShown = isShown;
//     emit(AppChangeBottomSheetState());
//   }
//
//   void createDatabase() {
//     openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) {
//         print('database created');
//         database
//             .execute(
//                 'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('Error when creating table ${error.toString()}');
//         });
//       },
//       onOpen: (database) async {
//         tasks = await getFromDatabase(database);
//         print(tasks);
//         emit(AppGetFromDataBaseState());
//       },
//     ).then((value) {
//       database = value;
//       emit(AppCreateDataBaseState());
//     });
//   }
//
//   Future insertToDatabase({
//     required String title,
//     required String date,
//     required String time,
//   }) {
//     return database.transaction((txn) async {
//       txn
//           .rawInsert(
//               'INSERT INTO tasks (title,date,time,status) VALUES ("$title","$date","$time","new")')
//           .then((value) async {
//         print('$value task was recorded');
//         emit(AppInsertToDataBaseState());
//         tasks = await getFromDatabase(database);
//         emit(AppGetFromDataBaseState());
//       }).catchError((error) {
//         'Error when saving new task ${error.toString()}';
//       });
//     });
//   }
//
//   void updateDataBase(String status,int id){
//     database.rawUpdate(
//         'UPDATE tasks SET status = ? WHERE id = ?',
//         [status, id]).then((value) async {
//           emit(AppUpdateDataBaseState());
//           tasks = await getFromDatabase(database);
//           emit(AppGetFromDataBaseState());
//         });
//   }
//   void deleteFromDataBase(int id){
//     database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) async {
//           emit(AppDeleteFromDataBaseState());
//           tasks = await getFromDatabase(database);
//           emit(AppGetFromDataBaseState());
//         });
//   }
//
//   Future<List<Map>> getFromDatabase(database) async {
//     return await database.rawQuery('SELECT * FROM tasks');
//   }
// }
