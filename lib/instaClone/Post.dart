import 'package:flutter/material.dart';
import 'package:my_application/instaClone/PostData.dart';

class Post extends StatelessWidget {
  final PostData postData;

  Post({Key? key, required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(postData.name ?? ''),
          subtitle: Text(postData.location ?? ''),
          trailing: Icon(Icons.more_horiz),
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(postData.image ?? ''),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
        Image.asset(
          postData.post ?? '',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_outline),
                  SizedBox(width: 10),
                  Icon(Icons.comment),
                  SizedBox(width: 10),
                  Icon(Icons.share),
                ],
              ),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(postData.image ?? ''),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.black),
              ),
            ),
            SizedBox(width: 10),
            RichText(
              text: TextSpan(
                text: 'Liked by ',
                style: TextStyle(fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  if (postData.likedBy != null && postData.likedBy!.isNotEmpty)
                    TextSpan(
                      text: postData.likedBy![0],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (postData.likedBy != null && postData.likedBy!.length > 1) ...[
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: '${postData.likedBy!.length - 1} others',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(
              text: postData.name,
              style: TextStyle(fontWeight: FontWeight.w900),
              children: <TextSpan>[
                TextSpan(text: postData.postTitle ?? '', style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
