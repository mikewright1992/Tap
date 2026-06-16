// pieces/king.scad — Bob the King (~82 mm tall)
// To preview standalone, open in OpenSCAD and add  king();  below.
include <../common.scad>

module king_crown(d) {
    r = d / 2;

    // Crown ring with brim (Bob's cap peeking out underneath)
    difference() {
        cylinder(d=d, h=5);
        translate([0, 0, -0.1]) cylinder(d=d-6, h=5.2);
    }

    // Forward cap brim under the crown ring (Bob always has his cap on)
    cap_brim(r=r*1.05, brim_proj=8, thick=2, z_offset=2);

    // 5 tapered tines
    for(i=[0:4]) {
        rotate([0, 0, i*72])
            translate([r-2.5, 0, 5])
                cylinder(d1=4.5, d2=1.5, h=10, $fn=16);
    }

    // Cross: vertical post + horizontal arm
    translate([0, 0, 5]) {
        cylinder(d=2, h=14, $fn=8);
        translate([0, 0, 9]) cube([11, 2, 2], center=true);
    }
}

module king() {
    // Base
    chess_base();

    // Stocky body — tallest, widest
    translate([0, 0, BASE_H])
        stocky_body(h=30, d_bot=BASE_D*0.84, d_top=BASE_D*0.55);

    // Neck
    translate([0, 0, BASE_H+30])
        taper_neck(h=5, d_bot=BASE_D*0.55, d_top=BASE_D*0.42);

    // Head with goatee
    head_r = 9;
    head_z = BASE_H + 35 + head_r;   // 49 mm
    translate([0, 0, head_z]) {
        sphere(r=head_r);
        goatee(head_r);
    }

    // Crown
    translate([0, 0, head_z + head_r*1.5])
        king_crown(d=head_r*2.4);
}
