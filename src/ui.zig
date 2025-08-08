const std = @import("std");

pub fn typeOut(writer: anytype, text: []const u8, delay_ms: u64) !void {
    const sleep = std.time.sleep;

    for (text) |c| {
        try writer.print("{c}", .{c});
        sleep(delay_ms * std.time.ns_per_ms);
    }
}
