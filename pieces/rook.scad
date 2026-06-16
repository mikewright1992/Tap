// pieces/rook.scad — Bob the Rook (~44 mm tall)
// To preview standalone, open in OpenSCAD and add  rook();  below.
include <../common.scad>

module rook_top(d, h=14) {
    wall = 3;
    gap_w = d * 0.30;
    difference() {
        cylinder(d=d, h=h);
        // Hollow interior
        translate([0, 0, -0.1]) cylinder(d=d - wall*2, h=h+0.2);
        // 4 crenellation gaps cut into the upper half
        for(i=[0:3]) {
            rotate([0, 0, i*90+45])
                translate([0, 0, h*0.45-0.1])
                    linear_extrude(height=h*0.6+0.2)
                        square([d+2, gap_w], center=true);
        }
    }
}

module rook() {
    // Base
    chess_base();

    // Stocky body
    translate([0, 0, BASE_H])
        stocky_body(h=22, d_bot=BASE_D*0.84, d_top=BASE_D*0.70);

    // Ledge platform
    translate([0, 0, BASE_H+22])
        cylinder(d=BASE_D*0.76, h=3);

    // Crenellated tower
    translate([0, 0, BASE_H+25])
        rook_top(d=BASE_D*0.72, h=14);
}
