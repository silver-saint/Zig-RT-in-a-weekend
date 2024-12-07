const std = @import("std");
const VectorMath = @import("./vec3.zig");

pub const Ray = struct {
    origin: VectorMath.Vec3,
    direction: VectorMath.Vec3,
    pub fn Init(orig: VectorMath.Vec3, dir: VectorMath.Vec3) Ray {
        return Ray{
            .origin = orig,
            .direction = dir,
        };
    }
    pub fn At(t: f32) VectorMath.Vec3 {
        return VectorMath.AddVecToVec(.origin, VectorMath.ScaleVecByT(t, .direction));
    }
};
