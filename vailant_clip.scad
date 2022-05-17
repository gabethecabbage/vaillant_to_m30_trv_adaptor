include <openscad/polyScrewThread.scad>

outer_diameter=38;
thread_length_circo=14;
thread_length_thermostat=7;

valve_diameter=27.5;
pitch=1.5;
thread_diiameter=30  +2*pitch*tan(30)/8;
echo (thread_diiameter);
pairing_start=2;
pairing_width=thread_length_circo-pairing_start;
pairing_diameter=31;

pin_diameter=3.2;

union() {
difference() {
    union() {
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
        cylinder(3,(outer_diameter-3)/2,(thread_diiameter-pitch)/2);
        cylinder(3,pairing_diameter/2,(pairing_diameter/2-5));
    }
 
 translate([0,0,thread_length_circo+2.5])
    difference() {
          screw_thread(thread_diiameter,pitch,30,thread_length_thermostat,3.141592/2,2);
           cylinder(thread_length_thermostat,pairing_diameter/2-5,(pin_diameter+1));
    }
}
