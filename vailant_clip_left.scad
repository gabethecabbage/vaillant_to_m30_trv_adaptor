include <valve_vars.scad>
use <valve_bits.scad>

difference() {
    // Adaptor body peice
    vailant_head(outer_diameter,
                 thread_length_circo,
                 thread_length_thermostat,
                 valve_diameter,
                 pitch,
                 thread_diameter,
                 pairing_start,
                 pairing_diameter,
                 pin_outer_diameter);
    // Diff out a right facing key peice
    translate([19, 0, 7.5])  rkey(10, 5);
    // Diff all right hand side except for a left facing key
    difference() {
        translate([-25, 0, 0]) cube([50, 30, 30]);
        translate([-19, 0, 7.5]) lkey(10, 4.75);
    }
}   
