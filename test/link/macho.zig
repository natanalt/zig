const std = @import("std");
const CrossTarget = std.zig.CrossTarget;
const TestContext = @import("../../src/test.zig").TestContext;

const macos_x86_64 = CrossTarget{
    .cpu_arch = .x86_64,
    .os_tag = .macos,
};
const macos_aarch64 = CrossTarget{
    .cpu_arch = .aarch64,
    .os_tag = .macos,
};
const all_targets = &[_]CrossTarget{
    macos_x86_64,
    macos_aarch64,
};

pub fn addCases(ctx: *TestContext) !void {
    for (all_targets) |target| {
        {
            var case = ctx.exeUsingLlvmBackend("hello world in C", target);
            case.addCSourceFile("main.c",
                \\#include <stdio.h>
                \\
                \\int main(int argc, char* argv[]) {
                \\    fprintf(stdout, "Hello, World\n");
                \\    return 0;
                \\}
            );
            case.addCCompareOutput("Hello, World\n");
        }

        {
            var case = ctx.exeUsingLlvmBackend("bss", target);
            case.addCSourceFile("main.c",
                \\#include <stdio.h>
                \\
                \\static int foo[100];
                \\
                \\int main() {
                \\    foo[1] = 5;
                \\    fprintf(stdout, "%d %d %d %d", foo[0], foo[1], foo[2], foo[99]);
                \\}
            );
            case.addCCompareOutput("0 5 0 0");
        }
    }
}
