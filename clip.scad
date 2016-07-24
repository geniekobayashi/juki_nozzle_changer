// Clip parts for nozzle changer
// by Genie Kibayashi, July 2016

$fn=128;
r_margin = 0.4;

//T2
module clip(){
difference(){
cylinder(h=2, r=8, $fn=6);

translate([0,0,-1])
cylinder(h=4, r=10/2+r_margin/2);

translate([4.8,0,-1])
cylinder(h=4, r=6, $fn=8);
 }
}

for (i = [0:20:20]) 
 for (j = [0:20:20]) {
translate([i,j,0])
clip();
}