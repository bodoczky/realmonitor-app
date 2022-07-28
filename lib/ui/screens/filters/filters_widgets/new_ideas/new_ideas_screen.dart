import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/new_ideas/new_idea1.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/new_ideas/new_idea2.dart';

class NewIdeasScreen extends StatelessWidget {
  final FilterModel model;
  const NewIdeasScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Material(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            NewIdea1(model: model),
            const NewIdea2(),
            Container(
              color: Colors.black,
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      "to be continued...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: const [
                          BackButton(
                            color: Colors.white24,
                          ),
                          Text(
                            "Vissza",
                            style: TextStyle(color: Colors.white24),
                          )
                        ],
                      ))
                ],
              ),
            )
            // NewIdea1(model: model),
          ],
        ),
      ),
    );
  }
}
