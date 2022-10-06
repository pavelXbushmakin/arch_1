import 'package:flutter/material.dart';
import 'package:arch_1_business/arch_1_business.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  //_MyAppState
}

class _MyAppState extends State<MyApp> {
  late final MainBloc _mainBloc;

  @override
  void initState(){
    super.initState();
    _mainBloc = GetIt.I.get<MainBloc>();
    // _mainBloc = BlocFactory.instance.get<MainBloc>();
  }

  @override
  Widget build(BuildContext context){
    return Provider<MainBloc>(
      create: (_) => _mainBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }

  @override
  void dispose(){
    _mainBloc.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  //_MyHomePageState
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;

  void _incrementCounter() {
    context.read<MainBloc>().add(0);
    setState((){
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:',),
            Text('$_counter', style: Theme.of(context).textTheme.headline4,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}