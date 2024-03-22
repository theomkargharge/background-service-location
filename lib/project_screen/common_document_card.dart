import 'package:flutter/material.dart';

class CommonDocumentCard extends StatelessWidget {
  final title, document;
  const CommonDocumentCard({super.key, required this.title, required this.document});

  @override
  Widget build(BuildContext context) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
          child: Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              alignment: Alignment.center,
              width: 390,
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(20)),
              child:  ListTile(
                contentPadding:
                const EdgeInsets.only(top: 0, left: 29, right: 29),
                leading: const Icon(
                  Icons.photo,
                  color: Colors.green,
                ),

                horizontalTitleGap: 10,
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(document),
                trailing: const Icon(
                  Icons.check,
                  size: 30,
                  color: Colors.blue,
                ),
              )),
        )
      ],
    );
  }
}
