#if defined STANDALONE_BUILD
#include <tf2attributes>

#include <store>
#include <zephstocks>
#endif

new g_att_370[16];
new i_att_370;

#if defined STANDALONE_BUILD
public OnPluginStart()
#else
public TfAtt_OnPluginStart()
#endif
{
	Store_RegisterHandler("tf2att_370_", "code", TfAtt_OnMapStart, TfAtt_Reset, TfAtt_370_Config, TfAtt_Equip_370, TfAtt_Remove_370, true);
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
	return Plugin_Stop;
}

public TfAtt_OnMapStart()
{
}

public TfAtt_Reset()
{
	i_att_370 = 0;

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

