import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedInfoCard extends StatelessWidget {
  final String? title;
  final String? bodyText;
  const DottedInfoCard({Key? key, this.title, this.bodyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        dashPattern: const [3, 4],
        borderType: BorderType.RRect,
        strokeWidth: 1.5,
        radius: const Radius.circular(15),
        color: Colors.black26,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
                child: Text(bodyText ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        height: 1.2, fontSize: 18, color: Colors.black87)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
