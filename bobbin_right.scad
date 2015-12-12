include <shared.scad>;

module bobbin_right(  {
  difference() {
    difference() {
      union() {
        cylinder(h=2, r=coil_radius+slot_depth, $fn=100);
        cylinder(h=6, r=coil_radius-5, $fn=100);
      }
      translate([0,0,-1])
        cylinder(h=8, r=coil_radius-7, $fn=100);
    }
    for(x=[0:45:360])
      render() difference() {
        rotate([0,0,x])
        translate([0,0,-3])
          wedge(8, coil_radius+(slot_depth*0.8), 40);
        translate([0,0,-3])
          cylinder(h=8, r=coil_radius, $fn=100);
      }
  }
}

module data_plate() {
  difference() {
    cylinder(h=1, r=coil_radius-6, $fn=100);
    translate([-250,-(coil_radius-35),-1])
      cube([500,500,8]);
  }
  linear_extrude(height = 2) {
    if(coil_radius < 50) { 
      rotate([0,0,180])
        translate([-20,coil_radius-21,1])
        text(text = str("Length: ", coil_length, "mm"), size = 5, $fn=100);
      rotate([0,0,180])
        translate([-25,coil_radius-28,1])
        text(text = str("Diameter: ", coil_radius*2, "mm"), size = 5, $fn=100);
      rotate([0,0,180])
        translate([-26,coil_radius-34,1])
        text(text = "maketronica.com", size = 5, $fn=100);
    } else if(coil_radius < 65) {
      rotate([0,0,180])
        translate([-25.5,coil_radius-20,1])
        text(text = "maketronica.com", size = 5, $fn=100);
      rotate([0,0,180])
        translate([-26,coil_radius-27,1])
        text(text = str("Coil Length: ", coil_length, "mm"), size = 5, $fn=100);
      rotate([0,0,180])
        translate([-35,coil_radius-34,1])
        text(text = str("Coil Diameter: ", coil_radius*2, "mm"), size = 5, $fn=100);
    } else {
      rotate([0,0,180])
        translate([-30.5,coil_radius-20,1])
        text(text = "maketronica.com", size = 6, $fn=100);
      rotate([0,0,180])
        translate([-26,coil_radius-27,1])
        text(text = str("Coil Length: ", coil_length, "mm"), size = 5, $fn=100);
      rotate([0,0,180])
        translate([-35,coil_radius-34,1])
        text(text = str("Coil Diameter: ", coil_radius*2, "mm"), size = 5, $fn=100);
    }
  }
}

bobbin_right();
data_plate();
