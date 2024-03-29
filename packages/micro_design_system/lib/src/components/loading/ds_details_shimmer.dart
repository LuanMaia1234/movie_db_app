import 'package:flutter/material.dart';

import 'ds_shimmer.dart';

class DSDetailsShimmer extends StatelessWidget {
  const DSDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DSShimmer(
          height: 300,
          radius: 0,
        ),
        ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DSShimmer(
                  height: 20,
                  width: 90,
                ),
                SizedBox(height: 10),
                DSShimmer(
                  height: 80,
                ),
                SizedBox(height: 10),
                DSShimmer(
                  height: 20,
                  width: 140,
                ),
                SizedBox(height: 10),
                DSShimmer(
                  height: 20,
                ),
                SizedBox(height: 10),
                DSShimmer(
                  height: 20,
                  width: 90,
                ),
                SizedBox(height: 10),
                DSShimmer(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ],
    );
  }
}
