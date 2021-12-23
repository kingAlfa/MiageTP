/// Description
Class BS.APIReservation Extends EnsLib.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- Server Info -->
<Route Url="/" Method="GET" Call="GetInfo" Cors="true"/>
<!-- Swagger specs -->
<Route Url="/_spec" Method="GET" Call="SwaggerSpec" />
<!-- Créer une voiture-->
<Route Url="/reservervoiture/" Method="POST" Call="ReserverVoiture"/>
</Routes>
}

ClassMethod GetInfo() As %Status
{
  SET version = ..#Version
  SET info = {
    "version": (version)
  }
  RETURN ..%ProcessResult($$$OK, info)
}

ClassMethod SwaggerSpec() As %Status
{
  Set tSC = ##class(%REST.API).GetWebRESTApplication($NAMESPACE, %request.Application, .swagger)
  Do swagger.info.%Remove("x-ISC_Namespace")
  Set swagger.basePath = "/crud"
  Set swagger.info.title = "InterSystems IRIS REST CRUD demo"
  Set swagger.info.version = "0.1"
  Set swagger.host = "localhost:52773"
  Return ..%ProcessResult($$$OK, swagger)
}

ClassMethod ReserverVoiture() As %Status
{
    #dim tSC As %Status = $$$OK
    Set msg = ##class(msg.creerVoitureDmde).%New()

    Set data=%request.Content
    $$$TOE(tSC,msg.%JSONImport(data))

    set tSC = ##class(Ens.Director).CreateBusinessService("ServiceVoiture",.tService) if $$$ISERR(tSC) quit 
    set tSC = tService.ProcessInput(msg,.response,"creerVoiture")
    Set %response.Status = 200
    Set %response.ContentType = ..#CONTENTTYPEJSON
    Do response.%JSONExport()
    Quit tSC
}

}
