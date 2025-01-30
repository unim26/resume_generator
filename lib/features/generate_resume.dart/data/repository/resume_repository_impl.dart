import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:resumegenerator/config/theme/pdf_pages_theme/pdf_page_theme.dart';
import 'package:resumegenerator/features/generate_resume.dart/domain/repository/resume_repository.dart';
import 'package:resumegenerator/features/generate_resume.dart/presentation/widgets/project_block.dart';

import '../../presentation/widgets/block.dart';
import '../../presentation/widgets/category.dart';
import '../../presentation/widgets/url_text.dart';

class ResumeRepositoryImpl implements ResumeRepository{
  @override
  Future<Uint8List> generateResume() async{

  final doc = pw.Document(title: 'My Resume', author: 'Abhishek kumar');
  final pageTheme = await pdfPageTheme();

   doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partition(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              //for user basic info
              pw.Container(
                padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    //user name
                    pw.Text(
                      'Abhishek Kumar',
                      textScaleFactor: 2,
                      style: pw.Theme.of(context).defaultTextStyle.copyWith(
                            fontWeight: pw.FontWeight.bold,
                          ),
                    ),
                    //space
                    pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),

                    //user address and contact detain
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        //for user address
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: <pw.Widget>[
                            //user address
                            pw.Text('Maner, patna,Bihar'),
                            pw.Text('Patna,Bihar-801108'),
                            // pw.Text('Canada, ON'),
                          ],
                        ),

                        //for user contact information
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: <pw.Widget>[
                            //user contact number
                            pw.Text('+91 9341307595'),

                            //user contact email
                            pw.Text('aniketsagar4323@gmail.com'),

                            //linked In
                            UrlText("LinkedIn",
                                "https://www.linkedin.com/in/abhishek-kumar-3b6b84258/"),

                            //github
                            UrlText("GitHub",
                                "https://github.com/unim26?tab=repository"),
                          ],
                        ),
                        pw.Padding(padding: pw.EdgeInsets.zero)
                      ],
                    ),
                  ],
                ),
              ),

              //user education detail
              Category(title: 'Education'),

              //user high school detail
              Block(
                title: 'High school',
                level: "",
                institutename: "Pragatishil high school,Arwal",
                startedin: "2020",
                completedin: "2021",
              ),

              pw.SizedBox(height: 10),

              //user high school detail
              Block(
                title: 'Senior Secondary',
                level: "",
                institutename: "B.S. college,patna",
                startedin: "2021",
                completedin: "2023",
              ),
              pw.SizedBox(height: 20),

              // //user skills detail
              Category(title: "Skills"),

              //flutter skill
              Block(
                title: "Flutter",
                level: "Intermediate",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //dart skill
              Block(
                title: "Dart",
                level: "Intermediate",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //nodejs skill
              Block(
                title: "NodeJs",
                level: "Intermediate",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //javascript skill
              Block(
                title: "JavaScript",
                level: "Basic",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //firbase skill
              Block(
                title: "Firebase",
                level: "Intermediate",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //supabase skill
              Block(
                title: "Supabase",
                level: "Basic",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //mongodb skill
              Block(
                title: "Mongodb",
                level: "Intermediate",
                completedin: "",
                institutename: "",
                startedin: "",
              ),
              //restapi skill
              Block(
                title: "RestApi",
                level: "Intermediate",
                completedin: "",
                institutename: "",
                startedin: "",
              ),

              // Experience
              Category(title: "Experience"),

              //first project
              ProjectBlock(
                title:
                    "BlogSpot | Personal Project | (Flutter, NodeJs, Mongodb, Bloc)",
                githublink: "&https://github.com/unim26/blogspot_backend",
                appstorelink: "",
                description:
                    "Developed a blogging platform where users can post articles with thumbnails.\nImplemented authentication using Node.js and MongoDB.\nDesigned a responsive UI in Flutter.",
              ),

              //project
              ProjectBlock(
                title:
                    "ToneLab – Frequency Generator | Personal Project | (Flutter, Audio Processing)",
                githublink: "https://github.com/unim26/ToneLab",
                appstorelink: "https://www.amazon.com/gp/product/B0DMMLR9ZZ",
                description:
                    "Developed an audio frequency generator for sound testing and experiments.\nIntegrated waveform visualization and custom equalizer settings.",
              ),

              //project
              ProjectBlock(
                title:
                    "AI Chatbot | Personal Project | (Flutter, Gemini AI API)",
                githublink: "https://github.com/unim26/AiChatBot",
                appstorelink: "https://www.amazon.com/gp/product/B0DGH1JY2S",
                description:
                    "Build a Ai chat bot by intigrating Gemini Ai Api\nDeveloped a Flutter-based chat UI with a modern and intuitive design.\nImplemented real-time text-based interactions with seamless API communication",
              ),

              //project
              ProjectBlock(
                title:
                    "Stopwatch App | Personal Project | (Flutter, Dart, Bloc)",
                githublink: "https://github.com/unim26/stopwatchSMP",
                appstorelink: "",
                description:
                    "Created a minimalist stopwatch with lap timing and animation effects.\nOptimized performance for low battery consumption.",
              ),

              //project
              ProjectBlock(
                title: "To-Do App | Personal Project | (Flutter, Provider)",
                githublink: "https://github.com/unim26/todo_app_with_provider",
                appstorelink: "",
                description: "Designed a task manager app.",
              ),
            ],
          ),
        ),
      ],
    ),
  );
  return doc.save();
}


    
  
}