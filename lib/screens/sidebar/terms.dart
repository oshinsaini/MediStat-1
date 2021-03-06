import 'package:dbapp/shared/terms.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  final List terms = TermsOfUse.termsOfUse;

   Widget guidelineList(bool isMentors) {
    return Expanded(
        child: SizedBox(
            height: 100.0,
            child: ListView.builder(
                itemCount: terms.length,
                itemBuilder: (context, index) {
                  if (isMentors) {
                    return Row(
                      children: [
                        Column(children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_right,
                              size: 30,
                            ),
                          )
                        ]),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            terms[index],
                            style: TextStyle(
                                fontFamily: 'GoogleSans', fontSize: 16),
                          ),
                        ))
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Column(children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_right,
                              size: 30,
                            ),
                          )
                        ]),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            terms[index],
                            style: TextStyle(
                                fontFamily: 'GoogleSans', fontSize: 16),
                          ),
                        ))
                      ],
                    );
                  }
                })));
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32),
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 25),
                    Text("Terms of Use",
                        style: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 32)),
                    
                    guidelineList(true),
])))
    ]));
  }
}
  