import 'package:flutter/material.dart';
import 'package:flutter_assignment/Screens/posts_screen.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:flutter_assignment/services/controller.dart';
import 'package:flutter_assignment/widgets/profile_info_section.dart';
import 'package:flutter_assignment/widgets/profile_photos_grid.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  User _user;
  Future fetchUser() async {
    try {
      isLoading = true;
      setState(() {});
      Api userApi = Api();
      var user = await userApi.getUsers();
      _user = user;
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
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return PostsScreen();
              }));
            },
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    InfoSection(_user),
                    SizedBox(height: 16),
                    buildPhotoSectionHeading(context),
                    SizedBox(height: 16),
                    PhotosGrid(),
                  ],
                ),
              ),
            ),
    );
  }

  Row buildPhotoSectionHeading(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Photos',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Icon(
          Icons.category,
          color: Colors.grey,
          size: 28,
        ),
        SizedBox(
          width: 12,
        ),
        Icon(
          Icons.grid_view,
          color: Colors.grey,
          size: 28,
        ),
      ],
    );
  }
}
