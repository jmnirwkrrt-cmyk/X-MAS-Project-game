/// Destroy: obj_arena3d

vertex_delete_buffer(vbuf_floor);
vertex_delete_buffer(vbuf_walls);
vertex_delete_buffer(vbuf_tops);
vertex_format_delete(vf_3d); 
camera_destroy(cam); 
