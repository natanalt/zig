export fn a() void {
    var x: anyframe = undefined;
    var y: anyframe->i32 = x;
    _ = y;
}
export fn b() void {
    var x: i32 = undefined;
    var y: anyframe->i32 = x;
    _ = y;
}
export fn c() void {
    var x: @Frame(func) = undefined;
    var y: anyframe->i32 = &x;
    _ = y;
}
fn func() void {}

// prevent bad implicit casting of anyframe types
//
// tmp.zig:3:28: error: expected type 'anyframe->i32', found 'anyframe'
// tmp.zig:8:28: error: expected type 'anyframe->i32', found 'i32'
// tmp.zig:13:29: error: expected type 'anyframe->i32', found '*@Frame(func)'
