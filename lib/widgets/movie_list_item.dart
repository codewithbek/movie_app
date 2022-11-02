import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.information,
  });

  final String name;
  final String imageUrl;
  final String information;
  final GlobalKey backgroudImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(children: [
            Flow(
                delegate: _ParallaxFlowDelegate(
                    backgroudImageKey: backgroudImageKey,
                    listItemContext: context,
                    scrollable: Scrollable.of(context)!),
                children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    key: backgroudImageKey,
                    fit: BoxFit.cover,
                  ),
                ]),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.6, 0.95]),
                ),
              ),
            ),
            Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(information,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroudImageKey;

  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroudImageKey,
  }) : super(repaint: scrollable.position);
  BoxConstraints getConstraitsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;

    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    final viewPortDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewPortDimension).clamp(0.0, 1.0);

    final verticalAligment = Alignment(0.0, scrollFraction * 2 - 1);
    final backgroudSize =
        (backgroudImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;

    final listItemSize = context.size;
    final childRect = verticalAligment.inscribe(
      backgroudSize,
      Offset.zero & listItemSize,
    );
    // Paint the backgroud

    context.paintChild(0,
        transform:
            Transform.translate(offset: Offset(0.0, childRect.top)).transform);
  }

  @override
  bool shouldRepaint(covariant _ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroudImageKey != oldDelegate.backgroudImageKey;
  }
}
