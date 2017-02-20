local function do_keyboard_school1()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    	{text = 'هفتم', callback_data = '!school7'},
			}
		{
    	{text = 'هشتم', callback_data = '!school8'},
			}
		{
    	{text = 'نهم', callback_data = '!school9'},
			}
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_school2()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'دستورات پرکاربرد کلی', callback_data = '!cmds1'},
    		    		{text = 'اموزش های بیشتر', url = 'https://telegram.me/sphero_ch'},
	    },
		{
	    {text = 'اموزش ادمین کردن در ربات', callback_data = '!cmds2'},
 },      
	    {
	    {text = '🔙بازگشت', callback_data = '!robot'}
 }      
    }
    return keyboard
end
local function do_keyboard_teach1()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
	    {text = '🔙بازگشت', callback_data = '!home'},
 }      
    }
    return keyboard
end
local function do_keyboard_teach2()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
	    {text = '🔙بازگشت', callback_data = '!commands'},
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
    		{text = '📍دانش اموز📍', callback_data = '!school'},
	    },
		{
	        {text = '📍اموزگار📍', callback_data = '!teach'},
        },
        }
    }
    return keyboard
end

local function do_keyboard_teach()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'دوره متوسطه اول', callback_data = '!teach1'},
	    }
		{
    		{text = 'دوره متوسطه دوم', callback_data = '!teach2'},
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
	    {text = '🔙بازگشت به منوی اصلی', callback_data = '!home'},
        }
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[*📍سلام خوش اومدید*📍
*میتونم کمکتون کنم??👇👇*]]
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
        if query == 'channel' then
            local text = '📍*کانال اسفرو و تیم ما📍*'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[`در این بخش میتونید امکانات ربات اسفرو رو مشاهده کنید و با قیمت و دستورات اشنا بشید.`]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'cmds1' then
            local text = [[_📌بهترین مرجع اموزش دستورات ربات ضدلینک📍_
			!filter کلمه`

اگر کسی داخل گروه سلام بده

پاک میشه

و اگه خواستین

کلمه رو در بیارین

!unfilter سلام

برای تعطیل کردن گروه

!mute all

برای دوباره باز کردن گروه

!unmute all

برای قفلکردن فحش و ی سری کلمات رکیک

!lock fosh

برای قفل کردن پیام فروارد شده از جایی

!lock fwd

برای ارتقا دادن یک نفر به ادمین ربات که دیگ لینکاش پاک نشه و بتونه به ربات دستور بده و ....

!promote @یوزرنیم

برای عزل مقام ادمینی ربات

!demote @یوزرنیم

برای پاک کردن پیام های ورود و خروج

!lock tgservice

و ....

!help
بزنین خودش دستوراتشو میگه

پاک کردن پیام به تعداد دلخواه

!rmsg تعداد

اگه بخواین تا ساعت محدودی گروهو تعطیل کنید که بعد اون باز بشه
H = ساعت
M = دقیقه
S = ثانیه
مثلا برای هشت ساعت و نیم باید از دستور زیر استفاده کنید
!muteall 8h 30m 1s
`ثانیه دیگ چون مهم نیست توضیح ندادم بعد از هشت ساعت و نیم گروه ب صورت خودکار باز میشه و مردم دوباره میتونن پست بزارن]]
            local keyboard = do_keyboard_cmds1()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'cmds2' then
            local text = [[خب اول باید یوزرنیم ادمینتون رو داشته باشید
دستور همونجور که داخل دستورات کلی اموزش داده شده 
/promote @یوزرنیم
هست.
یعنی اگر یوزرنیم ادمین شما
@abcde
هست اینجوری ادمین ربات بکنیدش
/promote @abcde
به همین راحتی توجه کنید که دستور باید در گروه فرستاده شود 
آین دستور گاهی وقتا با ریپلی هم کار میده یعنی روی پیام ادمینتون ریپلی کنید و
/promote
بزنید تا بتونید به ربات بشناسونیدش سوالی بود داخل قسمت ارسال پیام همین ربات در خدمتم]]
            local keyboard = do_keyboard_cmds2()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'shop' then
            local text = [[⚜✅ربات ضدلینک⚜✅
رباتی هست که تبلیغات و فحش های داخل گروه شمارو پاک میکنه🔰 گروه رو به دلخواه شما و به مدت زمانی که دوست دارید تعطیل میکنه تا هیچ پستی نباشه🔰 کلمه ای که میخواین رو ممنوع میکنه🔰 پیام هارو فقط با فرستادن یک دستور به تعداد دلخواه پاک میکنه🔰 و.....
‼️بسیار امکانات دیگر♻️
بعضی از امکانات:
☑️پاک کردن پیام به تعداد دلخواه
🔳ممنوع کردم یک کلمه
🔴ضد فحش
⚫️ضد لینک
🔘ضد اسپم
⚪️انتی فروارد با قابلیت تنظیم
🔵شناسایی لینک ها حتی در عکس و فایل
🔴شناسایی ادمین ها و پاک نکردن پست ها و لینک های اونها
⚫️قفل استیکر
ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ
🅰پشتیبانی 24 ساعت انلاین با ادمینی خوش برخورد و قابل اعتماد.
قابلیت بازگشت وجه در صورت هرگونه نارضایتی تا 48 ساعت
ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ
🅱با قیمتی بسیار مناسب و ناچیز همین حالا گروه خودتون رو ضد لینک کنید.
تحویل انی و نصب سریع
همراه با اموزش مخصوص برای مدیر گروه.
ـــــــــــــــــــــــــــــــــــــــــــــــ ـــــــــــــــــــــــــــــــــــــــــــــــ
✅قیمت :
 ماهانه 8 
دوماهه 15
سه ماهه 22
دائمی 40 
توجه کنید که همه گروه ها اگه بالای 1k باشه دوتا ربات ادد میشه و اگه زیر این تعداد باشه یک ربات و قیمت یکسانه در ضمن اگر کسی دائمی خرید کنه یک پیام رسان به صورت کاملا مجانی بهش داده میشه
—---------------------------------------------------------------------—
🅾🅾شماره حساب و ادمین و نصاب ربات:
6221 0611 0351 8553
مجتبی صالحی بانک پارسیان 
 شارژ پذیرفته نمیشود مگر در موارد استثنا.
ایدی نصب کننده : @MrBlackLife 🆔]]
            local keyboard = do_keyboard_shop()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'commands' then
            local text = [[`با دستورات به راحتی اشنا بشید.`]]
            local keyboard = do_keyboard_commands()
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
	    '^/(start)@Sphero_Bot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^/(ver)$',
	    '^###cb:!(home)',
	    '^###cb:!(commands)',
	    '^###cb:!(channel)',
	    '^###cb:!(cmds1)',
	    '^###cb:!(cmds2)',
	    '^###cb:!(robot)',
            '^###cb:!(shop)',
	    '^###cb:!(share)',

    }
}
