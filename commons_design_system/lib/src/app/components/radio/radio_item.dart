import 'package:commons_shared/main.dart';
import 'package:flutter/material.dart';

import 'radio_model.dart';

class RadioItem extends StatefulWidget {
  final RadioModel _model;
  final bool active;
  final bool hasRightBorder;

  const RadioItem(
    this._model, {
    this.active = false,
    this.hasRightBorder = false,
  });

  @override
  _RadioItemState createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  late var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: _buildBoxDecoration,
      child: Center(
        child: Text(
          widget._model.buttonText,
          style: TextStyle(
            color: _textColor(),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Color _textColor() {
    if (widget._model.isSelected) {
      return Colors.white;
    } else if (widget.active) {
      return Theme.of(context).primaryColor;
    } else {
      return ColorUtils.lightGrey;
    }
  }

  Decoration get _buildBoxDecoration {
    switch (widget._model.location) {
      case RadioModelLocation.first:
        return BoxDecoration(
            color: _color,
            border: Border(
              right: widget.hasRightBorder
                  ? _buildBorderSide()
                  : _buildBorderSideTransparent(),
            ));

      case RadioModelLocation.middle:
        return BoxDecoration(
          color: _color,
          border: Border(
            left: _buildBorderSide(),
            right: _buildBorderSide(),
          ),
        );

      default:
        return BoxDecoration(
          color: _color,
        );
    }
  }

  BorderSide _buildBorderSide() {
    return BorderSide(
      width: 1,
      color: _middleBorderColor,
    );
  }

  BorderSide _buildBorderSideTransparent() {
    return BorderSide(
      width: 0,
      color: Theme.of(context).primaryColor,
    );
  }

  Color get _middleBorderColor {
    if (widget.hasRightBorder) {
      if (widget.active) {
        return Theme.of(context).primaryColor;
      } else {
        return ColorUtils.lightGrey;
      }
    }

    return Theme.of(context).primaryColor;
  }

  Color get _color {
    if (widget._model.isSelected) {
      return widget.active
          ? Theme.of(context).primaryColor
          : ColorUtils.lightGrey;
    } else {
      return Colors.transparent;
    }
  }
}
