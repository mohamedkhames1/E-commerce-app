import 'package:flutter/material.dart';
import 'rating_progress_indicator.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                title: '5',
                value: 1,
              ),
              TRatingProgressIndicator(
                title: '4',
                value: .7,
              ),
              TRatingProgressIndicator(
                title: '3',
                value: .6,
              ),
              TRatingProgressIndicator(
                title: '2',
                value: .3,
              ),
              TRatingProgressIndicator(
                title: '1',
                value: 0.1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
