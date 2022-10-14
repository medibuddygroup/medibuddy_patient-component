import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';

class ToggleTab extends StatefulWidget {
  final String leftTabText;
  final String rightTabText;
  final TextStyle selectedTabTextStyle;
  final TextStyle unselectedTabTextStyle;
  final Widget leftTabContents;
  final Widget rightTabContents;
  final double tabContentsContainerHeight;
  final double toggleTabHeight;
  final EdgeInsets margin;

  const ToggleTab({
    Key? key,
    required this.leftTabText,
    required this.rightTabText,
    required this.selectedTabTextStyle,
    required this.unselectedTabTextStyle,
    required this.leftTabContents,
    required this.rightTabContents,
    required this.tabContentsContainerHeight,
    this.margin = const EdgeInsets.all(16),
    this.toggleTabHeight = 32,
  }) : super(key: key);

  @override
  _ToggleTabState createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab> with TickerProviderStateMixin {

  late TabController _tabController;
  List<bool> selectedStatus = [true, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if(_tabController.indexIsChanging) {
          _updateSelectedStatus(_tabController.index);
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _updateSelectedStatus(int index) {
    selectedStatus[selectedStatus.indexOf(true)] = false;
    selectedStatus[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [
          _buildToggleTab(),
          _buildToggleTabContents(),
        ],
      ),
    );
  }

  Widget _buildToggleTab() {
    return Container(
      decoration: BoxDecoration(
          color: MColors.gray[80]!,
          borderRadius: BorderRadius.circular(999)
      ),
      child: TabBar(
        controller: _tabController,
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0,0,0,0.35),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              )
            ]
        ),
        tabs: [
          Container(
            height: widget.toggleTabHeight,
            alignment: Alignment.center,
            child: Text(
              widget.leftTabText,
              style: selectedStatus[0] ? widget.selectedTabTextStyle : widget.unselectedTabTextStyle,
              // style: _tabController.previousIndex == 1 ? widget.selectedTextStyle : widget.unselectedTextStyle,
            ),
          ),
          Container(
            height: widget.toggleTabHeight,
            alignment: Alignment.center,
            child: Text(
              widget.rightTabText,
              style: selectedStatus[1] ? widget.selectedTabTextStyle : widget.unselectedTabTextStyle,
              // style: _tabController.previousIndex == 0 ? widget.selectedTextStyle : widget.unselectedTextStyle
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleTabContents() {
    return Container(
      height: widget.tabContentsContainerHeight,
      child: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          widget.leftTabContents,
          widget.rightTabContents,
        ],
      ),
    );
  }
}
