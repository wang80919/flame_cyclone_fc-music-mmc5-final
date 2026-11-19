-----------------------
-- Name: Show IRQ Scanline for FCEUX
-- Author: FlameCyclone
-- Date: 2023.8.5
-----------------------
-- Draws a line for IRQ
-----------------------

local cur_frame_cycles = 0
local last_frame_cycles = 0
local frame_cycles = 0
local irq_addr = 0
local reset_addr = 0
local nmi_addr = 0

--精灵 OAM_DATA 写入回调
function on_addr_write(address, size, value)
    
    NTSC_cycles = 29781
    PAL_cycles = 33248
    Dendy_cycles = 35464

    --总扫描线
    scan_line_total = 262
    
    --NMI扫描线
    vblank_scan_line = 240
    
    --每条扫描线CPU周期
    scan_line_cycle = 341/3
    
    --NTSC制式
    if (frame_cycles > (NTSC_cycles - 10) and frame_cycles < (NTSC_cycles + 10)) then
        scan_line_total = 262
        vblank_scan_line = 240
        scan_line_cycle = 341/3
    --PAL制式
    elseif (frame_cycles > (PAL_cycles - 10) and frame_cycles < (PAL_cycles + 10)) then
        scan_line_total = 312
        vblank_scan_line = 240
        scan_line_cycle = 341/3.2
    --Dendy制式
    elseif (frame_cycles > (Dendy_cycles - 10) and frame_cycles < (Dendy_cycles + 10)) then
        scan_line_total = 312
        vblank_scan_line = 290
        scan_line_cycle = 341/3
    end
    
    if frame_cycles > 0 then
        current_cpu_cycles = debugger.getcyclescount() - last_frame_cycles
        irq_scanline = (current_cpu_cycles - (scan_line_total - vblank_scan_line) * scan_line_cycle) / scan_line_cycle
        gui.line(0, irq_scanline, 256, irq_scanline, "#ffff00ff")
        gui.text(0, irq_scanline + 2, string.format("%d", irq_scanline), "#ffff00ff", "#0000001f")
    end
end

--注册端口写入回调
memory.registerwrite(0x4800, on_addr_write)

--停止回调
function on_exit()
    emu.print("stop...")
end

emu.registerexit(on_exit)

emu.print("start...")
while (true) do
    cur_frame_cycles = debugger.getcyclescount()
	emu.frameadvance()
    last_frame_cycles = debugger.getcyclescount()
    frame_cycles = last_frame_cycles - cur_frame_cycles
end
