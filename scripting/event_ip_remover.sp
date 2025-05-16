#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = {
	name = "Event IP remover",
	description = "Disables broadcasting of player IP to clients for security",
	author = "Anonymous",
	version = "0.1.1",
	url = "",
};

public void OnPluginStart()
{
	HookEvent("player_connect", Event_PlayerConnectPre, EventHookMode_Pre);
}

public Action Event_PlayerConnectPre(Event event, const char[] name, bool dontBroadcast)
{
	char playerName[32];
	event.GetString("name", playerName, sizeof(playerName), "player");
	PrintToChatAll("%s has joined the game", playerName);
	event.BroadcastDisabled = true;
	
	return Plugin_Continue;
}
