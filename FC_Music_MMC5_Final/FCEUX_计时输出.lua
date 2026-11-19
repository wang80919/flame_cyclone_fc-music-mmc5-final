-----------------------
-- Name: 曲目播放计时器脚本
-- Author: FlameCyclone
-- Date: 2025.6.11
-----------------------
-- 曲目播放计时器脚本
-----------------------

local seconds_per_frame             = 60.0988
local cur_item_index_addr          = 0xFFE6
local cur_track_index_addr         = 0xFFE8
local max_item_index_addr           = 0xFFE4

local cur_item_data_addr = nil
local cur_track_data_addr = nil
local max_item_data_addr = nil

local cur_frame_count = 0

local cur_item_index    = 0
local cur_track_index    = -1
local last_item_index  = -1
local list_state = {}

function on_reset_current_music()
    cur_item_data_addr      = memory.readword(cur_item_index_addr)
    cur_track_data_addr     = memory.readword(cur_track_index_addr)
    max_item_data_addr      = memory.readword(max_item_index_addr)
    cur_item_index          = memory.readbyte(cur_item_data_addr)
    cur_track_index         = memory.readbyte(cur_track_data_addr + cur_item_index)
    item_index_max          = memory.readbyte(max_item_data_addr)

    if nil == list_state[cur_item_index] then
        list_state[cur_item_index] = false
    end
    
    if not list_state[cur_item_index] then
    
        cur_frame_count = 0
        frame_seconds = 0
        last_item_index = cur_item_index
        
        if file then
            file:close()
        end
    
        file = io.open (string.format("曲目时间表%0.3d.txt", cur_item_index + 1), "wb+")
        
        list_state[cur_item_index] = true
    else
        
        if last_item_index ~= cur_item_index then
            if file then
                file:close()
                file = nil
            end
        end
    end
    
    --记录曲目时间
    if file then
        time_s  = math.modf(math.floor(frame_seconds%60))
        time_m = math.modf(math.floor(frame_seconds/60)%60)
        time_h = math.modf(math.floor(frame_seconds/3600))
        
        info = string.format("%0.2d:%0.2d:%0.2d 曲目%d", time_h, time_m, time_s, cur_track_index + 1)
        emu.print(info)
        
        emu.print(string.format("cur_frame_count: %d", cur_frame_count))
    
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
    
    if memory.readword(0x2000) > 0 then
        cur_frame_count = cur_frame_count + 1
        frame_seconds = math.floor(cur_frame_count / seconds_per_frame)
    end
end
