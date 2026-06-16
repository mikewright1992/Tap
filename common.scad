// common.scad — Bob's Chess Set shared modules
$fn = 64;

BASE_D = 32;
BASE_H = 5;

// Tapered base disc
module chess_base(d=BASE_D, h=BASE_H) {
    cylinder(d1=d, d2=d*0.88, h=h);
}

// Bob's stocky barrel body — bulges at 38% height
module stocky_body(h, d_bot, d_top) {
    hull() {
        cylinder(d=d_bot, h=0.1);
        translate([0, 0, h*0.38]) cylinder(d=d_bot*1.08, h=0.1);
        translate([0, 0, h]) cylinder(d=d_top, h=0.1);
    }
}

// Simple tapered neck
module taper_neck(h, d_bot, d_top) {
    cylinder(d1=d_bot, d2=d_top, h=h);
}

// Bob's goatee — small chin beard on the front (+Y) of a sphere of radius r
// Place this at the same origin as the head sphere
module goatee(r) {
    translate([0, r*0.70, -r*0.40])
        scale([0.48, 0.22, 0.36])
            sphere(r=r, $fn=32);
}

// Snapback cap dome — sits on top of a sphere of radius r, centered at z=0
module cap_dome(r) {
    cut_below_equator = r * 0.20;
    difference() {
        sphere(r=r*1.05, $fn=48);
        translate([0, 0, -(r*1.05*2 + cut_below_equator)])
            cylinder(r=r*4, h=r*1.05*2 + cut_below_equator, $fn=8);
    }
}

// Forward-facing cap brim in the +Y direction, positioned at z=z_offset
module cap_brim(r, brim_proj=9, thick=2.5, z_offset=0) {
    translate([0, 0, z_offset])
        linear_extrude(height=thick, center=true)
            intersection() {
                hull() {
                    circle(r=r, $fn=64);
                    translate([0, brim_proj, 0]) circle(r=r*0.25, $fn=24);
                }
                // Keep only the forward (+Y) portion
                translate([-(r+1), 0]) square([r*2+2, r+brim_proj+1]);
            }
}

// Backwards snapback — cap dome + rear brim + adjustment strap nub
// Centered at z=0 (place at head sphere center)
module backwards_snapback(r) {
    cap_dome(r);
    // Brim points in -Y (backwards)
    brim_z = r * 0.10;
    translate([0, 0, brim_z])
        linear_extrude(height=2.5, center=true)
            intersection() {
                hull() {
                    circle(r=r*1.05, $fn=64);
                    translate([0, -8, 0]) circle(r=r*0.22, $fn=24);
                }
                translate([-(r*1.05+1), -(r*1.05+9)]) square([r*2.1+2, r*1.05+9]);
            }
    // Adjustment strap at front
    translate([0, r*0.92, brim_z])
        scale([0.28, 0.10, 0.14]) sphere(r=r, $fn=16);
}

// Optional socket recess at top of piece for a face-scan mesh insert
module face_socket(insert_d=16, depth=4) {
    translate([0, 0, -0.1])
        cylinder(d=insert_d, h=depth+0.1);
}
