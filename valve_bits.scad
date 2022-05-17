include <openscad/polyScrewThread.scad>
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

module rkey(x, z) {
    rotate([90,90,0]) 
    prismoid(size1=[z,x], size2=[0,x], h=z);
}

module lkey(x, z) {
    rotate([90,90,180]) 
    prismoid(size1=[z,x], size2=[0,x], h=z);
}

module vailant_head (outer_diameter,
                     thread_length_circo,
                     thread_length_thermostat,
                     valve_diameter,
                     pitch,
                     thread_diameter,
                     pairing_start,
                     pairing_diameter,
                     pin_diameter) {

    pairing_width=thread_length_circo-pairing_start;
    union() {
        difference() {
            union() {
            // Bottom Thread
            screw_thread(outer_diameter,pitch,30,thread_length_circo,3.141592/2,2);
            cylinder(1,outer_diameter/2,outer_diameter/2-pitch);
            }
            union() {
                translate([0,0,pairing_start])
                    cylinder(pairing_width,pairing_diameter/2,pairing_diameter/2);
                cylinder(thread_length_circo,valve_diameter/2,valve_diameter/2);
                cylinder(pairing_start/2,pairing_diameter/2,valve_diameter/2);
            }
    }
    
     translate([0,0,thread_length_circo-0.5])
        difference() {
            cylinder(3,(outer_diameter-3)/2,(thread_diameter-pitch)/2);
            cylinder(3,pairing_diameter/2,(pairing_diameter/2-5));
        }
    
     translate([0,0,thread_length_circo+2.5])
        difference() {
              screw_thread(thread_diameter,pitch,30,thread_length_thermostat,3.141592/2,2);
               cylinder(thread_length_thermostat,pairing_diameter/2-5,(pin_diameter+1));
        }
    }
}