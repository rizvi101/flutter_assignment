import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/user.dart';

class InfoSection extends StatelessWidget {
  final User user;
  InfoSection(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.imageUrl),
          radius: 40,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${user.firstName} ${user.lastName}',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Interior Designer by profession. Loves Reading, Travelling and Learning new stuff ',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCustomSection(
                context,
                438,
                'Posts',
              ),
              buildCustomSection(
                context,
                438,
                'Following',
              ),
              buildCustomSection(
                context,
                438,
                'Followers',
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Message',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildCustomSection(BuildContext context, int value, String title) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
