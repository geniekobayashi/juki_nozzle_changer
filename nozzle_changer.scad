// JUKI nozzle 50x changer w/Ray's holder
// by Genie Kobayashi, July 2016
//
// Reference to https://vimeo.com/144454866
// Pick-and-place automatic nozzle changer
// designed by Karl Ekdahl.

$fn=128;

slide = 55;
thickness = 25/2;

r_margin = 0.4; // 3D printer nozzle dia.
h_margin = r_margin *2;

M3 = 3.4;

 module nozzle_movement(){

hull(){
     translate([0,0,-35.9+0.1+9]) cylinder(h=16, r=10/2+r_margin);
     translate([slide,0,-35.9+0.1+9]) cylinder(h=16, r=10/2+r_margin);
}
//         color("green")
hull(){
     translate([0,0,-11.4-1-h_margin/2]) cylinder(h=1.3+h_margin, r1=10/2+r_margin, r2=12/2+r_margin);
     translate([20,0,-11.4-h_margin/2]) cylinder(h=1.3+h_margin, r1=10/2+r_margin, r2=12/2+r_margin);
}
hull(){
     translate([20,0,-11.4-h_margin/2]) cylinder(h=1.3+h_margin, r1=10/2+r_margin, r2=12/2+r_margin);
     translate([slide,0,-11.4-h_margin/2]) cylinder(h=1.3+h_margin, r1=10/2+r_margin, r2=12/2+r_margin);
}
//         color("green")
hull(){
     translate([0,0,-10.1-1-h_margin/2]) cylinder(h=3.5+h_margin, r=12/2+r_margin);
     translate([20,0,-10.1-h_margin/2]) cylinder(h=3.5+h_margin, r=12/2+r_margin);
}
hull(){
     translate([20,0,-10.1-h_margin/2]) cylinder(h=3.5+h_margin, r=12/2+r_margin);
     translate([slide,0,-10.1-h_margin/2]) cylinder(h=3.5+h_margin, r=12/2+r_margin);
}
//     color("green")
hull(){
     translate([0,0,-6.6-1-h_margin/2]) cylinder(h=1.6+h_margin, r=16/2+r_margin);
     translate([20,0,-6.6-h_margin/2]) cylinder(h=1.6+h_margin, r=16/2+r_margin);
}
hull(){
     translate([20,0,-6.6-h_margin/2]) cylinder(h=1.6+h_margin, r=16/2+r_margin);
     translate([slide,0,-6.6-h_margin/2]) cylinder(h=1.6+h_margin, r=16/2+r_margin);
}
 
hull(){
     translate([0,0,-5-1-h_margin/2]) cylinder(h=15+h_margin, r=10/2+r_margin);
     translate([20,0,-5-h_margin/2]) cylinder(h=15+h_margin, r=10/2+r_margin);
}
hull(){
     translate([20,0,-5-h_margin/2]) cylinder(h=15+h_margin, r=10/2+r_margin);
     translate([slide,0,-5-h_margin/2]) cylinder(h=15+h_margin, r=10/2+r_margin);
 }
}

module nozzle_changer_part(){
difference(){
// body
union(){
rotate([90,0,0]) translate([-12,-30,0])
linear_extrude(height = thickness, convexity = 5) // base
	polygon(points = [ [0, -3],[0, 30],[32, 30],[65, 28],
	[65, -3],
]);

}

nozzle_movement();

// mouth
hull(){
     translate([slide-8,0,-6.6-h_margin/2+1.2]) cube([1,16+2*r_margin,1.6+h_margin],center=true);
     translate([slide-1.5,0,-6.6-h_margin/2+1.2]) cube([1,17+2*r_margin,2.6+h_margin],center=true);
}

// joints
translate([-2,-7,-30-1])
cube([37+12,10,2.4]); // T2

translate([-10,-5,-30])
cube([2.4,10,17]); // T2

//M3
     translate([-8,-8,-35])  cylinder(h=40, r=M3/2);
     translate([-8,-8,-3.5])  cylinder(h=10, r=6.2/2);

translate([30+10,0,-35])  cylinder(h=10, r=M3/2);
translate([30+10,0,-27.6-1])  cylinder(h=5, r=6.5/2);
 }
}


rotate([90,0,0])
nozzle_changer_part();

// uncomment following lines for 2 pcs print at once

//mirror([0,0,1]) translate([0,-5,0]) rotate([270,0,0])
//nozzle_changer_part();

