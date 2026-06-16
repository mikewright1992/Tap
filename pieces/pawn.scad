// pieces/pawn.scad — Bob the Pawn (~38 mm tall)
// To preview standalone, open in OpenSCAD and add  pawn();  below.
include <../common.scad>

// Snap-back brim held flat against the lower face — Bob's signature move.
// Place this at the head sphere center (same origin as the head sphere).
module face_bill(r) {
    // Flat half-disc angled to lean against the face (+Y front, -Z lower)
    translate([0, r*0.52, -r*0.38])
        rotate([-28, 0, 0])
            linear_extrude(height=2.8, center=true)
                intersection() {
                    circle(r=r*1.18, $fn=64);
                    // Keep only the forward (+Y) half
                    translate([-(r*1.18+1), 0])
                        square([r*2.36+2, r*1.18+1]);
                }
}

module pawn() {
    // Base
    chess_base();

    // Stocky Bob body
    translate([0, 0, BASE_H])
        stocky_body(h=15, d_bot=BASE_D*0.82, d_top=BASE_D*0.50);

    // Neck
    translate([0, 0, BASE_H+15])
        taper_neck(h=4, d_bot=BASE_D*0.50, d_top=BASE_D*0.40);

    // Head — backwards cap + truck bill held against lower face
    head_r = 7;
    head_z = BASE_H + 19 + head_r;   // 31 mm
    translate([0, 0, head_z]) {
        sphere(r=head_r);
        backwards_snapback(head_r);
        face_bill(head_r);
    }
}
