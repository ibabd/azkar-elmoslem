// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:azkar_elmoslem/model/section_model.dart';
import 'package:azkar_elmoslem/screens/details_section_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel>sections=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'أذكار المسلم ',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount:sections.length ,
            itemBuilder: (context,index){
            return    buildSectionItem(sections[index]);
            }
        ),
      ),
    );
  }

  Widget buildSectionItem( SectionModel sectionModel){
    return  InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailsSectionScreen( id: sectionModel.id!, title: sectionModel.name!,)));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        width: double.infinity,
        height: 100,

       decoration:  BoxDecoration(
           borderRadius: BorderRadius.circular(12.0),
         gradient: const LinearGradient(
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
             colors: [
               Colors.lightGreenAccent,
               Colors.green,
               Colors.lightGreen
             ])),


        child:  Center(
          child: Text(
            sectionModel.name!,
            style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

   loadSections()async {
    DefaultAssetBundle.of(context).loadString('assets/database/sections_database.json').then((data){
      var response=jsonDecode(data);
     // print(response);
      response.forEach((section){
        // print(response['name']);
        SectionModel sectionModel=SectionModel.fromJJson(section );
        print(sectionModel.name);
        sections.add(sectionModel);
      });
      setState(() {});
    }).catchError((onError){
      print(onError.toString());
    });
  }
}
