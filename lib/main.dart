// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:show_name/name_bloc.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => NameBloc([
//           'Jasur',
//           'Akbarali',
//           'Feruzbek',
//           'Muhammadrasul',
//           'Axmadxon',
//           'Fotima',
//           'Aziza',
//           'Gulrux',
//           'Mahmudxon',
//           'Muhammadsaid',
//           'Hojiakbar',
//           'Ozod',
//           'Bahodir',
//           'Jahongir',
//           'Sohibjon',
//           'Mehrojiddin',
//           'Sardor (katta)',
//           'Sardor',
//           'Dovudxon',
//           'Jahongir',
//           'Muhammadziyo',
//           'Muhammadamin',
//         ]),
//         child: HomeScreen(),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Name BLoC Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocBuilder<NameBloc, String>(
//               builder: (context, name) {
//                 return Text(
//                   name,
//                   style: TextStyle(fontSize: 24),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () {
//                     context.read<NameBloc>().add(BackwardNamesEvent());
//                   },
//                 ),
//                 SizedBox(width: 20),
//                 IconButton(
//                   icon: Icon(Icons.arrow_forward),
//                   onPressed: () {
//                     context.read<NameBloc>().add(ForwardNamesEvent());
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'name_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NameBloc([
          'Jasur', 'Akbarali', 'Feruzbek', 'Muhammadrasul', 'Axmadxon',
          'Fotima', 'Aziza', 'Gulrux', 'Mahmudxon', 'Muhammadsaid',
          'Hojiakbar', 'Ozod', 'Bahodir', 'Jahongir', 'Sohibjon',
          'Mehrojiddin', 'Sardor (katta)', 'Sardor', 'Dovudxon',
          'Jahongir', 'Muhammadziyo', 'Muhammadamin',
        ]),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name BLoC Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<NameBloc, NamesState>(
              builder: (context, state) {
                if (state is NameLoadedState) {
                  return Text(
                    state.name,
                    style: TextStyle(fontSize: 24),
                  );
                }
                return Text('Error loading name'); // Handle other states if needed
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    context.read<NameBloc>().add(BackwardNamesEvent());
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    context.read<NameBloc>().add(ForwardNamesEvent());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
