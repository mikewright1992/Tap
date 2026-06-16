// pieces/queen.scad — Bob the Queen (~70 mm tall)
// To preview standalone, open in OpenSCAD and add  queen();  below.
include <../common.scad>

module queen_crown(d) {
    r = d / 2;
    ball_r = 2.5;

    // Crown ring
    difference() {
        cylinder(d=d, h=5);
        translate([0, 0, -0.1]) cylinder(d=d-6, h=5.2);
    }

    // 5 orb-topped crown points
    for(i=[0:4]) {
        rotate([0, 0, i*72])
            translate([r - ball_r*0.7, 0, 5 + ball_r])
                sphere(r=ball_r, $fn=24);
    }
}

module queen() {
    // Base
    chess_base();

    // Stocky body
    translate([0, 0, BASE_H])
        stocky_body(h=30, d_bot=BASE_D*0.84, d_top=BASE_D*0.54);

    // Neck
    translate([0, 0, BASE_H+30])
        taper_neck(h=5, d_bot=BASE_D*0.54, d_top=BASE_D*0.40);

    // Head with goatee
    head_r = 8;
    head_z = BASE_H + 35 + head_r;   // 48 mm
    translate([0, 0, head_z]) {
        sphere(r=head_r);
        goatee(head_r);
    }

    // Crown
    translate([0, 0, head_z + head_r*1.45])
        queen_crown(d=head_r*2.3);
}
