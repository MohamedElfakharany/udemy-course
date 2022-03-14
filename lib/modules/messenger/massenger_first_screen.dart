import 'package:flutter/material.dart';

class MassengerFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 9.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/34916493?s=400&u=e7300b829193270fbcd03a813551a3702299cbb1&v=4'),
            ),
            SizedBox(
              width: 25.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: Colors.grey,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15.0,
                  ),
                  itemCount: 15,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: 20,
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget buildStoryItem() => Container(
        width: 70.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/34916493?s=400&u=e7300b829193270fbcd03a813551a3702299cbb1&v=4'),
                ),
                CircleAvatar(
                  radius: 8.5,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Mohamed Alfakharany',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/34916493?s=400&u=e7300b829193270fbcd03a813551a3702299cbb1&v=4'),
              ),
              CircleAvatar(
                radius: 8.5,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 7.5,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamed Alfakharany',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'hello to my messenger application my name is Mohamed Alfakharany',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 7.5,
                        width: 7.5,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '02:30 PM',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
