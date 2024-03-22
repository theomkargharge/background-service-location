import 'package:flutter/material.dart';

import 'common_document_card.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.keyboard_backspace_rounded,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Documents',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Required following documents to enjoy the journey.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CommonDocumentCard(
            title: 'Driving License',
            document: 'View Lic.',
          ),
          const SizedBox(
            height: 10,
          ),
          const CommonDocumentCard(
            title: 'Vehicle RC',
            document: 'View RC',
          ),
          const SizedBox(
            height: 10,
          ),
          const CommonDocumentCard(
            title: 'Aadhaar Card',
            document: 'View Aadhaar Card',
          ),
          const SizedBox(
            height: 10,
          ),
          const CommonDocumentCard(
            title: 'Pan Card',
            document: 'View  Pan',
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 50,
              width: 376,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
            ),
          ),

          const SizedBox(height: 9,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RichText(text: const TextSpan(
              children: [
                TextSpan(text: 'By clicking submit, you agree to ' , style: TextStyle(fontSize: 12, color: Colors.black)),
                TextSpan(text: 'terms & Conditions ' , style: TextStyle(fontSize: 12, color: Colors.blue, decoration: TextDecoration.underline), ),
                TextSpan(text: 'and ' , style: TextStyle(fontSize: 12, color: Colors.black)),
                TextSpan(text: 'Privacy policy. ' , style: TextStyle(fontSize: 12, color: Colors.blue, decoration: TextDecoration.underline)),
              ]
            )),
          ),
         const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
