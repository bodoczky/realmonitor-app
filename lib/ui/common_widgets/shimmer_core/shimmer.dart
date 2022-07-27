import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    super.key,
    this.linearGradient,
    this.duration,
    this.min,
    this.max,
    this.child,
  });

  final LinearGradient? linearGradient;
  final Duration? duration;
  final double? min;
  final double? max;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late LinearGradient _linearGradient;
  final List<Color> _listColors = [
    const Color(0xFFEBEBF4),
    const Color(0xFFF4F4F4),
    const Color(0xFFEBEBF4),
  ];
  final List<double> _stops = [
    0.1,
    0.3,
    0.4,
  ];
  final AlignmentGeometry _beginAlignment = const Alignment(-1.0, -0.3);
  final AlignmentGeometry _endAlignment = const Alignment(1.0, 0.3);
  final TileMode _tileMode = TileMode.clamp;

  @override
  void initState() {
    super.initState();

    _linearGradient = LinearGradient(
      colors: _listColors,
      stops: _stops,
      begin: _beginAlignment,
      end: _endAlignment,
      tileMode: _tileMode,
    );

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
          min: widget.min ?? -0.5,
          max: widget.max ?? 1.5,
          period: widget.duration ?? const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => widget.linearGradient == null
      ? LinearGradient(
          colors: _linearGradient.colors,
          stops: _linearGradient.stops,
          begin: _linearGradient.begin,
          end: _linearGradient.end,
          transform:
              _SlidingGradientTransform(slidePercent: _shimmerController.value),
        )
      : LinearGradient(
          colors: widget.linearGradient?.colors ?? _listColors,
          stops: widget.linearGradient?.stops ?? _stops,
          begin: widget.linearGradient?.begin ?? _beginAlignment,
          end: widget.linearGradient?.end ?? _endAlignment,
          transform:
              _SlidingGradientTransform(slidePercent: _shimmerController.value),
        );

  bool get isSized => context.findRenderObject() != null
      ? (context.findRenderObject() as RenderBox).hasSize
      : false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
