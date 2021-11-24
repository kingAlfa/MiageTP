/// 
Class BP.commanderVoiture Extends Ens.BusinessProcessBPL
{

/// This BPLError block indicates that a BPL Diagram 
/// containing errors was saved.
/// To correct this class:
/// * Open it using the Studio BPL Editor,
/// * Correct the errors, and,
/// * Save the diagram.
/// Do not edit the contents of the BPLError block
/// or you may lose your diagram.
XData BPLError
{
<diagram Name="BP.commanderVoiture" Width="2000" Height="2000" Layout="automatic" Language="objectscript" Request="msg.commandeVoitureDmde" Response="msg.commandeVoitureRpse" LastModified="" Version="" Includes="" ShowAnnotation="0">
<context>
<property name='categorie' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='voiture' type='msg.commandeVoitureRpse' instantiate='0' />
</context>
<shape _index="0" _Type="start" Name="" xPos="200" yPos="150" />
<shape _index="1" _Type="end" Name="" xPos="200" yPos="1300" />
<shape _index="2" _Type="call" Name="controlerVoitureCatalogueExist" xPos="200" yPos="250" Async="0" Target="Catalogue" Timeout="" >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.Marque" action="set" />
<assign property="callrequest.modele" value="request.Modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.voiture" value="callresponse.voiture" action="set" />
</response>
</shape>
<shape _index="3" _Type="if" Name="demandePlaqueExits" xPos="188" yPos="381" Condition="response.codeRetour=OK" />
<shape _index="4" _Type="join" Name="PlaqueExistTrue" xPos="200" yPos="1100" />
<shape _index="6" _Type="transform" Name="TransformerVoiture" xPos="200" yPos="1200" Class="" Source="response.voiture.nbPlaces" Target="context.categorie" />
<shape _index="7" _Type="if" Name="SiNbPlaces2" xPos="335" yPos="500" Condition="context.voiture.nbPlaces=2" />
<shape _index="8" _Type="join" Name="" xPos="335" yPos="1000" />
<shape _index="9" _Type="assign" Name="NbPlaces2Categorie2places" xPos="335" yPos="650" Action="set" Key="" Property="context.categorie" Value="&quot;2 places&quot;" />
<shape _index="10" _Type="if" Name="SiNbPlcaces7" xPos="605" yPos="650" Condition="response.voiture.nbPlaces=7" />
<shape _index="11" _Type="join" Name="" xPos="605" yPos="900" />
<shape _index="13" _Type="assign" Name="NbPlaces7Categorie7" xPos="605" yPos="800" Action="" Key="" Property="context.categorie" Value="&quot;7 places&quot;" />
<shape _index="14" _Type="assign" Name="SiAutres" xPos="875" yPos="800" Action="" Key="" Property="context.categorie" Value="response.voiture.type" />
<connection _Type="connector" Name="" from="0" to="2"/>
<connection _Type="connector" Name="" from="2" to="3"/>
<connection _Type="connector" Name="true" from="3" to="7" ConnectType="branch"/>
<connection _Type="connector" Name="false" from="3" to="4" ConnectType="branch"/>
<connection _Type="connector" Name="" from="4" to="6"/>
<connection _Type="connector" Name="" from="6" to="1"/>
<connection _Type="connector" Name="true" from="7" to="9" ConnectType="branch"/>
<connection _Type="connector" Name="false" from="7" to="10" ConnectType="branch"/>
<connection _Type="connector" Name="" from="8" to="4"/>
<connection _Type="connector" Name="" from="9" to="8"/>
<connection _Type="connector" Name="true" from="10" to="13" ConnectType="branch"/>
<connection _Type="connector" Name="false" from="10" to="14" ConnectType="branch"/>
<connection _Type="connector" Name="" from="11" to="8"/>
<connection _Type="connector" Name="" from="13" to="11"/>
<connection _Type="connector" Name="" from="14" to="11"/>
</diagram>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
