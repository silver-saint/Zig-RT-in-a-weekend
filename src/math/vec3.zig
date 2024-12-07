const std = @import("std");
const math = @import("math");
pub const Vec3 = packed struct {
    x: f32,
    y: f32,
    z: f32,
    pub fn Init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{ .x = x, .y = y, .z = z };
    }
    pub inline fn Length(self: Vec3) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
    }
    pub inline fn SubScalerFromVec(val: f32, v: Vec3) Vec3 {
        return Vec3.Init(val - v.x, val - v.y, val - v.z);
    }
    pub inline fn SubVecFromVec(self: Vec3, v: Vec3) Vec3 {
        return Vec3.Init(self.x - v.x, self.y - v.y, self.z - v.z);
    }
    pub inline fn ScaleVecByVec(self: Vec3, v: Vec3) Vec3 {
        return Vec3.Init(self.x * v.x, self.y * v.y, self.z * v.z);
    }
    pub inline fn ScaleVecByT(t: f32, vec: Vec3) Vec3 {
        return Vec3.Init(t * vec.x, t * vec.y, t * vec.z);
    }
    pub inline fn AddVecToVec(self: Vec3, v: Vec3) Vec3 {
        return Vec3.Init(self.x + v.x, self.y + v.y, self.z + v.z);
    }
    pub inline fn DotProduct(self: Vec3, v: Vec3) f32 {
        return (self.x * v.x + self.y * v.y + self.z * v.z);
    }
    pub inline fn CrossProduct(self: Vec3, v: Vec3) Vec3 {
        return Vec3.Init((self.y * v.z) - (self.z * v.y), (self.z * v.x) - (self.x * v.z), (self.x * v.y) - (self.y * v.x));
    }
    pub inline fn UnitVector(u: Vec3) Vec3 {
        const len = Length(u);
        return Vec3.Init((u.x / len), (u.y / len), (u.z / len));
    }

};
