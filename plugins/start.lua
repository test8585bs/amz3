local function do_keyboard_school1()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    	{text = 'هفتم', callback_data = '!school7'},
			},
		{
    	{text = 'هشتم', callback_data = '!school8'},
			},
		{
    	{text = 'نهم', callback_data = '!school9'},
			},
	    {
	    {text = '🔙', callback_data = '!student'}
        }
    }
    return keyboard
end
local function do_keyboard_school2()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    	{
    	{text = 'دهم', callback_data = '!school10'},
			},
    		    		{
    	{text = 'یازدهم', callback_data = '!school11'},
			},
		{
	    {text = 'دوازدهم', callback_data = '!school12'},
 },      
	    {
	    {text = '🔙', callback_data = '!student'}
 }      
    }
		}
    return keyboard
end
local function do_keyboard_teach1()
    local keyboard = {}
    keyboard.inline_keyboard = {
	{
    	{text = 'هفتم', callback_data = '!teach7'},
			},
		{
    	{text = 'هشتم', callback_data = '!teach8'},
			},
		{
    	{text = 'نهم', callback_data = '!teach9'},
			},
	    {
	    {text = '🔙', callback_data = '!teach'}
        }
    }
    return keyboard
end
local function do_keyboard_teach2()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    	{
    	{text = 'دهم', callback_data = '!teach10'},
			},
    		    		{
    	{text = 'یازدهم', callback_data = '!teach11'},
			},
		{
	    {text = 'دوازدهم', callback_data = '!teach12'},
 },      
	    {
	    {text = '🔙بازگشت', callback_data = '!teach'}
 }      
    }
		}
    return keyboard
end
local function do_keyboard_cmds2()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
	    {text = '🔙بازگشت', callback_data = '!commands'},
 }      
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '📍دانش اموز📍', callback_data = '!student'},
	    },
		{
	        {text = '📍اموزگار📍', callback_data = '!teach'},
        },
        
    }
    return keyboard
end

local function do_keyboard_teach()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'دوره متوسطه اول', callback_data = '!teach1'},
	    },
		{
    		{text = 'دوره متوسطه دوم', callback_data = '!teach2'},
	    },
		{
	    {text = '🔙', callback_data = '!home'},
        }
    }
    return keyboard
end
local function do_keyboard_student()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'دوره متوسطه اول', callback_data = '!school1'},
	    },
{
    		{text = 'دوره متوسطه دوم', callback_data = '!school2'},
	    },
		{
	    {text = '🔙', callback_data = '!home'},
        }
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[👋سلام!\nلطفا *نوع کاربری* خود را انتخاب کنید:]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, 'سلام منو با زدن دکمه زیر در پیوی استارت کنید و لذت ببرید' ,do_keyboard_startme(), true)
        end
        return
    end
    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'student' then
            local text = '📍👋سلام!\nدوره تحصیلی خود را انتخاب کنید:'
            local keyboard = do_keyboard_student()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'school1' then
            local text = [[پایه تحصیلی* خود را انتخاب کنید*:]]
            local keyboard = do_keyboard_school1()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'school2' then
            local text = [[👋پایه تحصیلی* خود را انتخاب کنید*:]]
            local keyboard = do_keyboard_school2()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'teach' then
            local text = [[دوره تدریسی* خود را انتخاب کنید*:]]
            local keyboard = do_keyboard_teach()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'teach1' then
            local text = [[پایه تحصیلی* خود را انتخاب کنید*:]]
            local keyboard = do_keyboard_teach1()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'teach2' then
            local text = [[پایه تحصیلی* خود را انتخاب کنید*:]]
            local keyboard = do_keyboard_teach2()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍شما به صفحه اول برگشتید📍
📌یک دکمه را انتخاب کنید🔥
]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+18493037075', '📍Sphero')
end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)@Amoozz_bot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^/(ver)$',
	    '^###cb:!(home)',
	    '^###cb:!(teach)',
	    '^###cb:!(teach1)',
	    '^###cb:!(teach2)',
	    '^###cb:!(student)',
	    '^###cb:!(school1)',
            '^###cb:!(school2)',
	    '^###cb:!(share)',

    }
}
