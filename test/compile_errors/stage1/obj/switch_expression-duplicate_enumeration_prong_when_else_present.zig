const Number = enum {
    One,
    Two,
    Three,
    Four,
};
fn f(n: Number) i32 {
    switch (n) {
        Number.One => 1,
        Number.Two => 2,
        Number.Three => @as(i32, 3),
        Number.Four => 4,
        Number.Two => 2,
        else => 10,
    }
}

export fn entry() usize { return @sizeOf(@TypeOf(f)); }

// switch expression - duplicate enumeration prong when else present
//
// tmp.zig:13:15: error: duplicate switch value
// tmp.zig:10:15: note: other value here
