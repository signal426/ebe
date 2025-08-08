const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "ebe",
        .root_source_file = b.path("main.zig"),
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });
    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    b.step("run", "Run the game").dependOn(&run_cmd.step);
}
