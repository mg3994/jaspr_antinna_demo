import 'package:jaspr/jaspr.dart';

import '../../../components/use/use.dart';

// Enum for Players (White, Black)
enum Player {
  white(Colors.white),
  black(Colors.black);

  final Color color;
  const Player(this.color);
}

// Enum for Rows (1-8)
enum Row {
  one(1), two(2), three(3), four(4), five(5), six(6), seven(7), eight(8);

  final int value;
  const Row(this.value);
}

// Enum for Columns (A-H)
enum Col {
  A, B, C, D, E, F, G, H;
}

// Enum for Chess Pieces
enum PieceType {
  bishop, king, knight, pawn, queen, rook;

  String get type => name;
}

// ChessPiece Class that holds Player and PieceType
class ChessPiece {
  final Player player;
  final PieceType pieceType;

  ChessPiece({required this.player, required this.pieceType});
}

// Board Data: Initializes pieces and tiles
class BoardData {
  static Map<String, ChessPiece> getInitialBoardPieces() {
    return {
      // White Pieces
      'A1': ChessPiece(player: Player.white, pieceType: PieceType.rook),
      'B1': ChessPiece(player: Player.white, pieceType: PieceType.knight),
      'C1': ChessPiece(player: Player.white, pieceType: PieceType.bishop),
      'D1': ChessPiece(player: Player.white, pieceType: PieceType.queen),
      'E1': ChessPiece(player: Player.white, pieceType: PieceType.king),
      'F1': ChessPiece(player: Player.white, pieceType: PieceType.bishop),
      'G1': ChessPiece(player: Player.white, pieceType: PieceType.knight),
      'H1': ChessPiece(player: Player.white, pieceType: PieceType.rook),
      'A2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'B2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'C2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'D2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'E2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'F2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'G2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),
      'H2': ChessPiece(player: Player.white, pieceType: PieceType.pawn),

      // Black Pieces
      'A8': ChessPiece(player: Player.black, pieceType: PieceType.rook),
      'B8': ChessPiece(player: Player.black, pieceType: PieceType.knight),
      'C8': ChessPiece(player: Player.black, pieceType: PieceType.bishop),
      'D8': ChessPiece(player: Player.black, pieceType: PieceType.queen),
      'E8': ChessPiece(player: Player.black, pieceType: PieceType.king),
      'F8': ChessPiece(player: Player.black, pieceType: PieceType.bishop),
      'G8': ChessPiece(player: Player.black, pieceType: PieceType.knight),
      'H8': ChessPiece(player: Player.black, pieceType: PieceType.rook),
      'A7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'B7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'C7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'D7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'E7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'F7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'G7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
      'H7': ChessPiece(player: Player.black, pieceType: PieceType.pawn),
    };
  }

  static List<String> getBoardTiles() {
    List<String> tiles = [];
    for (var col in Col.values) {
      for (var row in Row.values) {
        tiles.add('${col.name}${row.value}');
      }
    }
    return tiles;
  }
}

// Utility class for handling conversions
class ChessUtils {
  static int colToInt(Col col) => col.index;
  static int rowToInt(Row row) => row.index;
  static Col intToCol(int colIndex) => Col.values[colIndex];
  static Row intToRow(int rowIndex) => Row.values[rowIndex];
}

// Render Chess Shapes (SVGs for pieces)
class Shape {
  static Component renderShape(Player player, PieceType pieceType) => svg(
        classes: player.name.toString(),
        width: 50.px,
        height: 50.px,
        viewBox: "0 0 50 50",
        attributes: {'fill': "none"},
        [
          use(href: '#${pieceType.type}'),
        ],
      );
}

// ChessBoard Component to render tiles and pieces
class ChessBoard extends StatelessComponent {
  final Map<String, ChessPiece> boardPieces;

  ChessBoard(this.boardPieces);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      div(classes: 'chess-board', [
        for (String tile in BoardData.getBoardTiles()) _buildTile(tile),
      ]),
    ];
  }

  // Builds a tile with or without a piece
  Component _buildTile(String tilePosition) {
    final piece = boardPieces[tilePosition];
    return div(classes: 'chess-tile', [
      if (piece != null) _buildPiece(piece),
    ]);
  }

  // Render a chess piece on the tile
  Component _buildPiece(ChessPiece piece) {
    return Shape.renderShape(piece.player, piece.pieceType);
  }
}

// Main App to initialize and run the chess game
// void main() {
//   final initialBoardPieces = BoardData.getInitialBoardPieces();
//   runApp(ChessApp(initialBoardPieces));
// }

// ChessApp Component: Root of the app
class ChessApp extends StatelessComponent {
  final Map<String, ChessPiece> initialBoardPieces;

  const ChessApp(this.initialBoardPieces,{super.key});

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      ChessBoard(initialBoardPieces),
    ];
  }
}
