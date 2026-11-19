-----------------------
-- Name: 曲目记录
-- Author: FlameCyclone
-- Date: 2025.6.11
-----------------------
-- 曲目记录
-----------------------

local cur_frame_count = 0
local last_frame_seconds = 0
local music_record_list = {}
local music_index = 1
local byte_read_count = 0
local byte_write_count = 0
local byte_exec_count = 0
local data_list = {}


local introduction_set = {
    --LDA
    [0xA1] =  2,
    [0xA5] =  2,
    [0xA9] =  2,
    [0xAD] =  3,
    [0xB1] =  2,
    [0xB5] =  2,
    [0xB9] =  3,
    [0xBD] =  3,

    --LDX
    [0xA2] =  2,
    [0xA6] =  2,
    [0xAE] =  3,
    [0xB6] =  2,
    [0xBE] =  3,

    --LDY
    [0xA0] =  2,
    [0xA4] =  2,
    [0xAC] =  3,
    [0xB4] =  2,
    [0xBC] =  3,

    --STA
    [0x81] =  2,
    [0x85] =  2,
    [0x8D] =  3,
    [0x91] =  2,
    [0x95] =  2,
    [0x9D] =  3,
    [0x99] =  3,

    --STX
    [0x86] =  2,
    [0x96] =  2,
    [0x8E] =  3,

    --STY
    [0x84] =  2,
    [0x94] =  2,
    [0x8C] =  3,

    --寄存器传送
    [0xAA] =  1,
    [0x8A] =  1,
    [0xA8] =  1,
    [0x98] =  1,

    --栈操作
    [0xBA] =  1,
    [0x9A] =  1,
    [0x48] =  1,
    [0x68] =  1,
    [0x08] =  1,
    [0x28] =  1,

    --逻辑运算
    --AND
    [0x21] =  2,
    [0x25] =  2,
    [0x29] =  2,
    [0x2D] =  3,
    [0x31] =  2,
    [0x35] =  2,
    [0x39] =  3,
    [0x3D] =  3,

    --EOR
    [0x41] =  2,
    [0x45] =  2,
    [0x49] =  2,
    [0x4D] =  3,
    [0x51] =  2,
    [0x55] =  2,
    [0x59] =  3,
    [0x5D] =  3,

    --ORA
    [0x01] =  2,
    [0x05] =  2,
    [0x09] =  2,
    [0x0D] =  3,
    [0x11] =  2,
    [0x15] =  2,
    [0x19] =  3,
    [0x1D] =  3,

    --BIT
    [0x24] =  2,
    [0x2C] =  3,

    [0x61] =  2,
    [0x65] =  2,
    [0x69] =  2,
    [0x6D] =  3,
    [0x71] =  2,
    [0x75] =  2,
    [0x79] =  3,
    [0x7D] =  3,

    --SBC
    [0xE1] =  2,
    [0xE5] =  2,
    [0xE9] =  2,
    [0xED] =  3,
    [0xF1] =  2,
    [0xF5] =  2,
    [0xF9] =  3,
    [0xFD] =  3,

    --CMP
    [0xC1] =  2,
    [0xC5] =  2,
    [0xC9] =  2,
    [0xCD] =  3,
    [0xD1] =  2,
    [0xD5] =  2,
    [0xD9] =  3,
    [0xDD] =  3,

    --CPX
    [0xE0] =  2,
    [0xE4] =  2,
    [0xEC] =  2,

    --CPY
    [0xC0] =  2,
    [0xC4] =  2,
    [0xCC] =  2,


    --自增/减操作
    --INC
    [0xE6] =  2,
    [0xEE] =  3,
    [0xF6] =  2,
    [0xFE] =  3,

    --DEC
    [0xC6] =  2,
    [0xCE] =  3,
    [0xD6] =  2,
    [0xDE] =  3,

    [0xE8] =  1,
    [0xCA] =  1,
    [0xC8] =  1,
    [0x88] =  1,

    --移位操作
    --ASL
    [0x06] =  2,
    [0x0A] =  1,
    [0x0E] =  3,
    [0x16] =  2,
    [0x1E] =  3,

    --LSR
    [0x46] =  2,
    [0x4A] =  1,
    [0x4E] =  3,
    [0x56] =  2,
    [0x5E] =  3,

    --ROL
    [0x26] =  2,
    [0x2A] =  1,
    [0x2E] =  3,
    [0x36] =  2,
    [0x3E] =  3,

    --ROR
    [0x66] =  2,
    [0x6A] =  1,
    [0x6E] =  3,
    [0x76] =  2,
    [0x7E] =  3,

    --跳转与调用子程
    [0x4C] =  3,
    [0x6C] =  3,
    [0x20] =  3,
    [0x60] =  1,

    --分支跳转
    [0xF0] =  2,
    [0xD0] =  2,
    [0xB0] =  2,
    [0x90] =  2,
    [0x70] =  2,
    [0x50] =  2,
    [0x30] =  2,
    [0x10] =  2,

    --状态标志操作
    [0x18] =  1,
    [0x38] =  1,
    [0x58] =  1,
    [0x78] =  1,
    [0xD8] =  1,
    [0xF8] =  1,
    [0xB8] =  1,
    
    --系统功能指令
    [0x00] =  1,
    [0xEA] =  1,
    [0x40] =  1
}
   
--初始化指令表
for i = 0, 0xFF, 1 do
    if introduction_set[i] then
        --emu.print(string.format("%02X %d", i, introduction_set[i]))
    end
end

--初始化记录表
for i = 1, 0xFF, 1 do
    music_record_list[i] = false
end

--初始化记录表
for i = 0, 0xFFFF, 1 do
    data_list[i] = 0xFF
end

file_read = io.open ("file_read.bin", "wb+")
file_write = io.open ("file_write.bin", "wb+")
file_exec = io.open ("file_exec.bin", "wb+")

--记录读取地址的数据(字节)
function on_addr_read_bin(address, size, value)
    data_list[address] = value
    
    if 0xC400 == address then
        emu.print(string.format("%04X %02X", address, value))
    end
    if 0xC401 == address then
        emu.print(string.format("%04X %02X", address, value))
    end
end

--记录执行地址的数据(字节)
function on_addr_exec_bin()
    pc = memory.getregister("pc")
    introduction = memory.readbyte(pc)
    
    if introduction_set[introduction] then
        length = introduction_set[introduction]
        for i = 1, length, 1 do
            data_list[pc + i - 1] = memory.readbyte(pc + i - 1)
        end
    end
end

--注册读取回调
memory.registerread(0x8000, 0x8000, on_addr_read_bin)

--注册执行回调
--memory.registerexec(0x8000, 0x8000, on_addr_exec_bin)

--停止回调
function on_exit()
    file_read:close()
    file_write:close()
    
    for i = 0x0000, 0xFFFF, 1 do
        file_exec:write(string.char(data_list[i]))
    end

    file_exec:close()
    emu.print("stop...")
end

emu.registerexit(on_exit)

emu.print("start...")
while (true) do
	emu.frameadvance()
    cur_frame_count = cur_frame_count + 1
    frame_seconds = math.floor(cur_frame_count / 60.0988)
    if last_frame_seconds ~= frame_seconds then
        last_frame_seconds = frame_seconds
    end
end
