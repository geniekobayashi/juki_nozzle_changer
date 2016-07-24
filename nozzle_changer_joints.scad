// Joint parts for nozzle changer
// by Genie Kibayashi, July 2016

$fn = 32;
M3 = 3.6;
thickness = 1.8;


difference(){
minkowski()
 {
 cube([46-0.8,11-0.4,thickness-1]);
 cylinder(r=1.5,h=1);
 }
translate([41.8-1.5,6.8-1.5,-4])
cylinder(h=10, r=M3/2);
}

translate([0,20,0])
minkowski()
{
 cube([14-0.8,7-0.4,thickness-1]);
 cylinder(r=1.5,h=1);
}