import 'package:pdf/widgets.dart' as pw;

import '../../../../core/constants/constants.dart';
import 'url_text.dart';


class ProjectBlock extends pw.StatelessWidget {
  ProjectBlock({
    required this.title,
    required this.githublink,
    this.appstorelink,
    this.description,
  });

  final String title;
  final String githublink;
  final String? description;
  final String? appstorelink;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Container(
                width: 6,
                height: 6,
                margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                decoration: const pw.BoxDecoration(
                  color: green,
                  shape: pw.BoxShape.circle,
                ),
              ),
              pw.Text(title,
                  style: pw.Theme.of(context).defaultTextStyle.copyWith(
                        fontWeight: pw.FontWeight.bold,
                      )),
              pw.Spacer(),
              // if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
            ]),
        pw.Container(
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              left: pw.BorderSide(
                color: green,
                width: 2,
              ),
            ),
          ),
          padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const pw.EdgeInsets.only(left: 5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              //description
              pw.Text(description!),

              //space
              pw.SizedBox(height: 5),
              //github link
              githublink.isNotEmpty
                  ? githublink.contains('&')
                      ? pw.Column(children: [
                          UrlText(
                              "Github Repo. (Frontent) : ${githublink.split('&')[0]}",
                              githublink.split('&')[0]),
                          UrlText(
                              "Github Repo. (Backend) : ${githublink.split('&')[1]}",
                              githublink.split('&')[1]),
                        ])
                      : UrlText("Github Repo. link : $githublink", githublink)
                  : pw.Text(""),
              //app store link
              appstorelink!.isNotEmpty
                  ? pw.Text("Amazon appstore link : $appstorelink")
                  : pw.Text(""),
            ],
          ),
        ),
      ],
    );
  }
}