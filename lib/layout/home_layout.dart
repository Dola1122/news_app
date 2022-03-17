// import 'package:first/modules/archived_tasks/archived_tasks_screen.dart';
// import 'package:first/modules/done_tasks/done_tasks_screen.dart';
// import 'package:first/modules/new_tasks/new_tasks_screen.dart';
// import 'package:first/shared/components/components.dart';
// import 'package:first/shared/components/constants.dart';
// import 'package:first/shared/cubit/cubit.dart';
// import 'package:first/shared/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:sqflite/sqflite.dart';
//
// class HomeLayoutScreen extends StatelessWidget {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   var formKey = GlobalKey<FormState>();
//
//   var titleController = TextEditingController();
//   var timeController = TextEditingController();
//   var dateController = TextEditingController();
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //
//   //   createDatabase();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AppCubit()..createDatabase(),
//       child: BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) {
//           if(state is AppInsertToDataBaseState){
//             Navigator.pop(context);
//           }
//         },
//         builder: (context, state) {
//           AppCubit cubit = AppCubit.get(context);
//           return Scaffold(
//             key: scaffoldKey,
//             appBar: AppBar(
//               title: Text('Todo App'),
//               centerTitle: true,
//             ),
//             floatingActionButton: FloatingActionButton(
//                 child: Icon(cubit.fabIcon),
//                 onPressed: () {
//                   //insertToDatabase();
//                   if (cubit.isBottomSheetShown) {
//                     if (formKey.currentState!.validate()) {
//                       cubit.insertToDatabase(
//                         title: titleController.text,
//                         date: dateController.text,
//                         time: timeController.text,
//                       );
//                       cubit.changeBottomSheetState(icon: Icons.edit, isShown: false);
//
//                       // setState(() async {
//                       //   Navigator.pop(context);
//                       //   isBottomSheetShown = false;
//                       //   fabIcon = Icons.edit;
//                       //   tasks = await getFromDatabase(database);
//                       // });
//                     }
//                   }
//                   else {
//                     cubit.changeBottomSheetState(
//                         icon: Icons.add, isShown: true);
//                     scaffoldKey.currentState
//                         ?.showBottomSheet((context) => Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(25),
//                                     topRight: Radius.circular(25)),
//                                 color: Colors.grey[200],
//                               ),
//                               padding: EdgeInsets.all(20),
//                               child: Form(
//                                 key: formKey,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     defaultFormField(
//                                       validateText: 'title must not be empty',
//                                       labelText: 'Task Title',
//                                       controller: titleController,
//                                       prefixIcon: Icons.text_fields,
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     defaultFormField(
//                                         validateText: 'Time must not be empty',
//                                         labelText: 'Task Time',
//                                         controller: timeController,
//                                         prefixIcon: Icons.text_fields,
//                                         onTap: () {
//                                           showTimePicker(
//                                             context: context,
//                                             initialTime: TimeOfDay.now(),
//                                           ).then((value) {
//                                             timeController.text = value!
//                                                 .format(context)
//                                                 .toString();
//                                           });
//                                         }),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     defaultFormField(
//                                         validateText: 'Date must not be empty',
//                                         labelText: 'Task Date',
//                                         controller: dateController,
//                                         prefixIcon: Icons.calendar_today,
//                                         onTap: () {
//                                           showDatePicker(
//                                             context: context,
//                                             initialDate: DateTime.now(),
//                                             firstDate: DateTime.now(),
//                                             lastDate:
//                                                 DateTime.parse('2022-03-19'),
//                                           ).then((value) {
//                                             dateController.text =
//                                                 DateFormat.yMMMd()
//                                                     .format(value!);
//                                             print(dateController.text);
//                                           });
//                                         }),
//                                   ],
//                                 ),
//                               ),
//                             ))
//                         .closed
//                         .then((value) {
//                       cubit.changeBottomSheetState(
//                           icon: Icons.edit, isShown: false);
//                     });
//                   }
//                 }),
//             bottomNavigationBar: BottomNavigationBar(
//               items: [
//                 BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.check_circle_outline), label: 'Done'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.archive_outlined), label: 'Archive'),
//               ],
//               currentIndex: cubit.currentItem,
//               onTap: (index) {
//                 cubit.ChangeItem(index);
//               },
//               elevation: 0,
//             ),
//             body: cubit.Screens[cubit.currentItem],
//           );
//         },
//       ),
//     );
//   }
//
//   Future<String> firstName() async {
//     return 'Ahmed Adel';
//   }
// }
