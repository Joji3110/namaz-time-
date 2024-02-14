import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_namaz/bloc/namaz_time_bloc.dart';
import 'package:time_namaz/bloc/namaz_time_event.dart';

class NamazPage extends StatelessWidget {
  const NamazPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NamazTimeBloc namazTimeBloc = BlocProvider.of<NamazTimeBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Namaz'),
            ElevatedButton(
              child: Text('Привет'),
              onPressed: () {
                context.goNamed('details');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          namazTimeBloc.add(NamazTimeLoadEvent(cityName: 'ош'));
          print('ghbdt');
        },
      ),
    );
  }
}
