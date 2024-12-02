const std = @import("std");
const math = @import("math");
pub const Vec3 = packed struct {
    x: f32,
    y: f32,
    z: f32,
    pub fn init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{ .x = x, .y = y, .z = z };
    }
};
pub inline fn length(vec: Vec3) f32 {
    return std.math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z);
}
pub inline fn multiplyVecByVec(u: Vec3, v: Vec3) Vec3 {
    return Vec3.init(u.x * v.x, u.y * v.y, u.z * v.z);
}
pub inline fn multiplyVecByT(t: f32, vec: Vec3) Vec3 {
    return Vec3.init(t * vec.x, t * vec.y, t * vec.z);
}
