const std = @import("std");
const ui = @import("ui.zig");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    // clear + move cursor to home
    try stdout.print("\x1b[2J\x1b[H", .{});
    try ui.typeOut(stdout, "Welcome to EBE Systems...\n", 50);
    try greeting(stdout, stdin);
}

fn greeting(w: anytype, r: anytype) !void {
    try ui.typeOut(w, "Please enter your name to get started\n", 50);
    var buffer: [64]u8 = undefined;
    const input = try r.readUntilDelimiterOrEof(&buffer, '\n');

    if (input) |name| {
        if (name.len == 0) {
            try w.print("\nEmpty input received.\n", .{});
            try greeting(w, r);
        } else {
            try w.print("Confirmed: {s}", .{name});
        }
        return;
    } else {
        try w.print("\nUnexpected error occurred.\n", .{});
    }
}
