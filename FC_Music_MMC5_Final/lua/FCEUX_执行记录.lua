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

--初始化记录表
for i=1, 0xFF, 1 do
    music_record_list[i] = false
end

file_read = io.open ("file_read.txt", "wb")
file_write = io.open ("file_write.txt", "wb")
file_exec = io.open ("file_exec.txt", "wb+")

--记录读取地址的数据(字节)
function on_addr_read_bin(address, size, value)
    file_read:write(string.char(value))
end

--记录写入地址的数据(字节)
function on_addr_write_bin(address, size, value)
    file_write:write(string.char(value))
end

--记录执行地址的数据(字节)
function on_addr_exec_bin()
    pc = memory.getregister("pc")
    file_exec:write(string.char(memory.getregister("a")))
end

--记录读取地址的数据(文本)
function on_addr_read_text(address, size, value)
    if 0 == (byte_read_count%16) and 0 ~= byte_read_count then
        file_read:write("\n")
    end
    
    if 15 == (byte_read_count%16) then
        file_read:write(string.format("%0.2X", value))
    else
        file_read:write(string.format("%0.2X ", value))
    end
    
    byte_read_count = byte_read_count + 1
end

--记录写入地址的数据(文本)
function on_addr_write_text(address, size, value)
    if 0 == (byte_write_count%16) and 0 ~= byte_write_count then
        file_write:write("\n")
    end
    
    if 15 == (byte_write_count%16) then
        file_write:write(string.format("%0.2X", value))
    else
        file_write:write(string.format("%0.2X ", value))
    end
    
    byte_write_count = byte_write_count + 1
end

--记录执行地址的数据(文本)
function on_addr_exec_text()
    pc = memory.getregister("pc")
    reg_a = memory.getregister("a")
    if false == music_record_list[reg_a] then
        music_record_list[reg_a] = true
        music_index = music_index + 1
        info = string.format("%0.3d: %0.2X\n", music_index, reg_a)
        emu.print(info)
        file_exec:write(info)
    end
end

--注册端口读取回调
memory.registerread(0x6000, 1, on_addr_read_text)

--注册端口写入回调
--memory.registerwrite(0x4011, 1, on_addr_write_text)

--注册端口执行回调
--memory.registerexec(0xF114, on_addr_exec)

--停止回调
function on_exit()
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
