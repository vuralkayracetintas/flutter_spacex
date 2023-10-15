import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/bloc/next_bloc_f/next_bloc.dart';
import 'package:spacex_flutter/bloc/next_bloc_f/next_evets.dart';
import 'package:spacex_flutter/bloc/next_bloc_f/next_state.dart';
import 'package:spacex_flutter/core/next_launch/next_launch_view.dart';
import 'package:spacex_flutter/product/repository/upcoming_repository.dart';

class NextLaunch extends StatefulWidget {
  const NextLaunch({
    Key? key,
  }) : super(key: key);

  @override
  State<NextLaunch> createState() => _NextLaunchState();
}

class _NextLaunchState extends State<NextLaunch> {
  @override
  Widget build(BuildContext context) {
    // var crewMember = widget.state.nextModel.crew[widget.index];
    // final Uri urlReddit = Uri.parse(widget.state.nextModel.links.reddit.launch);
    // final Uri urlYoutube = Uri.parse(widget.state.nextModel.links.webcast);
    // final Uri urlWikipedia = Uri.parse(widget.state.nextModel.links.wikipedia);
    return BlocProvider(
        create: (context) => NextBloc(
              RepositoryProvider.of<NextLaunchRepository>(context),
            )..add(LoadNextData()),
        child: Scaffold(
          body: BlocBuilder<NextBloc, NextStates>(
            builder: (BuildContext context, state) {
              debugPrint('state: ${state.runtimeType}');

              if (state is NextInitialState || state is NextLoadingState) {
                const Center(child: CircularProgressIndicator());
              } else if (state is NextErrorState) {
                debugPrint('error : ${state.message}');
                return Text('Getting Error: ${state.message}');
              } else if (state is NextLoadedState) {
                return RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<NextBloc>(context).add(LoadNextData());
                    },
                    child: NextLaunchView(
                      state: state,
                    ));
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
