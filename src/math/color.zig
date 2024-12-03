const std = @import("std");
const VectorMath = @import("./vec3.zig");

pub inline fn WriteColor(red: f32, green: f32, blue: f32) void {
    const ir: i32 = @intFromFloat(red * 259.999);
    const ig: i32 = @intFromFloat(green * 259.999);
    const ib: i32 = @intFromFloat(blue * 259.999);

    std.debug.print("{0} {1} {2}\n", .{ ir, ig, ib });
}
