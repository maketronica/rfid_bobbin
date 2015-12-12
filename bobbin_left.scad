include <shared.scad>;

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

bobbin_left();

