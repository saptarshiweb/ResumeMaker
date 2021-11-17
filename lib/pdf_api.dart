import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';


class PdfApi {
  static Future<File> generateCenteredText(String name, String college,
      String email, String phone, String address,List<String> inst,List<String> instdata,
      String technicalexp,String technicaldev,String technicalcourse,String cc,String cf,String git,
      String linked,String leet,List<String> projectname,List<String> projectlink,List<String> projectgit,
      List<String> projectdes,String achieve,int exp,List<String> role,List<String> exporg,List<String> expdes
      ) async {
    final pdf = Document();

    final lato = Font.ttf(await rootBundle.load('assets/Lato-Regular.ttf'));
    final amita = Font.ttf(await rootBundle.load('assets/Amita-Regular.ttf'));
    final red = Font.ttf(await rootBundle.load('assets/Redressed-Regular.ttf'));

    final lat1 = Font.ttf(await rootBundle.load('assets/Lato-Bold.ttf'));
    final lat2 = Font.ttf(await rootBundle.load('assets/Lato-Black.ttf'));

    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => <Widget>[
              page(name, college, email, phone, address, lato, red, amita,inst,instdata,
              technicalexp,technicaldev,technicalcourse,lat1,lat2,cc,cf,git,linked,leet,
              projectname,projectlink,projectgit,projectdes,achieve,exp,role,exporg,expdes),
            ]));

    return saveDocument(name: '${name}_Resume.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  static Widget page(String name, String college, String email, String phone,
      String address, Font lato, Font red, Font amita,List<String> inst,List<String> instdata,
      String technicalexp,String technicaldev,String technicalcourse,
      Font lat1,Font lat2,String cc,String cf,String git,String linked,String leet,

      List<String> projectname,List<String> projectlink,List<String> projectgit,
      List<String> projectdes,String achieve,int exp,List<String> role,List<String> exporg,List<String> expdes
      
      ) {
    return Container(
      child: Column(children: [
        Center(
            child: Text(name.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  fontSize: 23,
                  font: lat2,
                ))),
        Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          Text('$address|P:+$phone|$email',
              style: TextStyle(
                color: PdfColors.black,
                font: lato,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ))
        ])),

         Row(children: [
           SizedBox(width: 140),

          codechef(cc),Text(' |'),codeforces(cf),Text(' |'),github(git),Text(' |'),
          linkedin(linked),Text(' |'),leetcode(leet),Text(' |'),

        ]),

        Header(child: Text('EDUCATION',style: TextStyle(
          color: PdfColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          font: lat2,
        ))),

       ListView.builder(itemBuilder: (context,index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                children: [
                  Text(inst[index].toUpperCase(),style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                font: lat1,
                color: PdfColors.black,
              )),

                ]
              ),
              Row(children: [

                Text(instdata[index],style: TextStyle(
                
                fontSize: 9,
                font: lato,
                color: PdfColors.black,
              )),
              ])

              





            ]
          );

        }, itemCount: inst.length),

        SizedBox(height: 2),

        Header(child: Text('TECHNICAL SKILLS',style: TextStyle(
          color: PdfColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          font: lat2,
        ))),


        Bullet(
            text: 'Experienced: $technicalexp',
            style: TextStyle(
              color: PdfColors.black,
              fontSize: 9,
              font: lat1,
            ),
            textAlign: TextAlign.left,
            bulletSize: 2*PdfPageFormat.mm,

          ),

          Bullet(
            text: 'Development: $technicaldev',
            style: TextStyle(
              color: PdfColors.black,
              fontSize: 9,
              font: lat1,
            ),
            textAlign: TextAlign.left,
            bulletSize: 2*PdfPageFormat.mm,

          ),

          Bullet(
            text: 'CourseWork: $technicalcourse',
            style: TextStyle(
              color: PdfColors.black,
              fontSize: 9,
              font: lat1,
            ),
            textAlign: TextAlign.left,
            bulletSize: 2*PdfPageFormat.mm,

          ),
          SizedBox(height: 2),

          exp!=0?Header(child: Text('EXPERIENCE',style: TextStyle(
          color: PdfColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          font: lat2,
        ))):SizedBox(height: 0),

        exp!=0?ListView.builder(itemBuilder: (context,index){
          return Column(
            children: [

              Row(
                children: [
                  Text(role[index]+'  |  '+exporg[index]+' |',style: TextStyle(

                    color: PdfColors.black,
                    font: lat2,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,


                  )),



                ]
              ),

              distinct(expdes[index], lat1)

            ]
          );

        }, itemCount: exp):SizedBox(height: 2),

        exp!=0?SizedBox(height: 2):SizedBox(height: 0),



        

        


         


        Header(child: Text('PERSONAL PROJECTS  ',style: TextStyle(
          color: PdfColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          font: lat2,
        ))),

        SizedBox(
          height: 2,
        ),

        ListView.builder(itemBuilder: (context,index){

          return Column(
            children: [
              Row(
                children: [

                  Text(projectname[index].toUpperCase(),style: TextStyle(

                    color: PdfColors.black,
                    font: lat2,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,


                  )),
                  Text('   |   '),
                  lin('GitHub', projectgit[index]),
                  Text('  |  '),
                  lin('Live Link',projectlink[index]),
                  Text('  | '),
                ]
              ),

              distinct(projectdes[index], lat1),




            ]
          );
        }, itemCount: projectname.length),


        SizedBox(height: 2.5),


         Header(child: Text('ACHIEVEMENTS  ',style: TextStyle(
          color: PdfColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          font: lat2,
        ))),

        SizedBox(
          height: 2
        ),

        distinct(achieve, lat1),
        SizedBox(height: 2),









        
      ]),
    );
  }

  static Widget lin(String t,String link)=>UrlLink(child: Text(t,style: TextStyle(
    color: PdfColors.blueAccent700,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    
  )), destination: link);

  static Widget codechef(String user)=>UrlLink(child: Text('CodeChef',style: TextStyle(
    color: PdfColors.blueAccent700,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    
  )), destination: 'https://www.codechef.com/users/$user');


  static Widget codeforces(String user)=>UrlLink(child: Text('CodeForces',style: TextStyle(
    color: PdfColors.blueAccent700,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    
  )), destination: 'https://codeforces.com/profile/$user');


  static Widget github(String user)=>UrlLink(child: Text('GitHub',style: TextStyle(
    color: PdfColors.blueAccent700,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    
  )), destination: 'https://github.com/$user');


  static Widget linkedin(String user)=>UrlLink(child: Text('LinkedIn',style: TextStyle(
    color: PdfColors.blueAccent700,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    
  )), destination: user);


  static Widget leetcode(String user)=>UrlLink(child: Text('LeetCode',style: TextStyle(
    color: PdfColors.blueAccent700,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    
  )), destination: 'https://leetcode.com/$user/');


  static Widget distinct(String s,Font lato1)
  {
    List<String> str=[];

    int a=0;

    for(int i=0;i<s.length;i++)
    {
      if(s[i]=='.')
      {
        String temp=s.substring(a,(i+1));
        str.add(temp);
        a=i+1;
      }

    }

    return Column(
      children: [
        ListView.builder(itemBuilder: (context,index){

          return Bullet(
            text: str[index],
            style: TextStyle(
              color: PdfColors.black,
              fontSize: 9,
              font: lato1,
            ),
            textAlign: TextAlign.left,
            bulletSize: 2*PdfPageFormat.mm,

          );
        }, itemCount: str.length)

      ]
    );

  }






}
