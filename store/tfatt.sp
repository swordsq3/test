#if defined STANDALONE_BUILD
#include <tf2attributes>

#include <store>
#include <zephstocks>
#endif
//무기
new g_att_370[16];
new i_att_370;
new g_att_2013[16];
new i_att_2013;
new g_att_2014[16];
new i_att_2014;
new g_att_2053[16];
new i_att_2053;
//할로윈
new g_att_1005[16];
new i_att_1005;
new g_att_1006[2];
new i_att_1006;
new g_att_1007[2];
new i_att_1007;
new g_att_1008[2];
new i_att_1008;
new g_att_1009[2];
new i_att_1009;
//FUN
new g_att_333[32];
new i_att_333;

#if defined STANDALONE_BUILD
public OnPluginStart()
#else
public TfAtt_OnPluginStart()
#endif
{
	Store_RegisterHandler("tf2att_370_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_370_Config, TfAtt_Equip_370, TfAtt_Remove_370, true);
	Store_RegisterHandler("tf2att_2013_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_2013_Config, TfAtt_Equip_2013, TfAtt_Remove_2013, true);
	Store_RegisterHandler("tf2att_2014_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_2014_Config, TfAtt_Equip_2014, TfAtt_Remove_2014, true);
	Store_RegisterHandler("tf2att_2053_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_2053_Config, TfAtt_Equip_2053, TfAtt_Remove_2053, true);
	
	Store_RegisterHandler("tf2att_1005_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_1005_Config, TfAtt_Equip_1005, TfAtt_Remove_1005, true);
	Store_RegisterHandler("tf2att_1006_", "", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_1006_Config, TfAtt_Equip_1006, TfAtt_Remove_1006, true);
	Store_RegisterHandler("tf2att_1007_", "", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_1007_Config, TfAtt_Equip_1007, TfAtt_Remove_1007, true);
	Store_RegisterHandler("tf2att_1008_", "", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_1008_Config, TfAtt_Equip_1008, TfAtt_Remove_1008, true);
	Store_RegisterHandler("tf2att_1009_", "", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_1009_Config, TfAtt_Equip_1009, TfAtt_Remove_1009, true);
	
	Store_RegisterHandler("tf2att_333_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_333_Config, TfAtt_Equip_333, TfAtt_Remove_333, true);
	HookEvent("post_inventory_application", Att_333_post);
}

#if defined STANDALONE_BUILD
public OnClientPutInServer(client)
#else
public TfAtt_OnClientPutInServer(client)
#endif
{
	CreateTimer(1.0,TfAttTimer,client);
}
public Action:TfAttTimer(Handle:Tiemr,any:client)
{
	att_370_PutInServer(client);
	att_2013_PutInServer(client);
	att_2014_PutInServer(client);
	att_2053_PutInServer(client);
	
	att_1005_PutInServer(client);
	att_1006_PutInServer(client);
	att_1007_PutInServer(client);
	att_1008_PutInServer(client);
	att_1009_PutInServer(client);
	
	return Plugin_Stop;
}

public TfAtt_OnMapStart()
{
}

public TfAtt_Reset()
{
	i_att_370 = 0;
	i_att_2013 = 0;
	i_att_2014 = 0;
	i_att_2053 = 0;
	
	i_att_1005 = 0;
	i_att_1006 = 0;
	i_att_1007 = 0;
	i_att_1008 = 0;
	i_att_1009 = 0;
	
	i_att_333 = 0;
}
//--------------------------config---------------------------------
//370
public TfAtt_370_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_370);

	g_att_370[i_att_370] = KvGetNum(kv, "code",0);
	++i_att_370;
	return true;
}
//2013
public TfAtt_2013_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_2013);

	g_att_2013[i_att_2013] = KvGetNum(kv, "code",0);
	++i_att_2013;
	return true;
}
//2014
public TfAtt_2014_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_2014);

	g_att_2014[i_att_2014] = KvGetNum(kv, "code",0);
	++i_att_2014;
	return true;
}
//2053
public TfAtt_2053_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_2053);

	g_att_2053[i_att_2053] = KvGetNum(kv, "code",0);
	++i_att_2053;
	return true;
}
/*-----------------------------------------------------------------
----------------------------Equip----------------------------------
-----------------------------------------------------------------*/

//--------------------------370---------------------------------
public TfAtt_Equip_370(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 370, float(g_att_370[m_iData]));
	return -1;
}

public TfAtt_Remove_370(client)
{
	TF2Attrib_RemoveByDefIndex(client, 370);
}

stock att_370_PutInServer(client)
{
	new m_iEquippedAtt370=-1;
	m_iEquippedAtt370	 = Store_GetEquippedItem(client,"tf2att_370_");
	
	if(m_iEquippedAtt370 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt370);
		TF2Attrib_SetByDefIndex(client, 370, float(g_att_370[m_iData]));
	}
}

//--------------------------2013---------------------------------
public TfAtt_Equip_2013(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 2013, float(g_att_2013[m_iData]));
	TF2Attrib_SetByDefIndex(client, 2025, 3.0);
	return -1;
}

public TfAtt_Remove_2013(client)
{
	TF2Attrib_RemoveByDefIndex(client, 2013);
	TF2Attrib_RemoveByDefIndex(client, 2025);
}

stock att_2013_PutInServer(client)
{
	new m_iEquippedAtt2013=-1;
	m_iEquippedAtt2013	 = Store_GetEquippedItem(client,"tf2att_2013_");
	
	if(m_iEquippedAtt2013 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt2013);
		TF2Attrib_SetByDefIndex(client, 2013, float(g_att_2013[m_iData]));
		TF2Attrib_SetByDefIndex(client, 2025, 3.0);
	}
}

//--------------------------2014---------------------------------
public TfAtt_Equip_2014(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 2014, float(g_att_2014[m_iData]));
	return -1;
}

public TfAtt_Remove_2014(client)
{
	TF2Attrib_RemoveByDefIndex(client, 2014);
}

stock att_2014_PutInServer(client)
{
	new m_iEquippedAtt2014=-1;
	m_iEquippedAtt2014	 = Store_GetEquippedItem(client,"tf2att_2014_");
	
	if(m_iEquippedAtt2014 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt2014);
		TF2Attrib_SetByDefIndex(client, 2014, float(g_att_2014[m_iData]));
	}
}
//--------------------------2053---------------------------------
public TfAtt_Equip_2053(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 2053, float(g_att_2053[m_iData]));
	return -1;
}

public TfAtt_Remove_2053(client)
{
	TF2Attrib_RemoveByDefIndex(client, 2053);
}

stock att_2053_PutInServer(client)
{
	new m_iEquippedAtt2053=-1;
	m_iEquippedAtt2053	 = Store_GetEquippedItem(client,"tf2att_2053_");
	
	if(m_iEquippedAtt2053 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt2053);
		TF2Attrib_SetByDefIndex(client, 2053, float(g_att_2053[m_iData]));
	}
}

//--------------------------1005---------------------------------
public TfAtt_1005_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_1005);

	g_att_1005[i_att_1005] = KvGetNum(kv, "code",0);
	++i_att_1005;
	return true;
}

public TfAtt_Equip_1005(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 1005, float(g_att_1005[m_iData]));
	return -1;
}

public TfAtt_Remove_1005(client)
{
	TF2Attrib_RemoveByDefIndex(client, 1005);
}

stock att_1005_PutInServer(client)
{
	new m_iEquippedAtt1005=-1;
	m_iEquippedAtt1005	 = Store_GetEquippedItem(client,"tf2att_1005_");
	
	if(m_iEquippedAtt1005 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt1005);
		TF2Attrib_SetByDefIndex(client, 1005, float(g_att_1005[m_iData]));
	}
}
//--------------------------1006---------------------------------
public TfAtt_1006_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_1006);

	g_att_1006[i_att_1006] = KvGetNum(kv, "code",0);
	++i_att_1006;
	return true;
}

public TfAtt_Equip_1006(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 1006, float(g_att_1006[m_iData]));
	return -1;
}

public TfAtt_Remove_1006(client)
{
	TF2Attrib_RemoveByDefIndex(client, 1006);
}

stock att_1006_PutInServer(client)
{
	new m_iEquippedAtt1006=-1;
	m_iEquippedAtt1006	 = Store_GetEquippedItem(client,"tf2att_1006_");
	
	if(m_iEquippedAtt1006 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt1006);
		TF2Attrib_SetByDefIndex(client, 1006, float(g_att_1006[m_iData]));
	}
}
//--------------------------1007---------------------------------
public TfAtt_1007_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_1007);

	g_att_1007[i_att_1007] = KvGetNum(kv, "code",0);
	++i_att_1007;
	return true;
}

public TfAtt_Equip_1007(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 1007, float(g_att_1007[m_iData]));
	return -1;
}

public TfAtt_Remove_1007(client)
{
	TF2Attrib_RemoveByDefIndex(client, 1007);
}

stock att_1007_PutInServer(client)
{
	new m_iEquippedAtt1007=-1;
	m_iEquippedAtt1007	 = Store_GetEquippedItem(client,"tf2att_1007_");
	
	if(m_iEquippedAtt1007 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt1007);
		TF2Attrib_SetByDefIndex(client, 1007, float(g_att_1007[m_iData]));
	}
}
//--------------------------1008---------------------------------
public TfAtt_1008_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_1008);

	g_att_1008[i_att_1008] = KvGetNum(kv, "code",0);
	++i_att_1008;
	return true;
}

public TfAtt_Equip_1008(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 1008, float(g_att_1008[m_iData]));
	return -1;
}

public TfAtt_Remove_1008(client)
{
	TF2Attrib_RemoveByDefIndex(client, 1008);
}

stock att_1008_PutInServer(client)
{
	new m_iEquippedAtt1008=-1;
	m_iEquippedAtt1008	 = Store_GetEquippedItem(client,"tf2att_1008_");
	
	if(m_iEquippedAtt1008 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt1008);
		TF2Attrib_SetByDefIndex(client, 1008, float(g_att_1008[m_iData]));
	}
}
//--------------------------1009---------------------------------
public TfAtt_1009_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_1009);

	g_att_1009[i_att_1009] = KvGetNum(kv, "code",0);
	++i_att_1009;
	return true;
}

public TfAtt_Equip_1009(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 1009, float(g_att_1009[m_iData]));
	return -1;
}

public TfAtt_Remove_1009(client)
{
	TF2Attrib_RemoveByDefIndex(client, 1009);
}

stock att_1009_PutInServer(client)
{
	new m_iEquippedAtt1009=-1;
	m_iEquippedAtt1009	 = Store_GetEquippedItem(client,"tf2att_1009_");
	
	if(m_iEquippedAtt1009 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt1009);
		TF2Attrib_SetByDefIndex(client, 1009, float(g_att_1009[m_iData]));
	}
}
//--------------------------333---------------------------------
public TfAtt_333_Config(&Handle:kv, itemid)
{
	Store_SetDataIndex(itemid, i_att_333);

	g_att_333[i_att_333] = KvGetNum(kv, "code",0);
	++i_att_333;
	return true;
}

public TfAtt_Equip_333(client, id)
{
	new m_iData = Store_GetDataIndex(id);
	TF2Attrib_SetByDefIndex(client, 333, float(g_att_333[m_iData]));
	return -1;
}

public TfAtt_Remove_333(client)
{
	TF2Attrib_RemoveByDefIndex(client, 333);
}

public Action:Att_333_post(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	new m_iEquippedAtt333=-1;
	m_iEquippedAtt333	 = Store_GetEquippedItem(client,"tf2att_333_");
	
	if(m_iEquippedAtt333 >=0)
	{
		new m_iData = Store_GetDataIndex(m_iEquippedAtt333);
		TF2Attrib_SetByDefIndex(client, 333, float(g_att_333[m_iData]));
	}
}
