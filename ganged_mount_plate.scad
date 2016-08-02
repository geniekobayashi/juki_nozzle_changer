// JUKI 50x nozzle changer w/Ray's holder
// ganged unit mount plate
// by Genie Kobayashi, July 2016
//
// OpenPnP project - http://openpnp.org/

$fn=128;

gang = 3; // 2 or more changer units

margin = 0.3; // 3D printer nozzle dia.
thickness = 25/2+margin; // changer half body

M3 = 3.0/2; // M3 screw tap hole - M3 socket cap hex screw x 3 @ each

// base plate fixing holes
M4 = 4.5/2;
offset = 8; // 16 to move near center - M4 pan-head screw x 4


module nozzle_changer_half(){

// body
rotate([90,0,0]) translate([-12,-30,0])
linear_extrude(height = thickness, convexity = 5) // base
	polygon(points = [ [0-margin, -3],[0-margin, 30],[32, 30],[65+margin, 28],
	[65+margin, -3],
]);

//M3
translate([-8,-8,-45])  cylinder(h=40, r=M3);
//translate([-8,-8,-3.5])  cylinder(h=10, r=6.2/2);

translate([30+10,0,-45])  cylinder(h=30, r=M3);
//translate([30+10,0,-27.6-1])  cylinder(h=5, r=6.5/2);
}

module nozzle_changer(){

nozzle_changer_half();

mirror([0,1,0])
nozzle_changer_half();
}


difference(){
// outline
hull(){
translate([-13,-gang*(thickness-margin)-1.5,-39])
cylinder(h=7.5,r1=3,r2=1.5);

translate([54,-gang*(thickness-margin)-1.5,-39])
cylinder(h=7.5,r1=3,r2=1.5);

translate([-13,gang*(thickness-margin)+1.5,-39])
cylinder(h=7.5,r1=3,r2=1.5);

translate([54,gang*(thickness-margin)+1.5,-39])
cylinder(h=7.5,r1=3,r2=1.5);
  }

for (i = [0:2*thickness-margin:(gang-1)*2*thickness]) {
 translate([0,-(gang-1)*thickness+i,0])
 nozzle_changer();
 }

// M4 fixing holes
translate([-8+offset,-16,-40])
cylinder(h=9,r=M4);

translate([8+offset,-16,-40])
cylinder(h=9,r=M4);

translate([-8+offset,16,-40])
cylinder(h=9,r=M4);

translate([8+offset,16,-40])
cylinder(h=9,r=M4);

// M4 head sink
translate([-8+offset,-16,-36])
cylinder(h=3,r=9.6/2);

translate([8+offset,-16,-36])
cylinder(h=3,r=9.6/2);

translate([-8+offset,16,-36])
cylinder(h=3,r=9.6/2);

translate([8+offset,16,-36])
cylinder(h=3,r=9.6/2);
}


