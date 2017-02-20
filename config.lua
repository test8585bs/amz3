return {
  bot_api_key = '247505227:AAG1Iatya9cbYB2TjVouvI0D3P8FhDcrtt0',
  admin = 221425094,
  channel = 'JackiTeam_ch',

  plugins = {
    'Start.lua',
  },
	api_errors = {
		[101] = 'Not enough rights to kick participant', --SUPERGROUP: bot is not admin
		[102] = 'USER_ADMIN_INVALID', --SUPERGROUP: trying to kick an admin
		[103] = 'method is available for supergroup chats only', --NORMAL: trying to unban
		[104] = 'Bad Request: Only creator of the group can kick admins from the group', --NORMAL: trying to kick an admin
		[105] = 'Bad Request: Need to be inviter of the user to kick it from the group', --NORMAL: bot is not an admin or everyone is an admin
		[106] = 'USER_NOT_PARTICIPANT', --NORMAL: trying to kick an user that is not in the group
		[107] = 'CHAT_ADMIN_REQUIRED', --NORMAL: bot is not an admin or everyone is an admin
		[400] = ':|',
		
		[110] = 'PEER_ID_INVALID', --user never started the bot
		[111] = 'Bad Request: message is not modified', --the edit message method hasn't modified the message
		[112] = 'Bad Request: Can\'t parse message text: Can\'t find end of the entity starting at byte offset %d+', --the markdown is wrong and breaks the delivery
		[113] = 'Bad Request: group chat is migrated to a supergroup chat', --group updated to supergroup
		[114] = 'Bad Request: Message can\'t be forwarded', --unknown
		[115] = 'Message text is empty', --empty message
		[116] = 'message not found', --message id invalid, I guess
		
		[120] = 'Can\'t parse reply keyboard markup JSON object', --keyboard table invalid
		[121] = 'Field \\\"inline_keyboard\\\" of the InlineKeyboardMarkup should be an Array of Arrays', --inline keyboard is not an array of array
		[122] = 'Can\'t parse inline keyboard button: InlineKeyboardButton should be an Object',
		[123] = 'Bad Request: Object expected as reply markup', --empty inline keyboard table
		
		[130] = 'Type of file to send mismatch', --tryin to send a media with the wrong method
		
		[403] = 'Bot was blocked by the user', --user blocked the bot
		[429] = 'Too many requests: retry later', --the bot is hitting api limits
	}
}
