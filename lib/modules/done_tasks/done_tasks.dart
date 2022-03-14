import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_course/shared/components/components.dart';
import 'package:udemy_course/shared/tasks_cubit/cubit.dart';
import 'package:udemy_course/shared/tasks_cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){

        var tasks = AppCubit.get(context).doneTasks;

        return ListView.separated(
          itemBuilder: (context,index){
            return buildTaskItem(tasks[index],context);
          },
          separatorBuilder: (context,index){
            return Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
            );
          },
          itemCount: AppCubit.get(context).doneTasks.length,
        ) ;
      },
    );
  }
}
