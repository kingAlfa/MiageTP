Class BO.Transform Extends Ens.BusinessOperation
{

/// Description
Method transformation(source As msg.creerVoitureCommandeDmde, ByRef target As msg.creerVoitureDmde) As %Status
{
        set source = ##class(msg.creerVoitureCommandeDmde).%New()
        set writer = ##class(%XML.Writer).%New()
        set writer.Indent=1 do writer.RootObject(source)
        write !!
        Set sc = ##class(Ens.DataTransform).Transform(source, .target)
        if $$$ISERR(sc)
            {do $System.Status.DisplayError(sc)} 
        set writer = ##class(%XML.Writer).%New() 
        set writer.Indent = 1
        do writer.RootObject(source)
        // do something
        Return sc
}

}
