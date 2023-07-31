import 'package:flutter/material.dart';
import 'package:instagram/models/comment_model.dart';
import 'package:instagram/models/post_model.dart';

class ViewPostScreen extends StatefulWidget {
  static final String id = 'view_post_screen';
  final Post post;
  ViewPostScreen({required this.post});

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  bool isPressed = false;
  bool ispressed = false;
  Widget _buildComment(int index) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage(comments[index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          comments[index].authorName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(comments[index].text),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              ispressed = !ispressed;
            });
          },
          icon: Icon(ispressed ? Icons.favorite : Icons.favorite_border),
          iconSize: 26,
          color: ispressed ? Colors.red : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDF0F6),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ListTile(
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
                                        image: AssetImage(
                                            widget.post.authorImageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  widget.post.authorName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.more_vert),
                              iconSize: 26,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        InkWell(
                          onDoubleTap: () => print('Like post'),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            height: 400,
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
                                    image: AssetImage(widget.post.imageUrl),
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
                                        color: isPressed
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                      Text(
                                        widget.post.isLiked,
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {
                                          print('Chat');
                                        },
                                        icon: Icon(Icons.chat),
                                        iconSize: 26,
                                      ),
                                      Text(
                                        widget.post.isCommented,
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
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: <Widget>[
                  _buildComment(0),
                  _buildComment(1),
                  _buildComment(2),
                  _buildComment(3),
                  _buildComment(4),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Write a comment....',
                  prefixIcon: Container(
                    margin: EdgeInsets.all(4),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(widget.post.authorImageUrl),
                          fit: BoxFit.cover,
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Color(0XFF23B66F),
                      onPressed: () => print('Post comment'),
                      child: Icon(
                        Icons.send,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
