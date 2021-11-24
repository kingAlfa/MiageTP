Class msg.commandeVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property Marque As %String;

Property Modele As %String;

Property Couleur As %String;

Storage Default
{
<Data name="commandeVoitureDmdeDefaultData">
<Subscript>"commandeVoitureDmde"</Subscript>
<Value name="1">
<Value>Marque</Value>
</Value>
<Value name="2">
<Value>Modele</Value>
</Value>
<Value name="3">
<Value>Couleur</Value>
</Value>
</Data>
<DefaultData>commandeVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
