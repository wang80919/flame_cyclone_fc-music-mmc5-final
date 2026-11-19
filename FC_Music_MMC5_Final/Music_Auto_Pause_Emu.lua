-----------------------
-- Name: Music play control for FCEUX
-- Author: FlameCyclone
-- Date: 2024.10.13
-----------------------
-- Music play control
-----------------------

local item_select_port = 0x60
local track_select_port = 0x61
local track_max_port = 0x62
local cur_item_port = 0x601E
local music_stop_addr = 0x6025
local auto_play_port = 0x6028
local cur_track_port = 0x6036

local Fast_Item         = 0xFFE0
local Fast_Music        = 0xFFE2
local Item_Max          = 0xFFE4
local Item_Cur          = 0xFFE6
local Track_Cur         = 0xFFE8
local Stop_Statee       = 0xFFEA
local Auto_Play         = 0xFFEC

function update_port()
    item_select_port    = memory.readword(Fast_Item)
    track_select_port   = memory.readword(Fast_Music)
    track_max_port      = memory.readword(Item_Max)
    cur_item_port       = memory.readword(Item_Cur)
    cur_track_port      = memory.readword(Track_Cur)
    music_stop_addr     = memory.readword(Stop_Statee)
    auto_play_port      = memory.readword(Auto_Play)
end

emu.print("start...")

--停止回调
function on_exit()
    emu.print("stop...")
end

emu.registerexit(on_exit)

update_port()

while (true) do

	emu.frameadvance()
    
    local is_stop = memory.readbyte(music_stop_addr)
    if 1 == is_stop then
        emu.frameadvance()
        emu.pause()
    end
    
end
