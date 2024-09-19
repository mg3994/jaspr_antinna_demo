import 'package:antinna/src/features/games/chess/script/enum.dart';
import 'package:jaspr/jaspr.dart';

import 'piece_model.dart';
@Import.onWeb('dart:html', show: [#window, #DivElement, #document])
import 'utils.imports.dart';

class Utils {
  const Utils();
  static int colToInt(Col col) => col.index;
  static int rowToInt(Row row) => row.index; //row.value - 1;
  static Col intToCol(int int) => Col.values[int];
  static Row intToRow(int int) => Row.values[int];
  static getPositionsFromShortCode(String shortCode) {
    final positions = Utils.getInitialPiecePositions();
    final override = {};
    final bool defaultPositionMode = shortCode.startsWith("X");
    if (defaultPositionMode) {
      shortCode.substring(1);
    }
    shortCode.split(",").forEach((string) {
      final promoted = string.startsWith("P");
      if (promoted) {
        string = string.substring(1);
      }
      if (defaultPositionMode) {
        final inactive = string.length == 3;
        final id = string.substring(0, 2);
        final col = inactive ? null : string[2];
        final row = inactive ? null : string[3];
        final moves = string.length >= 5 ? string[4] : '1'; //TODO: Check
        override[id] = {
          'col': col,
          'row': row,
          'active': !inactive,
          '_moves': int.parse(moves),
          '_promoted': promoted,
        };
      } else {
        final moved = string.length >= 4;
        final id = string.substring(0, 2);
        final col = string[moved ? 2 : 0];
        final row = string[moved ? 3 : 1];
        final moves = string.length >= 5
            ? string[4]
            : moved
                ? '1'
                : '0';

        ///todo check
        override[id] = {
          'col': col,
          'row': row,
          'active': true,
          '_moves': int.parse(moves),
          '_promoted': promoted
        };
      }
    });
    for (var id in positions) {
      if (override[id]) {
        positions[id] = override[id];
      } else {
        positions[id] = defaultPositionMode ? positions[id] : {'active': false};
      }
    }
    return positions;
  }

  static getInitialBoardPieces(parent, pieces) {
    final boardPieces = {};
    final container = DivElement();
    container.className = "pieces";
    parent.appendChild(container);
    for (var pieceId in pieces) {
      final boardPiece = DivElement();
      boardPiece.className =
          "piece ${pieces[pieceId].data.player.toLowerCase()}";
      boardPiece.innerHtml = pieces[pieceId].shape();
      container.append(boardPiece);
      boardPieces[pieceId] = boardPiece;
    }
    return boardPieces;
  }

  static getInitialBoardTiles(parent, handler) {
    final tiles = {1: {}, 2: {}, 3: {}, 4: {}, 5: {}, 6: {}, 7: {}, 8: {}};
    final board = document.createElement("div");
    board.className = "board";
    parent.appendChild(board);
    for (var i = 0; i < 8; i++) {
      final row = document.createElement("div");
      row.className = "row";
      board.append(row);
      for (var j = 0; j < 8; j++) {
        final tile = document.createElement("button");
        tile.className = "tile";
        final r = Utils.intToRow(i);
        final c = Utils.intToCol(j);
        tile.addEventListener("click", (e)=> handler({'row': r, 'col': c}));
        row.append(tile);
        tiles[r.value]?[c.name] = tile;
      }
    }
    return tiles;
  }

  static getInitialBoardState(Function construct) {
    blankRow() => {
          'A': construct(),
          'B': construct(),
          'C': construct(),
          'D': construct(),
          'E': construct(),
          'F': construct(),
          'G': construct(),
          'H': construct(),
        };
    return {
      1: ({}, blankRow()),
      2: ({}, blankRow()),
      3: ({}, blankRow()),
      4: ({}, blankRow()),
      5: ({}, blankRow()),
      6: ({}, blankRow()),
      7: ({}, blankRow()),
      8: ({}, blankRow()),
    };
  }

  static getInitialPiecePositions() => {
        'A8': {'active': true, 'row': Row.eight, 'col': Col.A},
        'B8': {'active': true, 'row': Row.eight, 'col': Col.B},
        'C8': {'active': true, 'row': Row.eight, 'col': Col.C},
        'D8': {'active': true, 'row': Row.eight, 'col': Col.D},
        'E8': {'active': true, 'row': Row.eight, 'col': Col.E},
        'F8': {'active': true, 'row': Row.eight, 'col': Col.F},
        'G8': {'active': true, 'row': Row.eight, 'col': Col.G},
        'H8': {'active': true, 'row': Row.eight, 'col': Col.H},
        'A7': {'active': true, 'row': Row.seven, 'col': Col.A},
        'B7': {'active': true, 'row': Row.seven, 'col': Col.B},
        'C7': {'active': true, 'row': Row.seven, 'col': Col.C},
        'D7': {'active': true, 'row': Row.seven, 'col': Col.D},
        'E7': {'active': true, 'row': Row.seven, 'col': Col.E},
        'F7': {'active': true, 'row': Row.seven, 'col': Col.F},
        'G7': {'active': true, 'row': Row.seven, 'col': Col.G},
        'H7': {'active': true, 'row': Row.seven, 'col': Col.H},
        'A2': {'active': true, 'row': Row.two, 'col': Col.A},
        'B2': {'active': true, 'row': Row.two, 'col': Col.B},
        'C2': {'active': true, 'row': Row.two, 'col': Col.C},
        'D2': {'active': true, 'row': Row.two, 'col': Col.D},
        'E2': {'active': true, 'row': Row.two, 'col': Col.E},
        'F2': {'active': true, 'row': Row.two, 'col': Col.F},
        'G2': {'active': true, 'row': Row.two, 'col': Col.G},
        'H2': {'active': true, 'row': Row.two, 'col': Col.H},
        'A1': {'active': true, 'row': Row.one, 'col': Col.A},
        'B1': {'active': true, 'row': Row.one, 'col': Col.B},
        'C1': {'active': true, 'row': Row.one, 'col': Col.C},
        'D1': {'active': true, 'row': Row.one, 'col': Col.D},
        'E1': {'active': true, 'row': Row.one, 'col': Col.E},
        'F1': {'active': true, 'row': Row.one, 'col': Col.F},
        'G1': {'active': true, 'row': Row.one, 'col': Col.G},
        'H1': {'active': true, 'row': Row.one, 'col': Col.H},
      };
  static getInitialPieces() => {
        // White Pieces
        'A1': ChessPiece(id: "A1", player: Player.white, type: Piece.rook),
        'B1': ChessPiece(id: "B1", player: Player.white, type: Piece.knight),
        'C1': ChessPiece(id: "C1", player: Player.white, type: Piece.bishop),
        'D1': ChessPiece(id: "D1", player: Player.white, type: Piece.queen),
        'E1': ChessPiece(id: "E1", player: Player.white, type: Piece.king),
        'F1': ChessPiece(id: "F1", player: Player.white, type: Piece.bishop),
        'G1': ChessPiece(id: "G1", player: Player.white, type: Piece.knight),
        'H1': ChessPiece(id: "H1", player: Player.white, type: Piece.rook),
        'A2': ChessPiece(id: "A2", player: Player.white, type: Piece.pawn),
        'B2': ChessPiece(id: "B2", player: Player.white, type: Piece.pawn),
        'C2': ChessPiece(id: "C2", player: Player.white, type: Piece.pawn),
        'D2': ChessPiece(id: "D2", player: Player.white, type: Piece.pawn),
        'E2': ChessPiece(id: "E2", player: Player.white, type: Piece.pawn),
        'F2': ChessPiece(id: "F2", player: Player.white, type: Piece.pawn),
        'G2': ChessPiece(id: "G2", player: Player.white, type: Piece.pawn),
        'H2': ChessPiece(id: "H2", player: Player.white, type: Piece.pawn),

        // Black Pieces
        'A8': ChessPiece(id: "A8", player: Player.black, type: Piece.rook),
        'B8': ChessPiece(id: "B8", player: Player.black, type: Piece.knight),
        'C8': ChessPiece(id: "C8", player: Player.black, type: Piece.bishop),
        'D8': ChessPiece(id: "D8", player: Player.black, type: Piece.queen),
        'E8': ChessPiece(id: "E8", player: Player.black, type: Piece.king),
        'F8': ChessPiece(id: "F8", player: Player.black, type: Piece.bishop),
        'G8': ChessPiece(id: "G8", player: Player.black, type: Piece.knight),
        'H8': ChessPiece(id: "H8", player: Player.black, type: Piece.rook),
        'A7': ChessPiece(id: "A7", player: Player.black, type: Piece.pawn),
        'B7': ChessPiece(id: "B7", player: Player.black, type: Piece.pawn),
        'C7': ChessPiece(id: "C7", player: Player.black, type: Piece.pawn),
        'D7': ChessPiece(id: "D7", player: Player.black, type: Piece.pawn),
        'E7': ChessPiece(id: "E7", player: Player.black, type: Piece.pawn),
        'F7': ChessPiece(id: "F7", player: Player.black, type: Piece.pawn),
        'G7': ChessPiece(id: "G7", player: Player.black, type: Piece.pawn),
        'H7': ChessPiece(id: "H7", player: Player.black, type: Piece.pawn),
      };
}
// const initialPositions = Utils.getInitialPiecePositions();