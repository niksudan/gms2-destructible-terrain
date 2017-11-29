/// @description Cut through surface

// We're going to cut a circle out of the grid and surface
var radius = 32;

// Use this magical function to set a disk sized portion of the grid to 0
// 0 will mean that it is a free space
ds_grid_set_disk(grid, mouse_x div cellSize, mouse_y div cellSize, radius div cellSize, 0);

// Check for volatile surfaces, because sometimes they like to throw errors at us
if (!surface_exists(surface)) {
	surface = surface_create(room_width, room_height);
}

// Cut a circle shape out of the surface
// We can achieve this by using blend modes, specifically the subtract mode
surface_set_target(surface);
	draw_sprite(sprite, 0, 0, 0);
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white);
	draw_circle(mouse_x, mouse_y, radius, false);
	gpu_set_blendmode(bm_normal);
surface_reset_target();

// After we have cut the sprite, we overwrite the sprite buffer
// This is so we keep our cut-out persistent
sprite_delete(sprite);
sprite = sprite_create_from_surface(surface, 0, 0, surface_get_width(surface), surface_get_height(surface), false, false, 0, 0);
