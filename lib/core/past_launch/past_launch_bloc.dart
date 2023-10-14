import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/bloc/past_bloc_f/past_bloc.dart';
import 'package:spacex_flutter/bloc/past_bloc_f/past_events.dart';
import 'package:spacex_flutter/bloc/past_bloc_f/past_state.dart';
import 'package:spacex_flutter/core/past_launch/past_launch_view.dart';
import 'package:spacex_flutter/product/repository/past_repository.dart';

class PastLauncBloc extends StatefulWidget {
  const PastLauncBloc({super.key});

  @override
  State<PastLauncBloc> createState() => _PastLauncBlocState();
}

class _PastLauncBlocState extends State<PastLauncBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PastBloc(
        RepositoryProvider.of<PastLaunchRepository>(context),
      )..add(LoadPastData()),
      child: Scaffold(
        body: BlocBuilder<PastBloc, PastStates>(
          builder: (BuildContext context, state) {
            debugPrint('state: ${state.runtimeType}');

            if (state is PastInitialState || state is PastLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is PastErrorState) {
              debugPrint('error : ${state.message}');
            } else if (state is PastLoadedState) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<PastBloc>(context).add(LoadPastData());
                  },
                  child: PastLaunchView(
                    state: state,
                  ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
