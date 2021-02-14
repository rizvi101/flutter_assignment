import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/post.dart';

class ListViewItem extends StatelessWidget {
  final List<Post> _posts;
  final int index;
  ListViewItem(this._posts, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Kristin Jones',
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text('20 Minutes ago'),
            trailing: Icon(
              Icons.more_horiz,
            ),
          ),
          ListTile(
            leading: Column(
              children: [
                Icon(
                  Icons.chat_bubble_outline_outlined,
                  size: 40,
                ),
                Text('254'),
              ],
            ),
            title: Text(
              _posts[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: Column(
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Colors.pink,
                  size: 40,
                ),
                Text('254'),
              ],
            ),
            title: Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
