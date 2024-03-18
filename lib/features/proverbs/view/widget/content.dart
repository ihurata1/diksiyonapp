// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:flutter/material.dart';

class ProverbContentPage extends StatelessWidget {
  final ProverbModel proverb;
  List<String>? meanings;
  ProverbContentPage(this.proverb, {super.key}) {
    meanings = proverb.getMeanings();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: proverb.id!.toString(),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 8,
              color: MatchingColors.dark3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              splashRadius: 15,
                              icon: Icon(
                                Icons.clear,
                                color: MatchingColors.light,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Expanded(
                            child: Card(
                              elevation: 11,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              color: MatchingColors.dark2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  proverb.getProverb(),
                                  style: TextStyle(color: MatchingColors.light, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          )
                        ],
                      ),
                      for (int i = 0; i < meanings!.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            elevation: 8,
                            color: MatchingColors.dark2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                meanings![i],
                                style: TextStyle(color: MatchingColors.light),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
