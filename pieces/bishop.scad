// pieces/bishop.scad — Bob the Bishop (~65 mm tall)
// To preview standalone, open in OpenSCAD and add  bishop();  below.
include <../common.scad>

module bishop_mitre(base_d, h=16) {
    // Pointed bishop's hat: tapered hull from disc base to tip sphere
    hull() {
        cylinder(d=base_d, h=2);
        translate([0, 0, h]) sphere(r=1.8, $fn=16);
    }
    // Horizontal band around the hat brim
    translate([0, 0, 1])
        difference() {
            cylinder(d=base_d+2, h=2.5);
            translate([0, 0, -0.1]) cylinder(d=base_d-1, h=2.7);
        }
}

module bishop() {
    // Base
    chess_base();

    // Stocky body
    translate([0, 0, BASE_H])
        stocky_body(h=22, d_bot=BASE_D*0.84, d_top=BASE_D*0.52);

    // Neck
    translate([0, 0, BASE_H+22])
        taper_neck(h=4, d_bot=BASE_D*0.52, d_top=BASE_D*0.38);

    // Head with goatee
    head_r = 7;
    head_z = BASE_H + 26 + head_r;   // 38 mm
    translate([0, 0, head_z]) {
        sphere(r=head_r);
        goatee(head_r);
    }

    // Mitre hat
    translate([0, 0, head_z + head_r*1.5])
        bishop_mitre(base_d=head_r*1.8, h=17);
}
