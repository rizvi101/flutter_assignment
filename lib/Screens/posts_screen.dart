import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/post.dart';
import 'package:flutter_assignment/services/controller.dart';
import 'package:flutter_assignment/widgets/posts_listview_item.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Post> _posts = List<Post>();
  bool isLoading = false;

  Future fetchPosts() async {
    try {
      isLoading = true;
      setState(() {});
      Api postApi = Api();

      var posts = await postApi.getPosts();
      _posts = posts;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Explore'),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(itemBuilder: (BuildContext context, index) {
              return ListViewItem(_posts, index);
            }),
    );
  }
}
