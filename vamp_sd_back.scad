x=103;
y=30;


module plate() {
    translate([x/2,y/2,0.8])
    minkowski() {
        cube([x-6,y-6,1],center=true);
        cylinder(h=1,r=3, center=true, $fn=16);
    }
}

module screwhole() {
    cylinder(h=6,d=4.5, center=true, $fn=16);
    
    translate([0,0,-0.4])
    cylinder(h=2,d=6, center=true, $fn=20);
}

module punchout(w,h,x,y) {
    translate([x,y,-0.3])
    cube([w,h,30]);
}

module cardext(w,h,x,y) {
    translate([x,y,-0.2])
    cube([w,h,10]);
} 

difference() {
    union() {
        plate();
        
        cardext(3+25.1,3+7.4,65-1.5,18-1.5);
    }
    
    // ide-sd-slot
    punchout(25.1,7.4,65,18);
    
    // screws
    translate([1.5+(4.5/2),1.5+(4.5/2),0])
    screwhole();
    
    translate([96+1.5+(4.5/2),1.5+(4.5/2),0])
    screwhole();

    translate([1.5+(4.5/2),22.5+1.5+(4.5/2),0])
    screwhole();

    translate([96+1.5+(4.5/2),22.5+1.5+(4.5/2),0])
    screwhole();
    
    // ethernet
    punchout(16,13,6,8.6);
    
    // keyboard
    punchout(16,7.8,25.5,9);
    
    // hdmi
    punchout(16,7,53.1,8.6);
    
    // sdcard
    punchout(15.8,2.8,70.5,8.5);
    
    // power
    punchout(8.7,5,88.5,8.8);
}
