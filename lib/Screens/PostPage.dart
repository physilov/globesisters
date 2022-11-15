import 'package:flutter/material.dart';
import 'package:globesisters/Screens/ProfilePage.dart';
import 'package:globesisters/helpers/changeScreen.dart';
import 'package:globesisters/widgets/bottomNavigationBar.dart';

import 'HomePage.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  //text editing controller
  final _feedNameController = TextEditingController();

//list of cities to be updated by user
  final List<String> _post = <String>["California", "Texas", "San Diego"];

  final _formKey = GlobalKey<FormState>();


//function to add input text to list and update UI accordingly
  void addItemToList(){
    setState(() {
      _post.insert(0, _feedNameController.text);
    });
  }

  //to dispose the controller after the widget is destroyed
  @override
  void dispose(){
    _feedNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(86, 137, 153, 50),
        title: const Text("GlobeSisters"),
        elevation: 1,
      ),
      backgroundColor: const Color.fromRGBO(86, 137, 153, 50),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text("Your Posts", style: TextStyle(color: Colors.white, fontSize: 18, ),),
            ),
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemBuilder: (BuildContext context, index)  {
                      return Card(
                        margin: const EdgeInsets.all(1),
                        child: ListTile(
                          title: Text(_post[index]),
                          trailing: const Icon(Icons.more_horiz),

                        ),
                      );
                    },
                  itemCount: _post.length,

                    )
            ),
            Form(
              key: _formKey,
              child: Container(
                color: Colors.white,
                child: Column(

                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ADD TO YOUR POST", style: TextStyle(fontSize: 20) ,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller: _feedNameController,
                        decoration: const InputDecoration(
                          hintText: "Write the name for your post",
                          labelText: "NAME",
                          labelStyle: TextStyle(color: Colors.white),
                        ),


                      ),
                    ),


                    //const SizedBox(height: 30,),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),


                      ),
                      onPressed: () async {
                        addItemToList();

                      },
                      child: const Text("Submit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            ),



          ],
        )
      ),

      //bottom navigation bar
      bottomNavigationBar: Container(
        height: 70,
        color: const Color.fromRGBO(86, 137, 153, 50),
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
                changeScreenReplacement(context, const PostPage());

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
