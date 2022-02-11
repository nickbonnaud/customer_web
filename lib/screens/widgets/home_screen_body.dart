import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();

  late ScrollWatcherCubit _scrollWatcherCubit; 

  @override
  void initState() {
    super.initState();
    _scrollWatcherCubit = ScrollWatcherCubit();
    _scrollController.addListener(_handleScrollNotification);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void dispose() {
    _scrollWatcherCubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScrollNotification() {
    _scrollWatcherCubit.scrolled(offset: _scrollController.offset);
  }
}