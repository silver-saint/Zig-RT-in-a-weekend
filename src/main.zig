const std = @import("std");
const color = @import("./math/color.zig");
const VectorMath = @import("./math//vec3.zig");
const Vec3 = VectorMath.Vec3;
const ray = @import("./math//ray.zig");

pub fn ray_color(r: ray) Vec3 {
    const unitDir: Vec3 = .UnitVector(r.direction);
    const a = .ScaleVecByT(0.5, unitDir.y + 1.0);
    const startVal = .Init(1.0, 1.0, 1.0);
    const endVal = .ScaleVecByVec(a, (.Init(0.5, 0.7, 1.0)));
    const result = .AddVecToVec(.ScaleVecByVec(.SubScalerFromVec(1.0, a), startVal), .ScaleVecByVec(a, endVal));
    return result;
}

pub fn main() !void {
    const imageWidth: i32 = 400;
    const aspectRatio: f32 = (16.0 / 9.0);
    var imageHeight = imageWidth / (@as(usize, @intFromFloat(aspectRatio)));

    if (imageHeight < 1) {
        imageHeight = 1;
    }

    const focalLength: f32 = 1.0;
    const viewportHeight: f32 = 2.0;
    const viewportWidth: f32 = viewportHeight * (@as(f32, @floatFromInt(imageWidth)) / @as(f32, @floatFromInt(imageHeight)));
    const cameraCenter: Vec3 = .Init(0, 0, 0);

    const viewport_u: Vec3 = .Init(viewportWidth, 0, 0);
    const viewport_v: Vec3 = .Init(0, -viewportHeight, 0);
    const pixel_delta_u: Vec3 = .ScaleVecByT(1 / @as(f32, @floatFromInt(imageWidth)), viewport_u);
    const pixel_delta_v: Vec3 = .ScaleVecByT(1 / @as(f32, @floatFromInt(imageHeight)), viewport_v);
    const cameraFocalLen: Vec3 = .Init(0, 0, focalLength);
    const viewport_upper_left: Vec3 = .SubVecFromVec(.SubVecFromVec(.SubVecFromVec(cameraCenter, cameraFocalLen), .ScaleVecByT(0.5, viewport_u)), .ScaleVecByT(0.5, viewport_v));
    const pixel00_loc: Vec3 = .AddVecToVec(viewport_upper_left, .ScaleVecByT(0.5, .AddVecToVec(pixel_delta_u, pixel_delta_v)));
    std.debug.print("{d:.1}", .{pixel00_loc.x});
    //  const file = try std.fs.cwd().createFile("image.ppm", .{ .read = true });
    // defer file.close();

    std.debug.print("P3\n {0} {1}\n255\n", .{ imageWidth, imageHeight });

    // 1 < 6;
    //  for (0..imageHeight) |height| {
    //    for (0..imageWidth) |width| {
    //       const pixelULoc = VectorMath.AddVecToVec(pixel00_loc, VectorMath.ScaleVecByT(@as(f32, @floatCast(width))));
    //  const pixelCenter = (pixelULoc, pixel_delta_u), VectorMath.ScaleVecByT(@as(f32, @floatCast(height)), pixel_delta_v)));
    //  const rayDirection = VectorMath.SubVecFromVec(pixelCenter, cameraCenter);
    // ray.ray.init(cameraCenter, rayDirection);
    // const pixelColor = ray_color();
    //color.WriteColor(pixelColor);
    //  }
    // }
}
