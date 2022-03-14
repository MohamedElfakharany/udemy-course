import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_course/modules/arhived_tasks/archived_tasks.dart';
import 'package:udemy_course/modules/done_tasks/done_tasks.dart';
import 'package:udemy_course/modules/new_task/new_tasks.dart';
import 'package:udemy_course/shared/tasks_cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> appBarTitle = [
    'New Task',
    'Done Task',
    'Arechived Task',
  ];

  int currentItem = 0;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void changeIndex(var index) {
    currentItem = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatebase() async {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (databse, version) async {
        try {
          print('database created');
          await databse.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
          print('table created');
        } catch (error) {
          print('Error in creating database ${error.toString()}');
        }
      },
      onOpen: (database) async {
        await getDataFromDatabase(database).then((value) {
          newTasks = value;
          print(newTasks);
          emit(AppGetDatabaseState());
        });
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Database? database;

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database?.transaction((txn) => txn
            .rawInsert(
          'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")',
        )
            .then((value) {
          print('${value.toString()} inserted successfuly');
          emit(AppInsertDatabaseState());
          getDataFromDatabase(database).then((value) {
            newTasks = value;
            print(newTasks);
            emit(AppGetDatabaseState());
          });
        }).catchError((error) {
          print('Error when inserting new record ${error.toString()}');
        }));
  }

  Future<List<Map<dynamic, dynamic>>> getDataFromDatabase(database) async {
    emit(AppGetDatabaseLoadingState());
    return await database?.rawQuery('SELECT * FROM tasks').then((value){
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        }else if(element['status'] == 'done') {
          doneTasks.add(element);
        }else{
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });

  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
    print('tasks from get is ${newTasks}');
  }

  void updateData({
  required int id,
  required String status,
}) async
  {
    database?.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id]).then((value)
    {
      emit(AppGetDatabaseState());
      emit(AppUpdateDatabaseState());
    }
    );
  }
}
