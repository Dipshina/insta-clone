import 'package:flutter/material.dart';
import 'package:my_application/MainProvider.dart';
import 'package:my_application/instaClone/MessagingView.dart';
import 'package:my_application/instaClone/Stories.dart';
import 'package:my_application/instaClone/Post.dart';
import 'package:my_application/instaClone/PostData.dart';
import 'package:my_application/instaClone/data.dart';
import 'package:provider/provider.dart';


class Insta extends StatefulWidget {
  const Insta({super.key});

  @override
  State<Insta> createState() => _InstaState();
}

class _InstaState extends State<Insta> {
  List<PostData> _postData=[];

  @override
  void initState() {
    // TODO: implement initState
    POSTS.forEach((e) =>
     _postData.add(PostData.fromJson(e)));
    setState(() {


    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          actions: [
            Switch(
              value: ThemeMode.dark == mainProvider.themeMode,
              activeColor: mainProvider.themeMode == ThemeMode.dark
              ? Colors.white
              :Colors.black,
              onChanged: (bool value){
                mainProvider.setThemeMode(
                  mainProvider.themeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.favorite_outline),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => const MessagingView()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Icon(Icons.messenger_outline_rounded),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Stories(),

            ..._postData.map((e) =>
            Post(postData: e,)
            ).toList()

            
          ],
        ));
  }
}