// import 'package:jaspr/jaspr.dart';
// import '../state/chess_state.dart';
// import 'chess_piece.dart';

// class ChessBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final state = context.watch<ChessState>();

//     return Container(
//       child: Column(
//         children: state.board?.board.map((row) {
//           return Row(
//             children: row.map((piece) {
//               return ChessPieceWidget(piece: piece);
//             }).toList(),
//           );
//         }).toList() ?? [],
//       ),
//     );
//   }
// }
