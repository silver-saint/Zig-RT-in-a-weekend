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
pub inline fn SubScalerFromVec(val: f32, v: Vec3) Vec3 {
    return Vec3.init(val - v.x, val - v.y, val - v.z);
}
pub inline fn SubVecFromVec(u: Vec3, v: Vec3) Vec3 {
    return Vec3.init(u.x - v.x, u.y - v.y, u.z - v.z);
}
pub inline fn length(vec: Vec3) f32 {
    return std.math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z);
}
pub inline fn ScaleVecByVec(u: Vec3, v: Vec3) Vec3 {
    return Vec3.init(u.x * v.x, u.y * v.y, u.z * v.z);
}
pub inline fn ScaleVecByT(t: f32, vec: Vec3) Vec3 {
    return Vec3.init(t * vec.x, t * vec.y, t * vec.z);
}
pub inline fn AddVecToVec(u: Vec3, v: Vec3) Vec3 {
    return Vec3.init(u.x + v.x, u.y + v.y, u.z + v.z);
}
pub inline fn DotProduct(u: Vec3, v: Vec3) f32 {
    return (u.x * u.x + u.y * v.y + u.z * v.z);
}
pub inline fn CrossProduct(u: Vec3, v: Vec3) Vec3 {
    return Vec3.init((u.y * v.z) - (u.z * v.y), (u.z * v.x) - (u.x * v.z), (u.x * v.y) - (u.y * v.x));
}
pub inline fn UnitVector(u: Vec3) Vec3 {
    const len = length(u);
    return Vec3.init((u.x / len), (u.y / len), (u.z / len));
}
