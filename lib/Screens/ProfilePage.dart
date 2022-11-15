
import 'package:flutter/material.dart';

import '../helpers/changeScreen.dart';
import '../widgets/bottomNavigationBar.dart';
import 'HomePage.dart';
import 'PostPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(86, 137, 153, 50),
        title: const Text("Your Profile"),
        elevation: 1,
      ),
      backgroundColor: const Color.fromRGBO(86, 137, 153, 50),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Edit", style: TextStyle(color: Colors.white),),
                    ),
                    onTap: (){},
                  ),
                ],
              ),
              //const SizedBox(height: 50,),
              Container(
                height: 150,
                width: 150,

                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/avatar.png",),
                  radius: 220,
                )
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Biplow Ghimire", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),

              ),
              const Text("Software Developer", style: TextStyle(color: Colors.white),),
              //const SizedBox(height: 50,),
              Container(

                //color: Colors.white,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("AGE:  \n30 years", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("LOCATION:\nSan Francisco, CA", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("ABOUT ME: \nI am a software developer and enterprenuer based out of Bay Area. I specialize in developing multiplatform apps using flutter and dart", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("HOBBIES: \nHiking, Cycling, Surfing, Gaming, Outdoor Adventures", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationWidget(
              onTap: (){
                changeScreen(context, HomePage());
              },
              icon: Icons.feed,
              name: "FEED",
            ),
            BottomNavigationWidget(
              onTap: (){
                changeScreen(context, const PostPage());
              },
              icon: Icons.post_add,
              name: "POST",
            ),
            BottomNavigationWidget(
              onTap: (){
                changeScreenReplacement(context, const ProfilePage());

              },
              icon: Icons.person,
              name: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

