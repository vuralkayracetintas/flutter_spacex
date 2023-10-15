import 'package:flutter/material.dart';
import 'package:spacex_flutter/bloc/past_bloc_f/past_state.dart';
import 'package:spacex_flutter/core/past_launch/past_launch_details.dart';
import 'package:spacex_flutter/core/widgets/past_card.dart';
import 'package:spacex_flutter/core/widgets/succes_control_container.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';
import 'package:spacex_flutter/product/models/past_model.dart';

class PastLaunchView extends StatefulWidget {
  const PastLaunchView({Key? key, required this.state}) : super(key: key);
  final PastLoadedState state;

  @override
  State<PastLaunchView> createState() => _PastLaunchViewState();
}

class _PastLaunchViewState extends State<PastLaunchView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<void>(
      future: precacheImage(
          NetworkImage(widget.state.pastModel.first.links?.patch?.small ??
              ImageConstans.rocketNotFound),
          context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text(StringConstans.errorLoadData));
        } else {
          return Center(
              child: ListView.builder(
            itemCount: widget.state.pastModel.length,
            itemBuilder: (context, index) {
              final data = widget.state.pastModel[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PastLaunchDetails(
                        data: data,
                      ),
                    ),
                  );
                },
                child: PastCart(data: data),
              );
            },
          ));
        }
      },
    ));
  }
}
