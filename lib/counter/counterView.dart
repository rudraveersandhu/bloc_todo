import 'package:bloc_practice/counter/counterCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit,int>(
          builder: (context,state){
          return Center(
              child: Text(state.toString(),
          style: TextStyle(fontSize: 50),));
      }),
      floatingActionButton:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          InkWell(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.green,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            onTap: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
          ),
          InkWell(
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                BlocProvider.of<CounterCubit>(context).decrement();
                }
          )
          ]
      ),
    );
  }
}
