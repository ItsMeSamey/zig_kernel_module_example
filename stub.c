#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

extern int zig_module_init(void);
extern void zig_module_exit(void);

static int __init c_module_init(void) { return zig_module_init(); }
static void __exit c_module_exit(void) { zig_module_exit(); }

module_init(c_module_init);
module_exit(c_module_exit);

MODULE_LICENSE("LICENSE");
MODULE_AUTHOR("AUTHOR");
MODULE_DESCRIPTION("DESCRIPTION");
MODULE_VERSION("VERSION");

