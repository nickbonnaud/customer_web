import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/widgets/intro_row/intro_row.dart';
import 'package:customer_web/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _mainScrollKey = GlobalKey();

  late ScrollWatcherCubit _scrollWatcherCubit; 

  @override
  void initState() {
    super.initState();
    _scrollWatcherCubit = ScrollWatcherCubit();
    _scrollController.addListener(_handleScrollNotification);
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: _mainScrollKey,
      shrinkWrap: true,
      controller: _scrollController,
      slivers: [
        _appBar(),
        SliverToBoxAdapter(
          child: IntroRow(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollWatcherCubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _appBar() {
    return MainAppBar();
  }

  void _handleScrollNotification() {
    _scrollWatcherCubit.scrolled(offset: _scrollController.offset);
  }
}