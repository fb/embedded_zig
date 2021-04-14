const std = @import("std");
const Builder = std.build.Builder;

const target = std.zig.CrossTarget{
    .cpu_arch = .thumb,
    .os_tag = .freestanding,
    .abi = .none,
    .cpu_model = std.zig.CrossTarget.CpuModel{ .explicit = &std.Target.arm.cpu.cortex_m0 },
};

pub fn build(b: *Builder) void {

    const exe = b.addExecutable("firmware.elf", "src/startup.zig");
    exe.setTarget(target);
    exe.setBuildMode(b.standardReleaseOptions());
    exe.setLinkerScriptPath("arm_cm3.ld");
    exe.setOutputDir(".");

    exe.install();
}
