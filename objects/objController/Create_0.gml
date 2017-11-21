/// @description Define surface and grid

room_speed = 60;

// Define the surface which we will cut out of
// We're going to draw a grey rectangle once in the create event
// This will serve as the initial background
surface = surface_create(room_width, room_height);
surface_set_target(surface);
	draw_set_color(c_gray);
	draw_rectangle(0, 0, surface_get_width(surface), surface_get_height(surface), false);
surface_reset_target();

// Save the created surface as a sprite
// We will use this to save the previous state of the surface to dig through
sprite = sprite_create_from_surface(surface, 0, 0, surface_get_width(surface), surface_get_height(surface), false, false, 0, 0);

// Define the collision grid
// We don't need to make this pixel-for-pixel accurate
cellSize = 4;
grid = ds_grid_create(
	surface_get_width(surface div cellSize),
	surface_get_height(surface div cellSize)
);

// For each value in the grid, we set the value of 1
// This means that this is a solid and will cause a collision
for (var i = 0; i < ds_grid_width(grid); i++) {
	for (var j = 0; j < ds_grid_height(grid); j++) {
		ds_grid_set(grid, i, j, 1);
	}
}
