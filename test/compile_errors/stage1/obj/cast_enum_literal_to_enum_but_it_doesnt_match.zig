const Foo = enum {
    a,
    b,
};
export fn entry() void {
    const x: Foo = .c;
    _ = x;
}

// cast enum literal to enum but it doesn't match
//
// tmp.zig:6:20: error: enum 'Foo' has no field named 'c'
// tmp.zig:1:13: note: 'Foo' declared here
