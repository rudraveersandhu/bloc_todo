import 'package:bloc_practice/counter/counterCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counterView.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    // block provider
    return BlocProvider(
        create: (create)=>CounterCubit(0),

      // UI view
      child: BlocListener<CounterCubit,int>(
        listener: (context,state){
          if(state==10){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Congrats"),
                    content: Text("You have reached 10"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("Close"))
                    ],
                  );
                }
            );
          }

        },
          child: CounterView()
      ),

    );
  }
}
