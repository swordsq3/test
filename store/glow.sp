#if defined STANDALONE_BUILD
#include <sourcemod>
#include <sdktools>

#include <store>
#include <zephstocks>
#endif

char g_eGlow[STORE_MAX_ITEMS][16];
new g_iGlow = 0;

int g_iPlayerGlowEntity[MAXPLAYERS+1] = {INVALID_ENT_REFERENCE,...};
bool g_iPlayerRandomHooked[MAXPLAYERS+1] = {false,...};
bool g_countg[MAXPLAYERS+1] = {false,...};

#if defined STANDALONE_BUILD
public OnPluginStart()
#else
public Glow_OnPluginStart()
#endif
{
	Store_RegisterHandler("glow", "color", Glow_OnMapStart, Glow_Reset, Glow_Config, Glow_Equip, Glow_Remove, true);
	HookEvent("player_spawn", Glow_PlayerSpawn);
}

public Glow_OnClientDisconnect(client)
{
	Glow_Remove(client);
	g_iPlayerGlowEntity[client]=INVALID_ENT_REFERENCE;
	g_iPlayerRandomHooked[client]=false;
}

public Action:Glow_PlayerSpawn(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	if(!client || !IsClientInGame(client) || !IsPlayerAlive(client) || !(2<=GetClientTeam(client)<=3))
		return Plugin_Continue;
	
	CreateTimer(1.0, Glow_PlayerSpawn_Post, client);

	return Plugin_Continue;
}

public Action:Glow_PlayerSpawn_Post(Handle:timer, any:client)
{
	g_countg[client]=false;
	
	new m_iEquippedGlow=-1;
	m_iEquippedGlow	 = Store_GetEquippedItem(client,"glow");
	
	if(m_iEquippedGlow >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedGlow);
		Command_Rainbow(client,g_eGlow[m_iData]);
	}
	return Plugin_Stop;
}



public Glow_OnMapStart()
{
}

public Glow_Reset()
{
	g_iGlow = 0;
}

public Glow_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, g_iGlow);
	
	KvGetString(kv, "color", g_eGlow[g_iGlow], 16);
	
	++g_iGlow;
	return true;
}


public Glow_Equip(client, id)
{
	int m_iData=Store_GetDataIndex(id);
	Command_Rainbow(client,g_eGlow[m_iData]);
	return 0;
}

public Glow_Remove(client)
{
	if(TF2_HasGlow(client))
	{
		int iGlow = EntRefToEntIndex(g_iPlayerGlowEntity[client]);
		if(iGlow != INVALID_ENT_REFERENCE)
		{
			AcceptEntityInput(iGlow, "Kill");
			g_iPlayerGlowEntity[client] = INVALID_ENT_REFERENCE;
			if(g_iPlayerRandomHooked[client])
			{
				SDKUnhook(client, SDKHook_PreThink, OnPlayerThink);
			}
		}
	}
	return 0;
}

public Command_Rainbow(int client, char[] color)
{
	char r[4];
	char g[4];
	char b[4];
	
	bool randomcolor;
	
	if(color[0] == 'r')
	{
//		ReplyToCommand(client, "Random");
		randomcolor = true;
	}
	else
	{	
		strcopy(r, 4, color);
		strcopy(g, 4, color[3]);
		strcopy(b, 4, color[6]);
//		ReplyToCommand(client, "R: %s", r);
//		ReplyToCommand(client, "G: %s", g);
//		ReplyToCommand(client, "B: %s", b);
	}
	

	Glow_Remove(client);
	
	int iGlow = TF2_CreateGlow(client);
	if(IsValidEntity(iGlow))
	{
		g_iPlayerGlowEntity[client] = EntIndexToEntRef(iGlow);
	}
			
	if(randomcolor == false)
	{
		int clr[4];
		clr[0] = StringToInt(r);
		clr[1] = StringToInt(g);
		clr[2] = StringToInt(b);
		clr[3] = 255;
					
		SetVariantColor(clr);
		AcceptEntityInput(iGlow, "SetGlowColor");
	}
	else
	{
		g_iPlayerRandomHooked[client] = true;
		SDKHook(client, SDKHook_PreThink, OnPlayerThink);
	}
}

public Action OnPlayerThink(int client)
{
	int iGlow = EntRefToEntIndex(g_iPlayerGlowEntity[client]);
	if(iGlow != INVALID_ENT_REFERENCE)
	{
		
		int color[4];
		color[0] = RoundToNearest(Cosine(GetGameTime()  + client + 0) * 127.5 + 127.5);
		color[1] = RoundToNearest(Cosine(GetGameTime()  + client + 2) * 127.5 + 127.5);
		color[2] = RoundToNearest(Cosine(GetGameTime()  + client + 4) * 127.5 + 127.5);
		color[3] = 255;
		
		SetVariantColor(color);
		AcceptEntityInput(iGlow, "SetGlowColor");
	}
}

stock int TF2_CreateGlow(int iEnt)
{
	char oldEntName[64];
	GetEntPropString(iEnt, Prop_Data, "m_iName", oldEntName, sizeof(oldEntName));

	char strName[126], strClass[64];
	GetEntityClassname(iEnt, strClass, sizeof(strClass));
	Format(strName, sizeof(strName), "%s%i", strClass, iEnt);
	DispatchKeyValue(iEnt, "targetname", strName);
	
	int ent = CreateEntityByName("tf_glow");
	DispatchKeyValue(ent, "targetname", "RainbowGlow");
	DispatchKeyValue(ent, "target", strName);
	DispatchKeyValue(ent, "Mode", "0");
	DispatchSpawn(ent);
	
	AcceptEntityInput(ent, "Enable");
	
	//Change name back to old name because we don't need it anymore.
	SetEntPropString(iEnt, Prop_Data, "m_iName", oldEntName);

	return ent;
}

stock bool TF2_HasGlow(int iEnt)
{
	int index = -1;
	while ((index = FindEntityByClassname(index, "tf_glow")) != -1)
	{
		if (GetEntPropEnt(index, Prop_Send, "m_hTarget") == iEnt)
		{
			return true;
		}
	}
	
	return false;
}