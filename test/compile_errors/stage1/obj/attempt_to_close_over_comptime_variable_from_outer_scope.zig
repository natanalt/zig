fn SimpleList(comptime L: usize) type {
    var T = u8;
    return struct {
        array: [L]T,
    };
}

// attempt to close over comptime variable from outer scope
//
// tmp.zig:4:19: error: mutable 'T' not accessible from here
// tmp.zig:2:9: note: declared mutable here
// tmp.zig:3:12: note: crosses namespace boundary here
