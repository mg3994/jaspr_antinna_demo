import '../entities/chess_board.dart';
import '../entities/chess_piece.dart';

class InitializeBoard {
  ChessBoard execute() {
    // Initialize a simple board with pieces
    final board = List.generate(8, (_) => List<ChessPiece?>.filled(8, null));

    // Example: Add some pieces
    board[1][0] = ChessPiece(type: 'pawn', color: 'white', position: 'a2');
    board[1][1] = ChessPiece(type: 'pawn', color: 'white', position: 'b2');
    // Add more pieces as needed

    return ChessBoard(board: board);
  }
}
