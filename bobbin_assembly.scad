use <bobbin_left.scad>;
use <bobbin_right.scad>;

bobbin_left();
rotate([180, 0, 0])
  translate([0,0,-11])
    union() {
      bobbin_right();
      data_plate();
    }
