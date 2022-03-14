import 'package:flutter/material.dart';
import 'package:udemy_course/models/users/users_model.dart';

class UsersScreen extends StatelessWidget
{
  List<UsersModel> users =
  [
    UsersModel(
      id: 1,
      name: 'Mohamed Elfakharany',
      phone: '+01553032348',
    ),
    UsersModel(
      id: 2,
      name: 'Mahmoud Elfakharany',
      phone: '+01553039988',
    ),
    UsersModel(
      id: 3,
      name: 'Om Kolthom Elfakharany',
      phone: '+01553037788',
    ),
    UsersModel(
      id: 4,
      name: 'AbdulRahman Elfakharany',
      phone: '+01553037564',
    ),
    UsersModel(
      id: 1,
      name: 'Mohamed Elfakharany',
      phone: '+01553032348',
    ),
    UsersModel(
      id: 2,
      name: 'Mahmoud Elfakharany',
      phone: '+01553039988',
    ),
    UsersModel(
      id: 3,
      name: 'Om Kolthom Elfakharany',
      phone: '+01553037788',
    ),
    UsersModel(
      id: 4,
      name: 'AbdulRahman Elfakharany',
      phone: '+01553037564',
    ),
    UsersModel(
      id: 1,
      name: 'Mohamed Elfakharany',
      phone: '+01553032348',
    ),
    UsersModel(
      id: 2,
      name: 'Mahmoud Elfakharany',
      phone: '+01553039988',
    ),
    UsersModel(
      id: 3,
      name: 'Om Kolthom Elfakharany',
      phone: '+01553037788',
    ),
    UsersModel(
      id: 4,
      name: 'AbdulRahman Elfakharany',
      phone: '+01553037564',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context , index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[350],
            ),
          ),
          itemCount: users.length),
    );
  }
  Widget buildUserItem(UsersModel user) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${user.phone}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}
