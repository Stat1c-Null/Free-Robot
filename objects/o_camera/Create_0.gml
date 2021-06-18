/// @description 
camera = camera_create()

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0)//Where camera is looking at and where camera placed at
var pm = matrix_build_projection_ortho(1980, 1080, 1, 10000)

camera_set_view_mat(camera, vm)
camera_set_proj_mat(camera, pm)

view_camera[0] = camera

follow = o_player//Object for camera to follow
xTo = x
yTo = y

