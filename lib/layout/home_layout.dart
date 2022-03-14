import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_course/modules/arhived_tasks/archived_tasks.dart';
import 'package:udemy_course/modules/done_tasks/done_tasks.dart';
import 'package:udemy_course/modules/new_task/new_tasks.dart';
import 'package:udemy_course/shared/components/components.dart';
import 'package:udemy_course/shared/components/constants.dart';
import 'package:udemy_course/shared/tasks_cubit/cubit.dart';
import 'package:udemy_course/shared/tasks_cubit/states.dart';

class HomeLayoutScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatebase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.appBarTitle[cubit.currentItem],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentItem],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.fabIcon),
              onPressed: () {
                // try
                // {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    try {
                      cubit.insertToDatabase(
                          title: titleController.text,
                          time: timeController.text,
                          date: dateController.text);
                    } catch (error) {
                      print(error);
                    }
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) {
                          return Container(
                            color: Colors.grey[250],
                            padding: EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                    textController: titleController,
                                    textType: TextInputType.text,
                                    preficon: Icons.title,
                                    labelText: 'Title',
                                    validatedText: 'title',
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    textController: timeController,
                                    textType: TextInputType.datetime,
                                    preficon: Icons.watch_later_outlined,
                                    labelText: 'choose Time',
                                    validatedText: 'Time',
                                    onTapText: () async {
                                      try {
                                        var time = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                        timeController.text =
                                            time!.format(context).toString();
                                        print(timeController.text);
                                      } catch (error) {
                                        print(error);
                                      }
                                      ;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    textController: dateController,
                                    textType: TextInputType.datetime,
                                    preficon: Icons.calendar_today_outlined,
                                    labelText: 'choose Date',
                                    validatedText: 'Date',
                                    onTapText: () async {
                                      try {
                                        var date = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          initialDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2022-02-12'),
                                        );
                                        print(DateFormat()
                                            .add_yMMMd()
                                            .format(date!));
                                        dateController.text = DateFormat()
                                            .add_yMMMd()
                                            .format(date);
                                      } catch (error) {
                                        print(error);
                                      }
                                      ;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                      .closed
                      .then((value) {
                        cubit.changeBottomSheetState(
                            isShow: false, icon: Icons.edit);
                      });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }

                // insertToDatabase();
                // }catch(error)
                // {
                //   print('ERROR is ${error.toString()}');
                // }
                // // getName().then((value){
                // //   throw('انا فاشل وعملت غلط');
                // //   print('${value.toString()}');
                // // }).catchError((error){
                // //   print('Error is ${error.toString()}');
                // // });
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentItem,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done_rounded,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// Future<String> getName() async {
//   return 'Mohamed Alfakharany';
// }

}
