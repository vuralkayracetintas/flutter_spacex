// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:spacex_flutter/bloc/spacex_bloc.dart';
import 'package:spacex_flutter/bloc/spacex_events.dart';
import 'package:spacex_flutter/bloc/spacex_states.dart';
import 'package:spacex_flutter/core/home/home_page.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';
import 'package:spacex_flutter/product/repository/spacex_repositorty.dart';

int index = 0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMargin = 10;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SpacexBloc(
        RepositoryProvider.of<SpacexRepository>(context),
      )..add(LoadSpacexData()),
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            notchMargin: _notchMargin,
            shape: const CircularNotchedRectangle(),
            child: _myTabBar()),
        appBar: AppBar(
          title: Text(StringConstans.appBarTitle,
              style: GoogleFonts.raleway(
                textStyle: context.general.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        body: BlocBuilder<SpacexBloc, SpacexStates>(
          builder: (BuildContext context, state) {
            debugPrint('state: ${state.runtimeType}');

            if (state is SpacexInitialState || state is SpacexLoadingState) {
              const CircularProgressIndicator();
            } else if (state is SpacexErrorState) {
              debugPrint('error : ${state.message}');
              return Text('Getting Error: ${state.message}');
            } else if (state is SpacexLoadedState) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<SpacexBloc>(context).add(LoadSpacexData());
                  },
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        HomePage(
                          state: state,
                          size: size,
                          index: index,
                        ),
                        Container(color: Colors.blue),
                        Container(color: Colors.green),
                        Container(color: Colors.pink),
                      ]));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  TabBar _myTabBar() {
    return TabBar(
      indicatorColor: Colors.white,
      labelColor: Colors.green,
      unselectedLabelColor: Colors.red,
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      labelStyle: const TextStyle(fontStyle: FontStyle.italic),
      unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal),
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
    );
  }
}

enum _MyTabViews { HOME, ALL, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
