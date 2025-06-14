# Zig Out of Tree Kernel Module

This is a 'hello world' kernel module in [Zig](https://github.com/ziglang/zig).

1. Build with `make all`.
```
$ sudo insmod hello_module.ko
$ sudo rmmod hello_module.ko
$ dmesg | tail -2
[ 2610.067755] root.zig: initializing...
[ 2610.085320] root.zig: exiting.
```

You can use other c functions by extern declaring them, similar to how `vprintk` is used in this example.
They must be modules tho, and not macros (printk is a macro), and function signature must match exactly.
