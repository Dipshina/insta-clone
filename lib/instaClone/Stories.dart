import 'package:flutter/material.dart';
import 'package:my_application/instaClone/StoriesData.dart';
import 'package:my_application/instaClone/data.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  List<StoriesData> _storiesData = [];

  @override
  void initState() {
    //TODO: implement initState
    STORIES.forEach((e) => _storiesData.add(StoriesData.fromJson(e)));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._storiesData.map((e) => Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage(e.image ?? ''),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.black),
                    ),
                    child: (e?.isMyStory ?? false)
                        ? Stack(
                            children: [
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ),
                  Text(e.name ?? ''),
                ],
              )).toList(),
        ],
      ),
    );
  }
}
