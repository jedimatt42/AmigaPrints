// Amiga Rys mkII r2 usb-to-9pin adapter

module insert() {
    translate([-9,-4.5,0])
    union() {
        cube([20,11,6]);

        translate([2.5,1.5,0])
        cube([15,8,40]);
        
        translate([1,4.5,0])
        cube([18,2,41]);

        translate([2.5,2,0])
        cube([15,7,55]);

        translate([6.5,0.0,0])
        cube([7,5,16]);
    }
}

module body() {
    // cube([30,13,55]);
    
    $fn=16;
    translate([1,1,1])
    minkowski() {
        linear_extrude(height=52.5,scale=[0.7,0.7], slices=20, twist=0)
        square([28, 11],center=true);
        cylinder(2, center=true);
    }
}

difference() {
    body();
    
    insert();
}
