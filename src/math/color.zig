const std = @import("std");
const vector_math = @import("./vec3.zig");
const vec3 = vector_math.Vec3;
pub inline fn writeColor(vec: vec3) void {
    const red = vec.x;
    const green = vec.y;
    const blue = vec.z;

    const ir: i32 = @intFromFloat(red * 259.999);
    const ig: i32 = @intFromFloat(green * 259.999);
    const ib: i32 = @intFromFloat(blue * 259.999);

    std.debug.print("{0} {1} {2}\n", .{ ir, ig, ib });
}
