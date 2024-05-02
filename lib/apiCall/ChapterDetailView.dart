import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_application/MainProvider.dart';
import 'package:my_application/apiCall/Chapters.dart';
import 'package:my_application/apiCall/Verse.dart';
import 'package:provider/provider.dart';
import '../MainProvider.dart';

class ChapterDetailView extends StatefulWidget {
  Chapters chapter;
  ChapterDetailView({super.key, required this.chapter});

  @override
  State<ChapterDetailView> createState() => _ChapterDetailViewState();
}

class _ChapterDetailViewState extends State<ChapterDetailView> {
  List<Verse> _verse = [];
  @override
  void initState() {
    onGetData();
    super.initState();
  }

  onGetData() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/${widget.chapter.chapterNumber}/verses/',
          options: Options(headers: {
            'X-RapidAPI-Key':
                '787b650d0emshb7cfb406a10f5c2p1a1a25jsn25e89afab858',
            'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
          }));
      response.data.forEach((e) => {_verse.add(Verse.fromJson(e))});
      setState(() {});
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Scaffold(
        backgroundColor: Colors.orange.shade50,
        appBar: AppBar(
          backgroundColor: Colors.orange.shade50,
          elevation: 0,
          title: Text(
            provider.language == 'en' ? 'Bhagavad Gita' : 'भगवद् गीता',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.orange),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    provider
                        .setLanguage(provider.language == 'en' ? 'ne' : 'en');
                  },
                  child: Icon(Icons.language)),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(children: [
                Text(
                  'Chapter ${widget.chapter.chapterNumber}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange),
                ),
                Text(
                  ' ${widget.chapter.name}',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  ' ${widget.chapter.chapterSummaryHindi}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Text(
                  ' ${widget.chapter.chapterSummary}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
              ]),
            ),
            ..._verse.map((e) => 
            InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context, 
                  isScrollControlled: true,
                builder: (BuildContext context){
                  return ListView(
                    children: [
                      SizedBox(height:60 ,),
                      Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text('Verse ${e.verseNumber}', style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.orange
                                    ),),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(Icons.close),
                                )
                              ],
                            ),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 16), 
                            child: Divider(),),
                            Text('Translations', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.orange
                            ),),
                            ...e.translations!.map((t) => Text(t.description ?? '', style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown
                            ),)).toList(),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Divider(),
                            ),
                             Text('Commentaries', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.orange
                            ),),
                            ...e.commentaries!.map((t) => Text(t.description ?? '', style: TextStyle(
                              fontSize: 20,
                              color: Colors.deepOrange
                            ),)).toList(),
                          ],
                        ),
                      ),
                    ],
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Verse ${e.verseNumber}',style: TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 20, color: Colors.orange
                    ),),
                    Text(e.text ?? '', style: TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.brown
                    ),),
                  ],
                )),
            ))
          ],
        ));
  }
}