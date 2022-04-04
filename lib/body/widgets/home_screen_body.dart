import 'package:customer_web/widgets/explanation_row/explanation_row.dart';
import 'package:customer_web/widgets/features_row/features_row.dart';
import 'package:customer_web/widgets/footer_row/footer_row.dart';
import 'package:customer_web/widgets/how_to_row/how_to_row.dart';
import 'package:customer_web/widgets/intro_row/intro_row.dart';
import 'package:customer_web/widgets/locations_row/locations_row.dart';
import 'package:customer_web/widgets/main_app_bar.dart';
import 'package:customer_web/widgets/quick_sheet_row/quick_sheet_row.dart';
import 'package:customer_web/widgets/splash_overlay/splash_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../intro_widgets_loaded_bloc/intro_widgets_loaded_bloc.dart';
import '../key_holder_cubit/key_holder_cubit.dart';
import '../scroll_watcher_cubit.dart';


class HomeScreenBody extends StatefulWidget {

  const HomeScreenBody({Key? key})
    : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();
  
  late ScrollWatcherCubit _scrollWatcherCubit; 

  @override
  void initState() {
    super.initState();
    _scrollWatcherCubit = BlocProvider.of<ScrollWatcherCubit>(context);
    _scrollController.addListener(_handleScrollNotification);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        _body(),
        const SplashOverlay()
      ],
    );
  }

  @override
  void dispose() {
    _scrollWatcherCubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _body() {
    return BlocBuilder<IntroWidgetsLoadedBloc, IntroWidgetsLoadedState>(
      buildWhen: (previous, current) => !previous.loadingLogoLoaded && current.loadingLogoLoaded,
      builder: (context, state) {
        return !state.loadingLogoLoaded
          ? Container()
          : CustomScrollView(
              key: BlocProvider.of<KeyHolderCubit>(context).state.mainScrollKey,
              shrinkWrap: true,
              controller: _scrollController,
              slivers: const [
                MainAppBar(),
                SliverToBoxAdapter(
                  child: IntroRow()
                ),
                SliverToBoxAdapter(
                  child: FeaturesRow(),
                ),
                SliverToBoxAdapter(
                  child: QuickSheetRow(),
                ),
                SliverToBoxAdapter(
                  child: ExplanationRow(),
                ),
                SliverToBoxAdapter(
                  child: LocationsRow(),
                ),
                SliverToBoxAdapter(
                  child: HowToRow()
                ),
                SliverToBoxAdapter(
                  child: FooterRow()
                )
              ],
            );
      }
    );
  }

  void _handleScrollNotification() {
    _scrollWatcherCubit.scrolled(offset: _scrollController.offset);
  }
}