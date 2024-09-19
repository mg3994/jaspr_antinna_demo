// // Define ChessLetters as an enum
// enum ChessLetters { A, B, C, D, E, F, G, H }

// // Define ChessNumbers as an enum
// enum ChessNumbers { one, two, three, four, five, six, seven, eight }

import 'package:jaspr/jaspr.dart';


const initialTurn = Player.white;
const perspective =  Player.white;
enum Player {
  white(Colors.white),
  black(Colors.black);
  final Color color;
  const Player(this.color);
  
  
}


enum Row {
  one(1),
  two(2),
  three(3),
  four(4),
  five(5),
  six(6),
  seven(7),
  eight(8);

  /// The int value
  final int value;
  const Row(this.value);
}


enum Col {
A,
B,
C,
D,
E,
F,
G,
H,
}

enum Piece {
  bishop,
  king,
  knight,
  pawn,
  queen,
  rook;
 String get type => name;
}