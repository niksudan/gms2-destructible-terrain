/// @description Handle collisions

var spd = 3;
var grid = objController.grid;
var size = objController.cellSize;

// Get the grid-relative coords
var xx = x div size;
var yy = y div size;

// Check if the next cell horizontally is a solid
if (xx < ds_grid_width(grid) && ds_grid_get(grid, xx + 1, yy) == 1) {
	hsp = -1;
} else if (xx > 0 && ds_grid_get(grid, xx - 1, yy) == 1) {
	hsp = 1;	
}

// Check if the next cell vertically is a solid
if (yy < ds_grid_height(grid) && ds_grid_get(grid, xx, yy + 1) == 1) {
	vsp = -1;
} else if (yy > 0 && ds_grid_get(grid, xx, yy - 1) == 1) {
	vsp = 1;	
}

// Apply motion change
x += hsp * spd;
y += vsp * spd;
