const std = @import("std");
const VectorMath = @import("./vec3.zig");

pub inline fn WriteColor(Vec: VectorMath.Vec3) void {
    const red = Vec.x;
    const green = Vec.y;
    const blue = Vec.z;

    const ir: i32 = @intFromFloat(red * 259.999);
    const ig: i32 = @intFromFloat(green * 259.999);
    const ib: i32 = @intFromFloat(blue * 259.999);

    std.debug.print("{0} {1} {2}\n", .{ ir, ig, ib });
}
