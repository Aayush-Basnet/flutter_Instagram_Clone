import 'package:flutter/material.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/screen/full_stories_screen.dart';
import 'package:instagram/screen/view_post_screen.dart';

class FeedScreen extends StatefulWidget {
  static final String id = 'feed_screen';

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _selectedIndex = 0;
  bool isPressed = false;
  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        width: double.infinity,
        height: 560,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 60,
                            width: 60,
                            image: AssetImage(posts[index].authorImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print('profile picture');
                    },
                    title: Text(
                      posts[index].authorName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(posts[index].timeAgo),
                    trailing: IconButton(
                      onPressed: () => print('More'),
                      icon: Icon(Icons.more_vert),
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 5),
                              blurRadius: 8,
                            ),
                          ],
                          image: DecorationImage(
                              image: AssetImage(posts[index].imageUrl),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed = !isPressed;
                                    });
                                  },
                                  icon: Icon(isPressed
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                                  iconSize: 26,
                                  color: isPressed ? Colors.red : Colors.black,
                                ),
                                Text(
                                  posts[index].isLiked,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ViewPostScreen(
                                                  post: posts[index],
                                                )));
                                  },
                                  icon: Icon(Icons.mode_comment_outlined),
                                  iconSize: 26,
                                ),
                                Text(
                                  posts[index].isCommented,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => print('Save post'),
                          icon: Icon(Icons.bookmark_border),
                          iconSize: 26,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Text(
                      "Liked by Abhishek Basnet, Bb and 5k others",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/post0.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment...",
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 28,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => print('Camera'),
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      iconSize: 26,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 35,
                      child: IconButton(
                        onPressed: () => print('Direct Messages'),
                        icon: Icon(
                          Icons.send,
                        ),
                        iconSize: 26,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(
                    width: 10,
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => new FullStoryScreen(stories: stories),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 60,
                    height: 60,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ]),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 60,
                          width: 60,
                          image: AssetImage(stories[index - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildPost(0),
          _buildPost(1),
          _buildPost(2),
          _buildPost(3),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 26,
                color: Colors.black,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 26,
                color: Colors.grey,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color(0xFF23B66F),
                  onPressed: () => print('Upload photo'),
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 26,
                color: Colors.grey,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 26,
                color: Colors.grey,
              ),
              label: ' ',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
