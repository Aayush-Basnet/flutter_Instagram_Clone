import 'package:flutter/material.dart';
/*
class FullStoryScreen extends StatefulWidget {
   final String image;
  FullStoryScreen({required this.image});

  @override
  State<FullStoryScreen> createState() => _FullStoryScreenState();
}

class _FullStoryScreenState extends State<FullStoryScreen> {
   bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 166, 161, 161).withOpacity(0.5),
                ),
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: (){
                        
                      },
                       icon: Icon(ispressed?Icons.favorite:
                      Icons.favorite_border,
                      color:ispressed?Colors.red: Colors.white,
                      
                    )
                       )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
*/
/*
class FullStoryScreen extends StatelessWidget {
  final String image;
  FullStoryScreen({required this.image});
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 166, 161, 161).withOpacity(0.5),
                ),
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: (){
                        
                      },
                       icon: Icon(ispressed?Icons.favorite:
                      Icons.favorite_border,
                      color:ispressed?Colors.red: Colors.white,
                      
                    )
                       )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class FullStoryScreen extends StatefulWidget {
  final List<String> stories;

  FullStoryScreen({required this.stories});

  @override
  _FullStoryScreenState createState() => _FullStoryScreenState();
}

class _FullStoryScreenState extends State<FullStoryScreen> {
  int currentStoryIndex = 0;
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentStoryIndex = (currentStoryIndex + 1) % widget.stories.length;
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                widget.stories[currentStoryIndex],
                // widget.storyImage,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 166, 161, 161).withOpacity(0.5),
                  ),
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          hintStyle: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              ispressed = !ispressed;
                            });
                          },
                          icon: Icon(
                            ispressed ? Icons.favorite : Icons.favorite_border,
                            color: ispressed ? Colors.red : Colors.white,
                            size: 35,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
