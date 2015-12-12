include <shared.scad>;

module bobbin_right() {
  difference() {
    difference() {
      union() {
        cylinder(h=2, r=coil_radius+slot_depth, $fn=100);
        cylinder(h=6, r=coil_radius, $fn=100);
      }
      translate([0,0,-1])
        cylinder(h=8, r=coil_radius-4, $fn=100);
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

module bobbin_left() {
  difference() {
    difference() {
      difference() {
        union() {
          cylinder(h=4, r=coil_radius, $fn=100);
          cylinder(h=2, r=coil_radius+slot_depth, $fn=100);
        }
        translate([0,0,-1])
          cylinder(h=6, r=coil_radius-4, $fn=100);
      }
      for(x=[0:30:360])
        render() difference() {
          rotate([0,0,x+1]) translate([0,0,-1])  wedge(6, coil_radius+slot_depth+1, 25);
          translate([0,0,-2]) cylinder(h=10, r=coil_radius+0.15, $fn=100);
        }
    }
  }
}

module data_plate() {
  difference() {
    cylinder(h=1, r=coil_radius-6, $fn=100);
    translate([-250,-(coil_radius-25),-1])
      cube([500,500,8]);
  }
  linear_extrude(height = 2) {
    if(coil_radius < 50) { 
      rotate([0,0,180])
        translate([-11,coil_radius-14,1])
        text(text = str("Length: ", coil_length, "mm"), size = 3, $fn=100);
      rotate([0,0,180])
        translate([-14,coil_radius-19,1])
        text(text = str("Diameter: ", coil_radius*2, "mm"), size = 3, $fn=100);
      rotate([0,0,180])
        translate([-20.5,coil_radius-24,1])
        text(text = "www.maketronica.com", size = 3, $fn=100);
    } else {
      rotate([0,0,180])
        translate([-20.5,coil_radius-14,1])
        text(text = "www.maketronica.com", size = 3, $fn=100);
      rotate([0,0,180])
        translate([-16,coil_radius-19,1])
        text(text = str("Coil Length: ", coil_length, "mm"), size = 3, $fn=100);
      rotate([0,0,180])
        translate([-20,coil_radius-24,1])
        text(text = str("Coil Diameter: ", coil_radius*2, "mm"), size = 3, $fn=100);
    }
  }
}

module crossbar() {
  translate([-coil_radius, 0, 1]) cube([coil_radius*2, 6, 4]);
  translate([-24,0.5,5]) linear_extrude(height = 1) text(text = str("Diameter: ", coil_radius*2, "mm"), size=4.5, font="Droid Sans:style=Bold", $fn=100);
  if(coil_radius < 40) { 
    translate([-26,5,1]) rotate([180,0,0]) linear_extrude(height=1) text("maketronica.com", size=4.5, font="Droid Sans:style=Bold");
  } else {
    translate([-34,5,1]) rotate([180,0,0]) linear_extrude(height=1) text("www.maketronica.com", size=4.5, font="Droid Sans:style=Bold");
  }
}

module attachment_holes() {
  for(x=[0:120:360])
    rotate([0,0,x+90]) difference() {
      union() {
        translate([coil_radius-9, 0, 4]) cylinder(h=2, r=4, $fn=100); 
        translate([coil_radius-8, -4, 4]) cube([8,8,2]);
      }
      translate([coil_radius-9, 0, 3]) cylinder(h=4, r=2.05, $fn=100);
    }
}

rotate([180,0,0]) translate([0,0,-6]) bobbin_left();
bobbin_right();
crossbar();
attachment_holes();
