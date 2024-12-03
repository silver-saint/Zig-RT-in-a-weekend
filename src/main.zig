const std = @import("std");
const color = @import("./math/color.zig");
const VectorMath = @import("./math//vec3.zig");
const ray = @import("./math//ray.zig");

pub fn ray_color() VectorMath.Vec3 {
    return VectorMath.Vec3.init(0, 0, 0);
}

pub fn main() !void {
    const imageWidth: i32 = 512;
    const imageHeight: i32 = 512;

    const aspectRatio: f32 = (16.0 / 9.0);

    if (imageHeight < 1) {
        imageHeight = 1;
    }

    const focalLength: f32 = 1.0;
    const viewportHeight: f32 = 2.0;
    const viewportWidth: f32 = viewportHeight * (@as(f32, @floatFromInt(imageWidth)) / @as(f32, @floatFromInt(imageHeight)));
    const cameraCenter: VectorMath.Vec3 = VectorMath.Vec3.init(0, 0, 0);

    const viewport_u = VectorMath.Vec3.init(viewportWidth, 0, 0);
    const viewport_v = VectorMath.Vec3.init(0, -viewportHeight, 0);

    const pixel_delta_u = viewport_u / @as(f32, imageWidth);
    const pixel_delta_v = viewport_v / @as(f32, imageHeight);

    const viewport_upper_left = (VectorMath.SubVecFromVec(cameraCenter, VectorMath.Vec3.init(0, 0, focalLength)) - VectorMath.ScaleVecByT(0.5, viewport_u) - VectorMath.ScaleVecByT(0.5, viewport_v));
    const pixel00_loc: VectorMath.Vec3 = VectorMath.AddVecToVec(viewport_upper_left, VectorMath.ScaleVecByT(0.5, VectorMath.AddVecToVec(pixel_delta_u, pixel_delta_v)));
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
