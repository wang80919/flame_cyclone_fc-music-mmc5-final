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
end

--记录执行地址的数据(字节)
function on_addr_exec_bin()
    pc = memory.getregister("pc")
    data_list[pc] = memory.readbyte(pc)
    data_list[pc+1] = memory.readbyte(pc+1)
    data_list[pc+2] = memory.readbyte(pc+2)
end

--注册端口写入回调
memory.registerread(0x8000, 0x8000, on_addr_read_bin)

--注册执行回调
--memory.registerexec(0x8000, 0x8000, on_addr_exec_bin)

--停止回调
function on_exit()
    
    for i = 0x0000, 0xFFFF, 1 do
        file_read:write(string.char(data_list[i]))
    end

    file_read:close()
    file_write:close()
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
