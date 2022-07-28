import 'package:flutter/material.dart';

class NewIdea2 extends StatelessWidget {
  const NewIdea2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 400,
                  //width: 300,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Stack(children: [
                      Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        color: Colors.white,
                        child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text("Notifications")),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: constraints.maxHeight - 50,
                          color: Colors.grey[100],
                        ),
                      )
                    ]);
                  }),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 320,
          left: -110,
          child: Transform.rotate(
            angle: 1,
            child: const Text(
              "Under construction\n              🏗             .",
              style: TextStyle(
                  backgroundColor: Colors.black87,
                  color: Colors.amberAccent,
                  fontSize: 70),
            ),
          ),
        )
      ],
    );
  }
}
