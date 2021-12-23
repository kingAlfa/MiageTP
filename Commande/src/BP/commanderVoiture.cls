/// 
Class BP.commanderVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.commandeVoitureDmde' response='msg.commandeVoitureRpse' height='2000' width='2000' >
<context>
<property name='categorie' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='voiture' type='msg.commandeVoitureRpse' instantiate='0' />
</context>
<sequence xend='200' yend='1650' >
<call name='controlerVoitureCatalogueExist' target='Catalogue' async='0' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.Marque" action="set" />
<assign property="callrequest.modele" value="request.Modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.voiture" value="callresponse.voiture" action="set" />
</response>
</call>
<if name='SiVoitureExiste' condition='response.codeRetour="OK"' xpos='200' ypos='350' xend='200' yend='1550' >
<true>
<call name='DemandePlaque' target='Plaque' async='0' xpos='335' ypos='500' >
<request type='Ens.Request' />
<response type='Ens.Response' />
</call>
<if name='demandePlaqueExits' condition='response.codeRetour="OK"' xpos='335' ypos='600' xend='335' yend='1450' >
<true>
<if name='SiNbPlaces2' condition='context.voiture.nbPlaces=2' xpos='470' ypos='750' xend='470' yend='1250' >
<true>
<assign name="NbPlaces2Categorie2places" property="context.categorie" value="&quot;2 places&quot;" action="set" xpos='470' ypos='900' />
</true>
<false>
<if name='SiNbPlcaces7' condition='context.voiture.nbPlaces=7' xpos='740' ypos='900' xend='740' yend='1150' >
<true>
<assign name="NbPlaces7Categorie7" property="context.categorie" value="&quot;7 places&quot;" action="set" xpos='1010' ypos='1050' />
</true>
<false>
<assign name="SiAutres" property="context.categorie" value="response.voiture.type" action="set" xpos='740' ypos='1050' />
</false>
</if>
</false>
</if>
<call name='AppelleVoiture' target='Voiture' async='1' xpos='470' ypos='1350' disabled="true">
<request type='msg.creerVoitureDmde' />
<response type='msg.creerVoitureRpse' />
</call>
</true>
</if>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
