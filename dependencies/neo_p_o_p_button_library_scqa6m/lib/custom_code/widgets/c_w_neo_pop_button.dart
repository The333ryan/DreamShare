// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/neopop.dart';

class CWNeoPopButton extends StatefulWidget {
  const CWNeoPopButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.bgColor,
    this.disabled = false,
    this.fontSize,
    this.textColor = Colors.white,
    this.onTapUp,
    this.shimmerEnabled = false,
    this.buttonPosition = "fullBottom",
    this.disabledColor = const Color(0xFF8A8A8A),
    this.parentColor = Colors.transparent,
    this.grandparentColor = Colors.transparent,
    this.animationDurationMs = 250,
    this.forwardDurationMs,
    this.reverseDurationMs,
    this.depth = 3.0,
    this.shadowColor,
    this.rightShadowColor,
    this.leftShadowColor,
    this.topShadowColor,
    this.bottomShadowColor,
    this.onTapDown,
    this.onLongPress,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.5,
    this.isTiltedLeft = false,
    this.shimmerWidth = 10,
    this.shimmerGapWidth = 5,
    this.shimmerColor = const Color.fromRGBO(255, 248, 229, 0.5),
    this.durationMs = 2000,
    this.delayMs = 2000,
  });

  final double? width;
  final double? height;

  /// Button Text
  final String text;

  /// Button fontSize
  final double? fontSize;

  /// Button Text Color
  final Color? textColor;

  /// The color of the button.
  ///
  /// If the shadow colors are not specified, they will be derived from the
  /// [color] parameter.
  final Color bgColor;

  /// The color of the button when it is disabled.
  ///
  /// By default, the disabled color is set to [Color.fromRGBO(138, 138, 138, 1)].
  final Color? disabledColor;

  /// The color of the parent widget.
  ///
  /// It is used to derive the shadow colors. If not specified, it will be
  /// derived from the [color] or [shadowColor] parameter.
  ///
  /// By default, the parent color is set to [Colors.transparent].
  final Color? parentColor;

  /// The color of the grandparent widget.
  ///
  /// It is used to derive the shadow colors. If not specified, it will be
  /// derived from the [color] or [shadowColor] parameter.
  ///
  /// By default, the grandparent color is set to [Colors.transparent].
  final Color? grandparentColor;

  /// The position of the button in the layout.
  ///
  /// By default, the button position is [fullBottom].
  final String? buttonPosition;

  /// The combined duration of the forward and reverse animation in milliseconds
  /// when the button is pressed.
  /// forwardDurationMs = animationDurationMs ~/ 2
  /// reverseDurationMs = animationDurationMs ~/ 2
  ///
  /// The default value is 250.0 milliseconds.
  ///
  /// In the case when different durations are needed, use the [forwardDurationMs] and
  /// [reverseDurationMs] parameters.
  final int? animationDurationMs;

  /// Forward duration for button pressed animation
  final int? forwardDurationMs;

  /// Reverse duration for button pressed animation
  final int? reverseDurationMs;

  /// The depth of the button.
  ///
  /// By default, the depth is set to 3.
  final double? depth;

  /// If set to true, the button will be disabled.
  final bool disabled;

  /// The base color of the shadow. The shadow colors will be derived from this.
  final Color? shadowColor;

  /// The color of the right shadow.
  final Color? rightShadowColor;

  /// The color of the left shadow.
  final Color? leftShadowColor;

  /// The color of the top shadow.
  final Color? topShadowColor;

  /// The color of the bottom shadow.
  final Color? bottomShadowColor;

  /// A pointer that will trigger a tap with a neopop button has stopped
  /// contacting the screen at a particular location.
  ///
  /// This is called after [onTapDown] is called.
  ///
  /// If [onTapUp] is null, the button will be disabled.
  final Future Function()? onTapUp;

  /// A pointer that might cause a tap with a neopop button has contacted the
  /// screen at a particular location.
  ///
  /// This is called after a short timeout, even if the winning gesture has not
  /// yet been selected. If the tap gesture wins, [onTapUp] will be called.
  final Future Function()? onTapDown;

  /// Called when a long press gesture with a neopop button has been recognized.
  ///
  /// Triggered when a pointer has remained in contact with the screen at the
  /// same location for a long period of time.
  final Future Function()? onLongPress;

  /// Button Border Color
  final Color? borderColor;

  /// Button Border Width
  final double? borderWidth;

  /// The shimmer is enabled or disabled.
  ///
  /// By default the shimmer is disabled.
  final bool? shimmerEnabled;

  /// The shimmer is tilted to the left or right.
  ///
  /// By default it is set to false
  final bool? isTiltedLeft;

  /// Width of the shimmer.
  ///
  /// Shimmer consists of two lines. The width of the first line is
  /// [shimmerWidth] and the width of the second line is [shimmerWidth]/2.
  ///
  /// The default value is 10.0.
  final double? shimmerWidth;

  /// Space b/w the shimmer.
  ///
  /// This is the space b/w the two shimmer lines
  /// defaulting to 5.0
  final double? shimmerGapWidth;

  /// The color of the shimmer.
  ///
  /// The default value is [Color.fromRGBO(255, 248, 229, 0.5)].
  final Color? shimmerColor;

  /// Duration for the shimmer effect
  final int? durationMs;

  /// Delay after one shimmer cycle is completed.
  final int? delayMs;

  @override
  State<CWNeoPopButton> createState() => _CWNeoPopButtonState();
}

class _CWNeoPopButtonState extends State<CWNeoPopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: NeoPopButton(
        key: widget.key,
        color: widget.bgColor,
        depth: widget.depth!,
        enabled: !widget.disabled,
        shadowColor: widget.shadowColor,
        parentColor: widget.parentColor!,
        grandparentColor: widget.grandparentColor!,
        buttonPosition: getButtonPosition(),
        disabledColor: widget.disabledColor!,
        border: Border.fromBorderSide(
          BorderSide(width: widget.borderWidth!, color: widget.borderColor!),
        ),
        onTapUp: () {
          HapticFeedback.vibrate();
          widget.onTapUp?.call();
        },
        onTapDown: () {
          HapticFeedback.vibrate();
          widget.onTapDown?.call();
        },
        onLongPress: () {
          widget.onLongPress?.call();
        },
        rightShadowColor: widget.rightShadowColor == null
            ? null
            : ColorUtils.getHorizontalShadow(widget.rightShadowColor!)
                .toColor(),
        leftShadowColor: widget.leftShadowColor == null
            ? null
            : ColorUtils.getHorizontalShadow(widget.leftShadowColor!).toColor(),
        topShadowColor: widget.topShadowColor == null
            ? null
            : ColorUtils.getVerticalShadow(widget.topShadowColor!).toColor(),
        bottomShadowColor: widget.bottomShadowColor == null
            ? null
            : ColorUtils.getVerticalShadow(widget.bottomShadowColor!).toColor(),
        forwardDuration: widget.forwardDurationMs == null
            ? null
            : Duration(milliseconds: widget.forwardDurationMs!),
        reverseDuration: widget.reverseDurationMs == null
            ? null
            : Duration(milliseconds: widget.reverseDurationMs!),
        animationDuration: Duration(milliseconds: widget.animationDurationMs!),
        child: NeoPopShimmer(
          shimmerWidth: widget.shimmerWidth!,
          shimmerColor: widget.shimmerColor!,
          shimmerGapWidth: widget.shimmerGapWidth!,
          enabled: widget.shimmerEnabled ?? false,
          isTiltedLeft: widget.isTiltedLeft ?? false,
          delay: Duration(milliseconds: widget.delayMs!),
          duration: Duration(milliseconds: widget.durationMs!),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Position getButtonPosition() {
    switch (widget.buttonPosition) {
      case "topLeft":
        return Position.topLeft;
      case "topCenter":
        return Position.topCenter;
      case "topRight":
        return Position.topRight;
      case "centerLeft":
        return Position.centerLeft;
      case "center":
        return Position.center;
      case "centerRight":
        return Position.centerRight;
      case "bottomLeft":
        return Position.bottomLeft;
      case "bottomCenter":
        return Position.bottomCenter;
      case "bottomRight":
        return Position.bottomRight;
      case "fullTop":
        return Position.fullTop;
      case "fullCenter":
        return Position.fullCenter;
      case "fullBottom":
      default:
        return Position.fullBottom;
    }
  }
}
