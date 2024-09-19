// class Utils {
//   // Board constants
//   static const List<String> COLS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
//   static const List<String> ROWS = ['1', '2', '3', '4', '5', '6', '7', '8'];

//   /// Converts a column letter to its corresponding index.
//   static int colToInt(String col) {
//     return COLS.indexOf(col);
//   }

//   /// Converts a row number to its corresponding index.
//   static int rowToInt(String row) {
//     return ROWS.indexOf(row);
//   }

//   /// Converts a column index to its corresponding letter.
//   static String intToCol(int index) {
//     return COLS[index];
//   }

//   /// Converts a row index to its corresponding number.
//   static String intToRow(int index) {
//     return ROWS[index];
//   }

//   /// Parses a short code to generate piece positions.
//   static Map<String, dynamic> getPositionsFromShortCode(String shortCode) {
//     var positions = getInitialPiecePositions();
//     Map<String, dynamic> overrides = {};

//     bool defaultPositionMode = shortCode.startsWith('X');
//     if (defaultPositionMode) {
//       shortCode = shortCode.substring(1);
//     }

//     List<String> shortCodePieces = shortCode.split(',');

//     for (var string in shortCodePieces) {
//       bool promoted = string.startsWith('P');
//       if (promoted) {
//         string = string.substring(1);
//       }

//       if (defaultPositionMode) {
//         bool inactive = string.length == 3;
//         String id = string.substring(0, 2);
//         String? col = !inactive ? string[2] : null;
//         String? row = !inactive ? string[3] : null;
//         int moves = int.parse(string.length >= 5 ? string[4] : '1');

//         overrides[id] = {
//           'col': col,
//           'row': row,
//           'active': !inactive,
//           '_moves': moves,
//           '_promoted': promoted
//         };
//       } else {
//         bool moved = string.length >= 4;
//         String id = string.substring(0, 2);
//         String col = string[moved ? 2 : 0];
//         String row = string[moved ? 3 : 1];
//         int moves = int.parse(string.length >= 5 ? string[4] : moved ? '1' : '0');

//         overrides[id] = {
//           'col': col,
//           'row': row,
//           'active': true,
//           '_moves': moves,
//           '_promoted': promoted
//         };
//       }
//     }

//     positions.forEach((id, _) {
//       if (overrides.containsKey(id)) {
//         positions[id] = overrides[id];
//       } else {
//         positions[id] = defaultPositionMode ? positions[id] : {'active': false};
//       }
//     });

//     return positions;
//   }

//   /// Generates the initial positions of the pieces.
//   static Map<String, Map<String, dynamic>> getInitialPiecePositions() {
//     return {
//       'A8': {'active': true, 'row': '8', 'col': 'A'},
//       'B8': {'active': true, 'row': '8', 'col': 'B'},
//       // Continue for other pieces
//       // Add pieces for rows 1-8 and columns A-H
//     };
//   }

//   /// Generates the initial state of the board tiles.
//   static Map<String, Map<String, dynamic>> getInitialBoardState([ Function? construct]) {

//     Map<String, dynamic> blankRow() {
//       return {
//         'A': construct(),
//         'B': construct(),
//         'C': construct(),
//         'D': construct(),
//         'E': construct(),
//         'F': construct(),
//         'G': construct(),
//         'H': construct(),
//       };
//     }

//     return {
//       '1': blankRow(),
//       '2': blankRow(),
//       '3': blankRow(),
//       '4': blankRow(),
//       '5': blankRow(),
//       '6': blankRow(),
//       '7': blankRow(),
//       '8': blankRow(),
//     };
//   }

//   /// Generates the initial pieces on the board.
//   static Map<String, dynamic> getInitialPieces() {
//     return {
//       'A8': Piece(id: 'A8', player: 'BLACK', type: 'ROOK'),
//       'B8': Piece(id: 'B8', player: 'BLACK', type: 'KNIGHT'),
//       // Continue for all pieces
//     };
//   }
// }

// class Piece {
//   final String id;
//   final String player;
//   final String type;

//   Piece({required this.id, required this.player, required this.type});
// }
