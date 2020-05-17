import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_snackbar/bloc/data_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocListener<DataBloc, DataState>(
        listener: (context, state) {
          if (state is Success) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Success'),
              ),
            );
          }
        },
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is Initial) {
              return Center(
                child: Text('Press the button'),
              );
            }
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Initial) {
              return Center(
                child: Text('Success'),
              );
            }
            return Center(
              child: Text('What\'s happen?'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          BlocProvider.of<DataBloc>(context).add(FetchData());
        },
      ),
    );
  }
}
