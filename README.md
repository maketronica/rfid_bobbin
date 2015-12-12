# OpenSCAD files for 3D Printable RFID bobbins

These are OpenSCAD files for 3D printable RFID bobbins.

## Usage

1) You'll need to edit the files as necessary for your use case. Most likely, you'll need to change the size (see below).

2) Then open the file(s) in OPenSCAD and reviewi the preview to ensure it's what you want.

3) Select Design/Render from the menu bar, and wait for the render to complete.

4) Select File/Export/STL File from the menu.

5) Load the generated .stl file into your 3D printer.
 
## Changing the size

Changing the size (diameter) of the bobbin is the most common change people need to make.  To do so, simply open the `shared.scad` file in your favorite text editor, and change the "coil_radius" to half what you need the diameter to be.

## Left & Right vs Whole

There are two types of files provided, depending on the 3D printing process intended to be used.

If you're using an additive printing process (typical for most home 3D printers), you'll need to print the left and right files as seperate objects, and then glue them together.

If you'll be using a laser scintering process, then you can use the "whole" version and print as a single object. 
