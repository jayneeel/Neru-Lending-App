import "package:flutter/material.dart";

class CounterBalanceText extends StatefulWidget {
  final double begin;
  final double end;
  final int precision;
  final Curve curve;
  final Duration duration;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final String? separator;
  final String? prefix;
  final String? suffix;

  const CounterBalanceText({
    super.key,
    required this.begin,
    required this.end,
    this.precision = 0,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 250),
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.separator,
    this.prefix = "",
    this.suffix = "",
  });

  @override
  State<CounterBalanceText> createState() => _CounterBalanceTextState();
}

class _CounterBalanceTextState extends State<CounterBalanceText> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  double? _latestBegin;
  double? _latestEnd;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _latestBegin = widget.begin;
    _latestEnd = widget.end;
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation curvedAnimation =
    CurvedAnimation(parent: _controller!, curve: widget.curve);
    _animation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(curvedAnimation);

    if (widget.begin != _latestBegin || widget.end != _latestEnd) {
      _controller?.reset();
    }

    _latestBegin = widget.begin;
    _latestEnd = widget.end;
    _controller?.forward();

    return _CounterAnimatedText(
      key: UniqueKey(),
      animation: _animation!,
      precision: widget.precision,
      style: widget.style,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      separator: widget.separator,
      prefix: widget.prefix,
      suffix: widget.suffix,
    );
  }
}

class _CounterAnimatedText extends AnimatedWidget {
  final RegExp reg = RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))");

  final Animation<double> animation;
  final int precision;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final String? separator;
  final String? prefix;
  final String? suffix;

  _CounterAnimatedText({
    super.key,
    required this.animation,
    required this.precision,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.separator,
    this.prefix,
    this.suffix,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) => Text(
    separator != null
        ? (prefix ?? "") +
        animation
            .value
            .toStringAsFixed(precision)
            .replaceAllMapped(
            reg, (Match match) => "${match[1]}$separator") +
        (suffix ?? "")
        : (prefix ?? "") +
        animation.value.toStringAsFixed(precision) +
        (suffix ?? ""),
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
  );
}