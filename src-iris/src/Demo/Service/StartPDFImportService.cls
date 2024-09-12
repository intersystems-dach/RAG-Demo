Class Demo.Service.StartPDFImportService Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
        set tRequest = ##class(Ens.Request).%New()
        set tResponse = ##class(Ens.Response).%New()
        set tSC = ..SendRequestSync("Injection Process", tRequest, .tResponse)
        do ##class(Ens.Director).EnableConfigItem("StartPDFImportService", 0, 1)

        return $$$OK
}

}
