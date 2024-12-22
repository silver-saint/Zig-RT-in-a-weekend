const std = @import("std");
const color = @import("./math/color.zig");
const vector_math = @import("./math/vec3.zig");
const Ray = @import("./math/ray.zig");
const vec3 = vector_math.Vec3;
const ray = Ray.Ray;

pub fn rayColor(r: ray) vec3 {
    const unit_dir: vec3 = .unitVector(r.direction);
    const a: f32 = (0.5 * (unit_dir.y + 1.0));
    const start_val: vec3 = .init(1.0, 1.0, 1.0);
    const end_val: vec3 = .scaleVecByT(a, (.init(0.5, 0.7, 1.0)));
    const result: vec3 = .addVecToVec(.scaleVecByT((1.0 - a), start_val), .scaleVecByT(a, end_val));
    return result;
}

pub fn main() !void {
    const image_width: i32 = 1920;
    const aspect_ratio: f32 = (16.0 / 9.0);
    var image_height = image_width / (@as(usize, @intFromFloat(aspect_ratio)));

    if (image_height < 1) {
        image_height = 1;
    }

    const focal_length: f32 = 1.0;
    const viewport_height: f32 = 2.0;
    const viewport_width: f32 = viewport_height * (@as(f32, @floatFromInt(image_width)) / @as(f32, @floatFromInt(image_height)));
    const camera_center: vec3 = .init(0, 0, 0);

    const viewport_u: vec3 = .init(viewport_width, 0, 0);
    const viewport_v: vec3 = .init(0, -viewport_height, 0);
    const pixel_delta_u: vec3 = .scaleVecByT(1 / @as(f32, @floatFromInt(image_width)), viewport_u);
    const pixel_delta_v: vec3 = .scaleVecByT(1 / @as(f32, @floatFromInt(image_height)), viewport_v);
    const camera_focal_len: vec3 = .init(0, 0, focal_length);

    const viewport_upper_left: vec3 = .subVecFromVec(.subVecFromVec(.subVecFromVec(camera_center, camera_focal_len), .scaleVecByT(0.5, viewport_u)), .scaleVecByT(0.5, viewport_v));
    const pixel00_loc: vec3 = .addVecToVec(viewport_upper_left, .scaleVecByT(0.5, .addVecToVec(pixel_delta_u, pixel_delta_v)));
    //  const file = try std.fs.cwd().createFile("image.ppm", .{ .read = true });
    // defer file.close();

    std.debug.print("P3\n {0} {1}\n255\n", .{ image_width, image_height });
    for (0..image_height) |height| {
        for (0..image_width) |width| {
            const pixel_center: vec3 = .addVecToVec(.addVecToVec(pixel00_loc, .scaleVecByT(@as(f32, @floatFromInt(width)), pixel_delta_u)), .scaleVecByT(@as(f32, @floatFromInt(height)), pixel_delta_v));
            const ray_direction: vec3 = .subVecFromVec(pixel_center, camera_center);
            const r: ray = .init(camera_center, ray_direction);
            const pixel_color: vec3 = rayColor(r);
            color.writeColor(pixel_color);
        }
    }
}
