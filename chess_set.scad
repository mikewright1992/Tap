// chess_set.scad — Bob's Chess Set, all piece types side by side
// Open this file in OpenSCAD (F5 preview, F6 render, then File > Export > STL per piece).
// To export a single piece, open its file in pieces/ and add the module call at the bottom.
include <pieces/pawn.scad>
include <pieces/rook.scad>
include <pieces/bishop.scad>
include <pieces/knight.scad>
include <pieces/queen.scad>
include <pieces/king.scad>

sp = 42;  // spacing between pieces (mm)

pawn();
translate([sp*1, 0, 0]) rook();
translate([sp*2, 0, 0]) bishop();
translate([sp*3, 0, 0]) knight();
translate([sp*4, 0, 0]) queen();
translate([sp*5, 0, 0]) king();
