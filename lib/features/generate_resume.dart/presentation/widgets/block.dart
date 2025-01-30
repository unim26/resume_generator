
import 'package:pdf/widgets.dart' as pw;

import '../../../../core/constants/constants.dart';


class Block extends pw.StatelessWidget {
  Block({
    required this.title,
    this.level,
    this.institutename,
    this.startedin,
    this.completedin,
  });

  final String title;
  final String? level;
  final String? institutename;
  final String? startedin;
  final String? completedin;

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
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontWeight: pw.FontWeight.bold)),
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
              level!.isNotEmpty ? pw.Text("Level : $level") : pw.Text(""),
              institutename!.isNotEmpty ? pw.Text(institutename!) : pw.Text(""),
              startedin!.isNotEmpty
                  ? pw.Text("StartedIn : $startedin")
                  : pw.Text(""),
              completedin!.isNotEmpty
                  ? pw.Text("CompletedIn : $completedin")
                  : pw.Text(""),
            ],
          ),
        ),
      ],
    );
  }
}
