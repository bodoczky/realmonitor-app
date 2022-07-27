import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/shimmer_core/shimmer.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/shimmer_core/shimmer_loading.dart';

class ResultCardShimmer extends StatelessWidget {
  const ResultCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 10)),
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 0,
              offset: const Offset(0, -10)),
        ]),
        child: Column(
          children: [_buildPictureArea(), _buildInfoArea(context)],
        ),
      ),
    );
  }

  Widget _buildPictureArea() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Container(
            color: Colors.grey[50],
            height: 250,
          ),
        ),
        Positioned.fill(
          child: Container(
              color: Colors.transparent,
              child: const Center(
                  child: ShimmerLoading(
                isLoading: true,
                child: FaIcon(
                  FontAwesomeIcons.images,
                  size: 60,
                  color: Colors.grey,
                ),
              ))),
        ),
        Positioned(
            top: 12,
            left: 12,
            child: ShimmerLoading(
              isLoading: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 80,
                  height: 22,
                  color: Colors.black,
                ),
              ),
            )),
        Positioned(
            top: 12,
            right: 12,
            child: ShimmerLoading(
              isLoading: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 40,
                  height: 22,
                  color: Colors.black,
                ),
              ),
            )),
        Positioned(
            bottom: 12,
            right: 12,
            child: ShimmerLoading(
              isLoading: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 90,
                  height: 22,
                  color: Colors.black,
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildInfoArea(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _buildPriceAndAreaRow(context),
            _buildLocationAndDetailsRow(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                color: Colors.black12,
                height: 2,
              ),
            ),
            _buildSourceAndControlsRow(),
          ],
        ),
      ),
    );
  }

  Padding _buildSourceAndControlsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black54,
                  ),
                  width: 40,
                  height: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black54,
                  ),
                  width: 140,
                  height: 18,
                ),
              ),
            ],
          ),
          ShimmerLoading(
            isLoading: true,
            child: Row(
              children: const [
                FaIcon(
                  Icons.delete,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildLocationAndDetailsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black,
                  ),
                  width: 70,
                  height: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black54,
                  ),
                  width: 140,
                  height: 24,
                ),
              ),
            ],
          ),
          ShimmerLoading(
            isLoading: true,
            child: Row(
              children: const [
                FaIcon(
                  Icons.subject,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildPriceAndAreaRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Shimmer(
        min: -1.5,
        duration: const Duration(seconds: 2),
        linearGradient: const LinearGradient(colors: [
          Colors.grey,
          Colors.white54,
          Colors.grey,
        ], stops: [
          0,
          0.5,
          1
        ]),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff3f6fb)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ShimmerLoading(
                      isLoading: true,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                        width: MediaQuery.of(context).size.width / 3.5,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: Text(
                        "m Ft",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                          ),
                          width: MediaQuery.of(context).size.width / 9,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: Text(
                        "m²",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
