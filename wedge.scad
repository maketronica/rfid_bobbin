module wedge(height, radius, angle) {
  intersection() {
    difference() {
      cylinder(r=radius, h=height, $fn=100);
      translate([0,-radius,-1])
        cube([radius,radius*2,height+2]);
    }
    rotate([0,0,angle])
      translate([0,-radius,-1])
        cube([radius,radius*2,height+2]);
  }
}

wedge(height=10, radius=5, angle=15);
