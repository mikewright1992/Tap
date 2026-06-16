// pieces/knight.scad — Bob the Knight (~54 mm tall)
// To preview standalone, open in OpenSCAD and add  knight();  below.
//
// Horse head is a 2D polygon extruded in Y (10 mm deep).
// Profile is in the XZ plane after rotate([90,0,0]):
//   polygon X → piece X (left/right), polygon Y → piece Z (height).
include <../common.scad>

module knight_head_2d() {
    // Horse-head silhouette; bounding box ~ X[-3,14], Y[0,24]
    polygon([
        [0,  0],    // neck base left
        [10, 0],    // neck base right
        [10, 5],    // shoulder
        [14, 10],   // chin
        [14, 15],   // nose tip
        [11, 17],   // nostril
        [7,  16],   // snout top
        [4,  20],   // forehead
        [0,  24],   // crown
        [-3, 20],   // back of head
        [-1, 14],   // nape
        [-2, 7],    // neck back
    ]);
}

module knight() {
    // Base
    chess_base();

    // Stocky body
    translate([0, 0, BASE_H])
        stocky_body(h=22, d_bot=BASE_D*0.84, d_top=BASE_D*0.65);

    // Saddle platform
    translate([0, 0, BASE_H+22])
        cylinder(d=BASE_D*0.65, h=3);

    // Horse head — profile extrusion, centered in Y, sitting on saddle
    head_w = 10;
    translate([-5.5, 0, BASE_H+25])
        rotate([90, 0, 0])
            linear_extrude(height=head_w, center=true)
                knight_head_2d();
}
