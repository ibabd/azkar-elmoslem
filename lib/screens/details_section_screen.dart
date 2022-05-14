import 'dart:convert';

import 'package:azkar_elmoslem/model/section_details_model.dart';
import 'package:flutter/material.dart';
class DetailsSectionScreen extends StatefulWidget {
  final int id;
  final String title;
  const DetailsSectionScreen({Key? key,required this.id,required this.title}) : super(key: key);

  @override
  State<DetailsSectionScreen> createState() => _DetailsSectionScreenState();
}

class _DetailsSectionScreenState extends State<DetailsSectionScreen> {
  List<SectionDetailsModel>sectionsDetails=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.withOpacity(.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0 , 3),
                      )
                    ]
                ),
                child: ListTile(
                  title: Text('${sectionsDetails[index].reference}',textDirection: TextDirection.rtl,),
                  subtitle:Text('${sectionsDetails[index].content}',textDirection: TextDirection.rtl,style: const TextStyle(fontSize: 20),) ,
                ),
              );
            },
            separatorBuilder: (context,index)=>Divider(height: 1,color: Colors.grey.withOpacity(.8)),
            itemCount: sectionsDetails.length
        ),
      ),
    );
  }
  loadSectionDetails()async {
    //List<SectionDetailsModel>sectionsDetails=[];
    DefaultAssetBundle.of(context).loadString('assets/database/details_sections.json').then((data){
      var response=jsonDecode(data);
      // print(response);
      response.forEach((section){
        // print(response['name']);
        SectionDetailsModel sectionDetailsModel=SectionDetailsModel.fromJson(section );

        if(sectionDetailsModel.section_id==widget.id){
          sectionsDetails.add(sectionDetailsModel);
        }

      });
      setState(() {});
    }).catchError((onError){
      print(onError.toString());
    });
  }
}
