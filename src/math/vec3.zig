const std = @import("std");
const math = @import("math");
pub const Vec3 = packed struct {
    x: f32,
    y: f32,
    z: f32,
    pub fn init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{ .x = x, .y = y, .z = z };
    }
    pub fn length(self: Vec3) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
    }
    pub fn subScalerFromVec(val: f32, v: Vec3) Vec3 {
        return Vec3.init(val - v.x, val - v.y, val - v.z);
    }
    pub fn subVecFromVec(self: Vec3, v: Vec3) Vec3 {
        return Vec3.init(self.x - v.x, self.y - v.y, self.z - v.z);
    }
    pub fn scaleVecByVec(self: Vec3, v: Vec3) Vec3 {
        return Vec3.init(self.x * v.x, self.y * v.y, self.z * v.z);
    }
    pub fn scaleVecByT(t: f32, vec: Vec3) Vec3 {
        return Vec3.init(t * vec.x, t * vec.y, t * vec.z);
    }
    pub fn addVecToVec(self: Vec3, v: Vec3) Vec3 {
        return Vec3.init(self.x + v.x, self.y + v.y, self.z + v.z);
    }
    pub fn dotProduct(self: Vec3, v: Vec3) f32 {
        return (self.x * v.x + self.y * v.y + self.z * v.z);
    }
    pub fn crossProduct(self: Vec3, v: Vec3) Vec3 {
        return Vec3.init((self.y * v.z) - (self.z * v.y), (self.z * v.x) - (self.x * v.z), (self.x * v.y) - (self.y * v.x));
    }
    pub fn unitVector(u: Vec3) Vec3 {
        const len = length(u);
        return Vec3.init((u.x / len), (u.y / len), (u.z / len));
    }
};
