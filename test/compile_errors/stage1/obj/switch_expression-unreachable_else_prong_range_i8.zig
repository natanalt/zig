fn foo(x: i8) void {
    switch (x) {
        -128...0 => {},
        1 => {},
        2 => {},
        3 => {},
        4...127 => {},
        else => {},
    }
}
export fn entry() usize { return @sizeOf(@TypeOf(foo)); }

// switch expression - unreachable else prong (range i8)
//
// tmp.zig:8:9: error: unreachable else prong, all cases already handled
