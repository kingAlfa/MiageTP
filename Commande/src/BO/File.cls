Class BO.File Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method voitureFilePush(pRequest As msg.voitureFilePushDmde, pResponse As msg.voitureFilePushRpse) As %Status
{
    set stream = ##class(%Library.FileBinaryStream).%New()
    set str = stream.Write(pRequest.voiture.marque_pRequest.voiture.modele_pRequest.voiture.categorie_pRequest.voiture.plaque_pRequest.voiture.couleur_pRequest.voiture.nbPlaces)
    set stat = ..Adapter.PutStream("pushVoiture.txt",stream)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.voitureFilePushDmde">
        <Method>voitureFilePush</Method>
    </MapItem>
    
</MapItems>
}

}
