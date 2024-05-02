import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_application/MainProvider.dart';
import 'package:my_application/apiCall/ChapterDetailView.dart';
import 'package:provider/provider.dart';
import 'Chapters.dart';

class APICall extends StatefulWidget {
  const APICall({super.key});

  @override
  State<APICall> createState() => _APICallState();
}

class _APICallState extends State<APICall> {

List<Chapters> _chapters = [];
bool _isLoading = true;

  @override
  void initState(){
    onGetData();
    super.initState();
  }

 onGetData() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://bhagavad-gita3.p.rapidapi.com/v2/chapters/',
          options: Options(
        headers: {
          'X-RapidAPI-Key': '787b650d0emshb7cfb406a10f5c2p1a1a25jsn25e89afab858',
          'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
        }
      ));
      response.data.forEach((e) => {
        _chapters.add(Chapters.fromJson(e))
});
_isLoading = false;
setState(() {

});
    } finally {

    }
  }

   String convertToNepaliDigit(String englishDigit) {
    Map<String, String> digitMap = {
      '0': '०',
      '1': '१',
      '2': '२',
      '3': '३',
      '4': '४',
      '5': '५',
      '6': '६',
      '7': '७',
      '8': '८',
      '9': '९',
    };

    return englishDigit.split('').map((digit) {
      return digitMap[digit] ?? digit;
    }).join('');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50,
      elevation: 0,
        title: Text(provider.language == 'en'?'Bhagavad Gita': 'भगवद् गीता', style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.orange
        ),),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              provider.setLanguage(provider.language == 'en'?'ne':'en');
            },
          
          child: Icon(Icons.language)),)],
      ),
      body: 
      _isLoading?
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            CircularProgressIndicator(color: Colors.orange,),
            SizedBox(height: 10,),
            Text('Loading...',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900,
            color: Colors.orange),)],
        )):
            ListView(
                 children: [
              ..._chapters.map((e) => 
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ChapterDetailView(chapter: e,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(bottom: 12,left: 12,right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((provider.language == 'en'? 'Chapter '+e.chapterNumber.toString() : 'अध्याय '  + convertToNepaliDigit(e.chapterNumber.toString())),
                      style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.orange),),
                      Text(
                        provider.language == 'en'?e.nameMeaning ?? '':e.name ??'',
                        style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                      ),
                      Text(provider.language == 'en'?e.chapterSummary??'':e.chapterSummaryHindi ?? ''),
                      Row(
                        children: [
                          Icon(Icons.menu, color: Colors.orange,),
                          Text(' ' +
                                (provider.language =='en'? e.versesCount.toString():
                                convertToNepaliDigit(e.versesCount.toString())) +
                                (provider.language =='en'? ' verse':' पद'), style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange
                      ),)
                        ],
                      )
                      
                    ],
                  ),
                ),
              )
              )
            ],
    ));
  }
}