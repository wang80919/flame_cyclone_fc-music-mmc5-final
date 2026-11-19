-----------------------
-- Name: 曲目播放计时器脚本
-- Author: FlameCyclone
-- Date: 2025.6.11
-----------------------
-- 曲目播放计时器脚本
-----------------------

local cur_item_index_addr          = 0xFFE6
local cur_track_index_addr         = 0xFFE8

local cur_item_data_addr = nil
local cur_track_data_addr = nil

local cur_frame_count = 0
local last_frame_seconds = 0

local cur_item_index    = 0
local cur_track_index    = -1
local last_item_index  = -1

local file = nil

function on_reset_current_music()
    cur_item_data_addr       = memory.readword(cur_item_index_addr)
    cur_track_data_addr      = memory.readword(cur_track_index_addr)
    cur_item_index = memory.readbyte(cur_item_data_addr)
    cur_track_index = memory.readbyte(cur_track_data_addr + cur_item_index)

    if last_item_index ~= cur_item_index then
        cur_frame_count = 0
        last_frame_seconds = 0
        if file then
            file:close()
        end
    
        file = io.open (string.format("曲目时间表%0.3d.txt", cur_item_index + 1), "wb+")
        
        last_item_index = cur_item_index
    end

    time_seconds  = math.modf(math.floor(last_frame_seconds%60))
    time_minute = math.modf(math.floor(last_frame_seconds/60)%60)
    time_hour = math.modf(math.floor(last_frame_seconds/3600))
    
    info = string.format("%0.2d:%0.2d:%0.2d 曲目%d", time_hour, time_minute, time_seconds, cur_track_index + 1)
    emu.print(info)
    
    if file then
        file:write(info)
        file:write('\n')
    end
end

--注册端口写入回调
memory.registerread(0xFFF8, on_reset_current_music)

--停止回调
function on_exit()

    if file then
        file:close()
    end
    
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
