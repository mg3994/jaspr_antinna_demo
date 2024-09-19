// Data for Initial Board Setup

import 'enum.dart';
import 'piece_model.dart';

class BoardData {
  // Initialize board with pieces at their starting positions
  static Map<String, ChessPiece> getInitialBoardPieces() {
    return {
        // White Pieces
      'A1': ChessPiece(id: "A1" ,player: Player.white, type: Piece.rook),
      'B1':  ChessPiece(id: "B1" ,player: Player.white, type: Piece.knight),
      'C1':  ChessPiece(id: "C1" ,player: Player.white, type: Piece.bishop),
      'D1':  ChessPiece(id: "D1" ,player: Player.white, type: Piece.queen),
      'E1':  ChessPiece(id: "E1" ,player: Player.white, type: Piece.king),
      'F1':  ChessPiece(id: "F1" ,player: Player.white, type: Piece.bishop),
      'G1':  ChessPiece(id: "G1" ,player: Player.white, type: Piece.knight),
      'H1':  ChessPiece(id: "H1" ,player: Player.white, type: Piece.rook),
      'A2':  ChessPiece(id: "A2" ,player: Player.white, type: Piece.pawn),
      'B2':  ChessPiece(id: "B2" ,player: Player.white, type: Piece.pawn),
      'C2':  ChessPiece(id: "C2" ,player: Player.white, type: Piece.pawn),
      'D2':  ChessPiece(id: "D2" ,player: Player.white, type: Piece.pawn),
      'E2':  ChessPiece(id: "E2" ,player: Player.white, type: Piece.pawn),
      'F2':  ChessPiece(id: "F2" ,player: Player.white, type: Piece.pawn),
      'G2':  ChessPiece(id: "G2" ,player: Player.white, type: Piece.pawn),
      'H2':  ChessPiece(id: "H2" ,player: Player.white, type: Piece.pawn),

      // Black Pieces
      'A8':  ChessPiece(id: "A8" ,player: Player.black, type: Piece.rook),
      'B8':  ChessPiece(id: "B8" ,player: Player.black, type: Piece.knight),
      'C8':  ChessPiece(id: "C8" ,player: Player.black, type: Piece.bishop),
      'D8':  ChessPiece(id: "D8" ,player: Player.black, type: Piece.queen),
      'E8':  ChessPiece(id: "E8" ,player: Player.black, type: Piece.king),
      'F8':  ChessPiece(id: "F8" ,player: Player.black, type: Piece.bishop),
      'G8':  ChessPiece(id: "G8" ,player: Player.black, type: Piece.knight),
      'H8':  ChessPiece(id: "H8" ,player: Player.black, type: Piece.rook),
      'A7':  ChessPiece(id: "A7" ,player: Player.black, type: Piece.pawn),
      'B7':  ChessPiece(id: "B7" ,player: Player.black, type: Piece.pawn),
      'C7':  ChessPiece(id: "C7" ,player: Player.black, type: Piece.pawn),
      'D7':  ChessPiece(id: "D7" ,player: Player.black, type: Piece.pawn),
      'E7':  ChessPiece(id: "E7" ,player: Player.black, type: Piece.pawn),
      'F7':  ChessPiece(id: "F7" ,player: Player.black, type: Piece.pawn),
      'G7':  ChessPiece(id: "G7" ,player: Player.black, type: Piece.pawn),
      'H7':  ChessPiece(id: "H7" ,player: Player.black, type: Piece.pawn),
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