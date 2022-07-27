import 'package:flutter/material.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/shimmer_core/shimmer.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/shimmer_core/shimmer_loading.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/results/results_shimmer/result_card_shimmer.dart';

class ResultsScreenShimmer extends StatelessWidget {
  const ResultsScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              kToolbarHeight,
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeaderShimmerBlock(context),
                _buildResultsShimmerBlock(),
                const ResultCardShimmer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsShimmerBlock() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: const Alignment(-0.9, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ShimmerLoading(
            isLoading: true,
            child: Container(
              height: 20,
              width: 100,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderShimmerBlock(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Align(
            alignment: const Alignment(-0.35, 0),
            child: ShimmerLoading(
              isLoading: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 20,
                  width: 130,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.4, 0),
          child: Transform.translate(
            offset: const Offset(0, -5),
            child: ShimmerLoading(
              isLoading: true,
              child: ClipOval(
                child: Container(
                  width: 55,
                  height: 55,
                  decoration:
                      const BoxDecoration(color: Colors.black, boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                    )
                  ]),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
