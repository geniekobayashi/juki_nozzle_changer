// Joint parts for nozzle changer
// by Genie Kibayashi, July 2016

$fn = 32;
M3 = 3.6;
thickness = 1.75;

difference(){
cube([49-0.4,14-0.4,thickness]);
translate([41.8,6.8,-4])  cylinder(h=10, r=M3/2);
}

translate([0,20,0])
cube([17-0.4,10-0.4,thickness]);