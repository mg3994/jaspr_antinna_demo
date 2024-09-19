// Data for Initial Board Setup

import 'enum.dart';
import 'piece_model.dart';

class BoardData {
  // Initialize board with pieces at their starting positions
  static Map<String, ChessPiece> getInitialBoardPieces() {
    return {
      // White pieces
      'A1': const ChessPiece(player: Player.white, pieceType: Piece.rook),
      'B1': const ChessPiece(player: Player.white, pieceType: Piece.knight),
      'C1': const ChessPiece(player: Player.white, pieceType: Piece.bishop),
      'D1': const ChessPiece(player: Player.white, pieceType: Piece.queen),
      'E1': const ChessPiece(player: Player.white, pieceType: Piece.king),
      'F1': const ChessPiece(player: Player.white, pieceType: Piece.bishop),
      'G1': const ChessPiece(player: Player.white, pieceType: Piece.knight),
      'H1': const ChessPiece(player: Player.white, pieceType: Piece.rook),
      'A2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'B2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'C2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'D2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'E2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'F2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'G2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),
      'H2': const ChessPiece(player: Player.white, pieceType: Piece.pawn),

      // Black pieces
      'A8': const ChessPiece(player: Player.black, pieceType: Piece.rook),
      'B8': const ChessPiece(player: Player.black, pieceType: Piece.knight),
      'C8': const ChessPiece(player: Player.black, pieceType: Piece.bishop),
      'D8': const ChessPiece(player: Player.black, pieceType: Piece.queen),
      'E8': const ChessPiece(player: Player.black, pieceType: Piece.king),
      'F8': const ChessPiece(player: Player.black, pieceType: Piece.bishop),
      'G8': const ChessPiece(player: Player.black, pieceType: Piece.knight),
      'H8': const ChessPiece(player: Player.black, pieceType: Piece.rook),
      'A7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'B7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'C7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'D7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'E7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'F7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'G7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
      'H7': const ChessPiece(player: Player.black, pieceType: Piece.pawn),
    };
  }

  // Return the list of all tile positions (A1 to H8)
  static List<String> getInitialBoardTiles() {
    List<String> tiles = [];
    for (var col in Col.values) {
      for (var row in Row.values) {
        tiles.add('${col.name}${row.value}');
      }
    }
    return tiles;
  }
}