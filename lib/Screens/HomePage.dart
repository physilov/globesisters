
import 'package:flutter/material.dart';

import '../helpers/changeScreen.dart';
import '../widgets/bottomNavigationBar.dart';
import 'PostPage.dart';
import 'ProfilePage.dart';

class HomePage extends StatelessWidget {


  //list of network images
  final List images =[
    "https://cdn.pixabay.com/photo/2022/11/13/20/29/town-7590138_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/02/01/06/12/living-room-4809587_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664222_1280.jpg",
    "https://cdn.pixabay.com/photo/2018/04/25/18/51/furniture-3350268_1280.jpg",
    "https://cdn.pixabay.com/photo/2018/06/26/08/56/bedroom-3498911_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/02/01/06/12/living-room-4809587_1280.jpg",
   ];

  HomePage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(86, 137, 153, 50),
        title: const Text("GlobeSisters"),
        elevation: 1,
      ),
      backgroundColor: const Color.fromRGBO(86, 137, 153, 50),
      body: SafeArea(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Couch Surfing \n   Made Easy", style: TextStyle(color: Colors.white, fontSize: 30, fontStyle: FontStyle.italic),),
                ),
                Expanded(

                  //List view builder to build list with all the images in list
                  child: ListView.builder(
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Card(
                              shape:Border.all(width: 1, ),
                              elevation: 10,
                              color: Colors.white,
                              child: Image.network(images[index])),
                        );
                      },
                    itemCount: images.length,
                  ),
                ),
              ],
            )),
      ),

      //bottom navigation bar
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationWidget(
              onTap: (){
                changeScreenReplacement(context, HomePage());

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
                changeScreen(context, const ProfilePage());
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

