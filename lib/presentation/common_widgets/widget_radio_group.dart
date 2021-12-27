import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetRadioGroup<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selectedItem;

  final int maxSelected;
  final Widget Function(int, T) radioAreaBuilder;
  final Widget Function(int, T) radioBuilder;
  final Widget Function(int, T) hintBuilder;
  final Widget Function() containerBuilder;
  final Function(int, List<T>) onSelectedChanged;
  final Function(int) onTap;
  final CrossAxisAlignment crossAxisAlignment;

  WidgetRadioGroup(
      {Key key,
      this.items,
      this.onTap,
      this.maxSelected = 1,
      this.radioAreaBuilder,
      this.radioBuilder,
      this.hintBuilder,
      this.containerBuilder,
      this.onSelectedChanged,
      this.crossAxisAlignment,
      @required this.selectedItem})
      : super(key: key);

  @override
  _WidgetRadioGroupState createState() => _WidgetRadioGroupState<T>();
}

class _WidgetRadioGroupState<T> extends State<WidgetRadioGroup<T>> {
  _onSelectedChange(int index) {
    widget.onSelectedChanged(index, widget.selectedItem);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = List<Widget>();
    for (int i = 0; i < widget.items.length; i++) {
      var item = widget.items[i];
      var renderWidget;
      bool isSelected = widget.selectedItem.contains(item);
      renderWidget = GestureDetector(
        onTap: () {
          _onItemTap(i, item);
          _onSelectedChange(i);
        },
        child: Container(
          color: Colors.transparent,
          child: WidgetRadioItem(
            crossAxisAlignment: widget.crossAxisAlignment,
            hintItem: widget.hintBuilder != null ? _renderHint(i, item) : null,
            radioArea: _renderRadioArea(i, item),
            radio: isSelected == true ? _renderRadio(i, item) : null,
          ),
        ),
      );

      items.add(renderWidget);
    }
    return Container(
//      color: Colors.grey,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: items,
      ),
    );
  }

  Widget _renderContainer() {
    return widget.containerBuilder();
  }

  Widget _renderRadioArea(int index, T item) {
    return widget.radioAreaBuilder(index, item);
  }

  Widget _renderRadio(int index, T item) {
    return widget.radioBuilder(index, item);
  }

  Widget _renderHint(int index, T item) {
    return widget.hintBuilder(index, item);
  }

  _onItemTap(int index, T item) {
    if (widget.maxSelected > 1) {
      if (widget.maxSelected > widget.selectedItem.length) {
        if (widget.selectedItem.contains(item)) {
          setState(() {
            widget.selectedItem.remove(item);
          });
        } else {
          setState(() {
            widget.selectedItem.add(item);
          });
        }
      } else {
        if (widget.selectedItem.contains(item)) {
          setState(() {
            widget.selectedItem.remove(item);
          });
        }
      }
    } else {
      setState(() {
        widget.selectedItem.clear();
        widget.selectedItem.add(item);
      });
    }
  }
}
