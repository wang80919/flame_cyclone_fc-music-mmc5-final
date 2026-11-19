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

--初始化记录表
for i=1, 0xFF, 1 do
    music_record_list[i] = false
end

file = io.open ("list.txt", "w+")

--音乐初始化回调
function on_music_init()
    reg_a = memory.getregister("a")
    if false == music_record_list[reg_a] then
        music_record_list[reg_a] = true
        music_index = music_index + 1
        info = string.format("%0.3d: %0.2X\n", music_index, reg_a)
        emu.print(info)
        file:write(info)
    end
    
end

--注册端口写入回调
memory.registerexec(0xF114, on_music_init)

--停止回调
function on_exit()
    file:close()
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
