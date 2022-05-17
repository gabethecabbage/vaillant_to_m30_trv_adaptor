include <openscad/polyScrewThread.scad>
include <valve_vars.scad>

difference() {
    cylinder(thread_length_circo+pin_inner_height,pin_outer_diameter/2,pin_outer_diameter/2,$fn=10);
    translate([0, 0, thread_length_circo]) cylinder(pin_inner_height,pin_inner_diameter/2,pin_inner_diameter/2,$fn=10);
 }
