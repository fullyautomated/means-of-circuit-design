epsilon = 0.01;
module dsopAdvance() {
    bodyX = 5;
    bodyY = 5;
    bodyZ = 0.73;
    
    pinThickness = 0.166;
    pinSpacing = 1.27;
    pinWidth = 0.4;
    pinHeight = 0.6;
    
    bottomPadX = 4.25;
    bottomPadY = 3.5;
    bottomPadShift = 0.8;
    
    scaleMagic = 0.92;
    moreMagic = 0.2;
    awfulLotOfMagic = 0.05;
    
    plasticColor = [0.192, 0.149, 0.149];
    copperColor = [0.769, 0.82, 0.851];
        
    // :: body
    translate([0,0,epsilon])
        color(plasticColor)
            linear_extrude(scale=scaleMagic,height=bodyZ) {
                square([bodyX,bodyY],center=true);
            }
        
    // :: pins
    color(copperColor) {
        for(i=[0:3])
            translate([-bodyX/2+pinWidth+i*pinSpacing,-bodyY/2-pinHeight,0])
                cube([pinWidth,pinHeight+moreMagic,pinThickness]);
        for(i=[0:3])
            translate([-bodyX/2+pinWidth+i*pinSpacing,bodyY/2-moreMagic,0])
                cube([pinWidth,pinHeight+moreMagic,pinThickness]);
        
        // :: bottom pad
        translate([-bottomPadX/2,-bodyY/2-pinHeight+bottomPadShift,0])
            cube([bottomPadX,bottomPadY,2*epsilon]);
        
      // :: cosmetic
        translate([-bodyX/2-awfulLotOfMagic,-moreMagic/2,0])
            cube([bodyX+2*awfulLotOfMagic,moreMagic,pinThickness]);
    }
}

dsopAdvance();