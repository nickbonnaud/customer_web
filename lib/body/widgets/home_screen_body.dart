import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/widgets/explanation_row/bloc/explanation_bloc.dart';
import 'package:customer_web/widgets/explanation_row/explanation_row.dart';
import 'package:customer_web/widgets/intro_row/intro_row.dart';
import 'package:customer_web/widgets/locations_row/locations_row.dart';
import 'package:customer_web/widgets/main_app_bar.dart';
import 'package:customer_web/widgets/quick_sheet_row/quick_sheet_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/features_row/features_row.dart';
import '../../widgets/intro_row/cubit/intro_row_loaded_cubit.dart';

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
    _scrollWatcherCubit = BlocProvider.of<ScrollWatcherCubit>(context);
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
          child: BlocProvider<IntroRowLoadedCubit>(
            create: (_) => IntroRowLoadedCubit(),
            child: IntroRow(),
          )
        ),
        SliverToBoxAdapter(
          child: FeaturesRow(mainScrollKey: _mainScrollKey),
        ),
        SliverToBoxAdapter(
          child: QuickSheetRow(),
        ),
        SliverToBoxAdapter(
          child: BlocProvider<ExplanationBloc>(
            create: (_) => ExplanationBloc(),
            child: ExplanationRow(mainScrollKey: _mainScrollKey),
          ),
        ),
        SliverToBoxAdapter(
          child: LocationsRow(mainScrollKey: _mainScrollKey),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
        )
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