extern fn vprintk(fmt: [*:0]const u8, ...) void;

export fn zig_module_init() callconv(.C) c_int {
  vprintk("root.zig: initializing...\n");
  return 0;
}

export fn zig_module_exit() callconv(.C) void {
  vprintk("root.zig: exiting.\n");
}

