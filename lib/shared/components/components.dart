import 'package:flutter/material.dart';
import 'package:udemy_course/shared/tasks_cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 15.0,
  double height = 40.0,
  FontWeight BtnfontBold = FontWeight.bold,
  required Function() function,
  required String text,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: background,
    ),
    child: MaterialButton(
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: BtnfontBold,
          color: Colors.white,
        ),
      ),
      onPressed: function,
    ),
  );
}

Widget defaultFormField({
  Function(dynamic)? onSubmit,
  Function(dynamic)? onChange,
  Function(dynamic)? validate,
  Function()? onPressedSofix,
  Function()? onTapText,
  IconData? sofIcon,
  bool security = false,
  required TextEditingController textController,
  required TextInputType textType,
  required IconData preficon,
  required String labelText,
  required String validatedText,
}) {
  return TextFormField(
    controller: textController,
    keyboardType: textType,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    obscureText: security,
    onTap: onTapText,
    decoration: InputDecoration(
      prefixIcon: Icon(preficon),
      labelText: 'Enter Your ${labelText}',
      border: OutlineInputBorder(),
      suffixIcon: IconButton(
        icon: Icon(sofIcon),
        onPressed: onPressedSofix,
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return '${validatedText} must not be Empty';
      }
    },
  );
}

Widget buildTaskItem(Map model,context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
              '${model['time']}',
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${model['date']}',
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        IconButton(
          onPressed: (){
            AppCubit.get(context).updateData(id: model['id'], status: 'done');
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green[300],
          ),
        ),
        IconButton(
          onPressed: (){
            AppCubit.get(context).updateData(id: model['id'], status: 'archived');
          },
          icon: Icon(Icons.archive,
          color: Colors.black45,)
        ),
      ],
    ),
  );
}
