const std = @import("std");
const color = @import("./math/color.zig");
const VectorMath = @import("./math//vec3.zig");
const ray = @import("./math//ray.zig");

pub fn ray_color(r: ray) VectorMath.Vec3 {
    const unitDir = VectorMath.UnitVector(r.direction);
    const a = VectorMath.ScaleVecByT(0.5, unitDir.y + 1.0);
    const startVal = VectorMath.Vec3.init(1.0, 1.0, 1.0);
    const endVal = VectorMath.ScaleVecByVec(a, (VectorMath.Vec3.init(0.5, 0.7, 1.0)));
    const result = VectorMath.AddVecToVec(VectorMath.ScaleVecByVec(VectorMath.SubScalerFromVec(1.0, a), startVal), VectorMath.ScaleVecByVec(a, endVal));
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
    const cameraCenter: VectorMath.Vec3 = VectorMath.Vec3.init(0, 0, 0);

    const viewport_u = VectorMath.Vec3.init(viewportWidth, 0, 0);
    const viewport_v = VectorMath.Vec3.init(0, -viewportHeight, 0);

    const pixel_delta_u = VectorMath.ScaleVecByT(1 / @as(f32, @floatFromInt(imageWidth)), viewport_u);
    const pixel_delta_v = VectorMath.ScaleVecByT(1 / @as(f32, @floatFromInt(imageHeight)), viewport_v);
    const cameraFocalLen = VectorMath.Vec3.init(0, 0, focalLength);
    const viewport_upper_left = VectorMath.SubVecFromVec(VectorMath.SubVecFromVec(VectorMath.SubVecFromVec(cameraCenter, cameraFocalLen), VectorMath.ScaleVecByT(0.5, viewport_u)), VectorMath.ScaleVecByT(0.5, viewport_v));
    const pixel00_loc = VectorMath.AddVecToVec(viewport_upper_left, VectorMath.ScaleVecByT(0.5, VectorMath.AddVecToVec(pixel_delta_u, pixel_delta_v)));
    //  const file = try std.fs.cwd().createFile("image.ppm", .{ .read = true });
    // defer file.close();

    std.debug.print("P3\n {0} {1}\n255\n", .{ imageWidth, imageHeight });

    // 1 < 6;
    for (0..imageHeight) |height| {
        for (0..imageWidth) |width| {
            const pixelULoc = VectorMath.AddVecToVec(pixel00_loc, VectorMath.ScaleVecByT(@as(f32, @floatCast(width))));
            const pixelCenter = (pixelULoc, pixel_delta_u), VectorMath.ScaleVecByT(@as(f32, @floatCast(height)), pixel_delta_v)));
            const rayDirection = VectorMath.SubVecFromVec(pixelCenter, cameraCenter);
            ray.ray.init(cameraCenter, rayDirection);
            const pixelColor = ray_color();
            color.WriteColor(pixelColor);
        }
    }
}
