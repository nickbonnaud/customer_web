import 'package:customer_web/cubit/scroll_watcher_cubit.dart';
import 'package:customer_web/widgets/explanation_row/bloc/explanation_bloc.dart';
import 'package:customer_web/widgets/explanation_row/explanation_row.dart';
import 'package:customer_web/widgets/features_row/features_row.dart';
import 'package:customer_web/widgets/footer_row/footer_row.dart';
import 'package:customer_web/widgets/how_to_row/how_to_row.dart';
import 'package:customer_web/widgets/intro_row/bloc/intro_widgets_loaded_bloc.dart';
import 'package:customer_web/widgets/intro_row/intro_row.dart';
import 'package:customer_web/widgets/locations_row/locations_row.dart';
import 'package:customer_web/widgets/main_app_bar.dart';
import 'package:customer_web/widgets/quick_sheet_row/quick_sheet_row.dart';
import 'package:customer_web/widgets/splash_overlay/splash_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatefulWidget {

  const HomeScreenBody({Key? key})
    : super(key: key);

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
    
    return Stack(
      children: [
        _scrollBody(),
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

  Widget _scrollBody() {
    return BlocBuilder<IntroWidgetsLoadedBloc, IntroWidgetsLoadedState>(
      buildWhen: (previous, current) => !previous.loadingLogoLoaded && current.loadingLogoLoaded,
      builder: (context, state) {
        return !state.loadingLogoLoaded
          ? Container()
          : CustomScrollView(
              key: _mainScrollKey,
              shrinkWrap: true,
              controller: _scrollController,
              slivers: [
                _appBar(),
                const SliverToBoxAdapter(
                  child: IntroRow()
                ),
                SliverToBoxAdapter(
                  child: FeaturesRow(mainScrollKey: _mainScrollKey),
                ),
                const SliverToBoxAdapter(
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
                  child: HowToRow(mainScrollKey: _mainScrollKey)
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        height: 100.h
                      ),
                      const Divider(),
                      const FooterRow()
                    ],
                  ),
                )
              ],
            );
      }
    );
  }

  Widget _appBar() {
    return const MainAppBar();
  }

  void _handleScrollNotification() {
    _scrollWatcherCubit.scrolled(offset: _scrollController.offset);
  }
}