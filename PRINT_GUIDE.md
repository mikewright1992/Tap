# Bob's Chess Set — Bambu A1 Mini Print Guide

## Files

| File | Piece | Height | Notes |
|------|-------|--------|-------|
| `pieces/pawn.scad` | Pawn | ~38 mm | Bob in a backwards snapback |
| `pieces/rook.scad` | Rook | ~44 mm | Crenellated castle tower |
| `pieces/bishop.scad` | Bishop | ~65 mm | Bishop's mitre hat + goatee |
| `pieces/knight.scad` | Knight | ~54 mm | Geometric horse head profile |
| `pieces/queen.scad` | Queen | ~70 mm | Orb crown + goatee |
| `pieces/king.scad` | King | ~82 mm | Crown with hidden cap brim + cross |
| `chess_set.scad` | All | — | Preview layout of all 6 types |

## Exporting STL from OpenSCAD

1. Open `chess_set.scad` in [OpenSCAD](https://openscad.org)
2. To export a single piece, open its file and add e.g. `pawn();` at the bottom
3. Press **F6** to render (not F5 — F5 is preview only)
4. **File → Export → Export as STL**
5. Repeat for each piece type

## Bambu A1 Mini Settings (Bambu Studio)

| Setting | Value |
|---------|-------|
| Nozzle | 0.4 mm |
| Layer height | 0.2 mm (Standard) |
| Infill | 15% Gyroid |
| Supports | None needed (all pieces designed to be support-free) |
| Brim | 5 mm recommended for tall pieces (bishop, queen, king) |
| Material | PLA or PETG |

## Suggested Two-Color Print

Print two full sets — one in white PLA, one in black PLA — for a complete game.

If you want to do multi-color accents (goatees, cap brims), use the A1 Mini's filament switching
and split the model at the relevant Z height in Bambu Studio's **Cut** tool.

## Face Scan Insert (Optional)

Each piece has a `face_socket()` recess at the top of the head sphere (16 mm diameter, 4 mm deep).
To use Bob's actual face:
1. Scan Bob with **Polycam** or **Luma AI** (free apps)
2. Export the face mesh as OBJ/STL
3. Scale to 16 mm diameter and import into the piece file
4. Union or glue the scan into the socket

## Quantities for a Full Set

| Piece | Count per side | Total (both colors) |
|-------|---------------|---------------------|
| Pawn | 8 | 16 |
| Rook | 2 | 4 |
| Bishop | 2 | 4 |
| Knight | 2 | 4 |
| Queen | 1 | 2 |
| King | 1 | 2 |
| **Total** | **16** | **32** |
