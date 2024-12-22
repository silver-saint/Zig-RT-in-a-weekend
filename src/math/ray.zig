const std = @import("std");
const vector_math = @import("./vec3.zig");
const vec3 = vector_math.Vec3;
pub const Ray = struct {
    origin: vec3,
    direction: vec3,
    pub fn init(orig: vec3, dir: vec3) Ray {
        return Ray{
            .origin = orig,
            .direction = dir,
        };
    }
    pub fn at(t: f32) vec3 {
        return .addVecToVec(.origin, vector_math.scaleVecByT(t, .direction));
    }
};
