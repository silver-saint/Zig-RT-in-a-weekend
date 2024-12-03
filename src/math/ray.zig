const std = @import("std");
const VectorMath = @import("./vec3.zig");
pub const ray = struct {
    origin: VectorMath.Vec3,
    direction: VectorMath.Vec3,
    pub fn init(orig: VectorMath.Vec3, dir: VectorMath.Vec3) ray {
        return ray{
            .origin = orig,
            .direction = dir,
        };
    }
    pub fn at(t: f32) VectorMath.Vec3 {
        return VectorMath.AddVecToVec(.origin, VectorMath.ScaleVecByT(t, .direction));
    }
};
