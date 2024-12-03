const std = @import("std");
const color = @import("./math/color.zig");
pub fn main() !void {
    const imageWidth: i32 = 512;
    const imageHeight: i32 = 512;
    //  const file = try std.fs.cwd().createFile("image.ppm", .{ .read = true });
    // defer file.close();
    std.debug.print("P3\n {0} {1}\n255\n", .{ imageWidth, imageHeight });

    // 1 < 6;
    for (0..imageHeight) |height| {
        for (0..imageWidth) |width| {
            const red: f32 = (@as(f32, @floatFromInt(width)) / @as(f32, @floatFromInt(imageWidth - 1)));
            const green: f32 = @as(f32, @floatFromInt(height)) / @as(f32, @floatFromInt(imageHeight - 1));
            const blue: f32 = 0.0;
            color.WriteColor(red, green, blue);
        }
    }
}
