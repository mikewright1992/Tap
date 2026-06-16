// pieces/pawn.scad — Bob the Pawn (~38 mm tall)
// To preview standalone, open in OpenSCAD and add  pawn();  below.
include <../common.scad>

module pawn() {
    // Base
    chess_base();

    // Stocky Bob body
    translate([0, 0, BASE_H])
        stocky_body(h=15, d_bot=BASE_D*0.82, d_top=BASE_D*0.50);

    // Neck
    translate([0, 0, BASE_H+15])
        taper_neck(h=4, d_bot=BASE_D*0.50, d_top=BASE_D*0.40);

    // Head — round & wide, goatee, backwards cap
    head_r = 7;
    head_z = BASE_H + 19 + head_r;   // 31 mm
    translate([0, 0, head_z]) {
        sphere(r=head_r);
        goatee(head_r);
        backwards_snapback(head_r);
    }
}
