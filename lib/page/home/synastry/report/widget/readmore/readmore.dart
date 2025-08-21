import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:auto_hyphenating_text/auto_hyphenating_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that displays text with "Read more" and "Read less" functionality.
///
/// The [ReadMore] widget allows you to display a portion of text with an
/// option to expand or collapse the text by tapping a button.
class ReadMore extends StatefulWidget {
  final String text;
  final int minLines;
  final TextStyle? style;
  final TextStyle? readMoreStyle;
  final String readMoreText;
  final String readLessText;
  final bool readMoreIconVisible;
  final IconData readMoreIcon;
  final IconData readLessIcon;
  final double iconSize;
  final bool alignCenter;
  final TextStyle? hashtagStyle;
  final TextStyle? urlStyle;
  final Function(String)? onHashtagTap;
  final Function(String)? onUrlTap;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  /// Creates a [ReadMore] widget.
  ///
  /// The [text] parameter is required and specifies the text to display.
  ///
  /// The [minLines] parameter specifies the number of lines to show when
  /// the text is collapsed. The [readMoreText] and [readLessText] parameters
  /// specify the text for the expand and collapse buttons, respectively.
  ///
  /// The [readMoreStyle] and [style] parameters allow customization of the
  /// text styles.
  const ReadMore(
    this.text, {
    super.key,
    this.minLines = 3,
    this.style,
    this.readMoreStyle,
    this.readMoreText = 'Read more',
    this.readLessText = 'Read less',
    this.readMoreIconVisible = true,
    this.readMoreIcon = Icons.keyboard_arrow_down,
    this.readLessIcon = Icons.keyboard_arrow_up,
    this.iconSize = 20,
    this.alignCenter = false,
    this.hashtagStyle,
    this.urlStyle,
    this.onHashtagTap,
    this.onUrlTap,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
  });

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool _isExpanded = false;
  bool _needsReadMore = false;

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = widget.style;
    final effectiveReadMoreStyle = widget.readMoreStyle;

    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(text: widget.text, style: effectiveTextStyle);

        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          maxLines: widget.minLines,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);
        _needsReadMore = textPainter.didExceedMaxLines;

        if (!_needsReadMore) {
          return SizedBox(
            width: double.maxFinite,
            child: AutoHyphenatingText(
              widget.text,
              hyphenationCharacter: "-",
              textAlign: TextAlign.start,
              style: effectiveTextStyle,
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            if (_isExpanded == false) {
              setState(() => _isExpanded = !_isExpanded);
            }
          },
          child: Container(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: Column(
              crossAxisAlignment: widget.alignCenter
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                  child: AutoHyphenatingText(
                    widget.text,
                    hyphenationCharacter: "-",
                    textAlign: TextAlign.start,
                    maxLines: _isExpanded ? null : 3,
                    overflow: _isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.contentTitleColor,
                      fontSize: 14.sp,
                      height: 1.62.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                  ),
                ),
                if (!_isExpanded)
                  Row(
                    mainAxisSize: widget.alignCenter
                        ? MainAxisSize.min
                        : MainAxisSize.max,
                    mainAxisAlignment: widget.alignCenter
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          _isExpanded
                              ? widget.readLessText
                              : widget.readMoreText,
                          style: effectiveReadMoreStyle,
                        ),
                      ),
                      if (widget.readMoreIconVisible) ...[
                        Container(
                          margin: EdgeInsetsDirectional.only(start: 2, top: 2),
                          child: Image.asset(
                            Assets.imageDownArrow,
                            width: 4,
                            height: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
