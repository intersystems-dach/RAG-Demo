Class Demo.Operations.PDF.PDFResponse Extends (%Persistent, Ens.Response)
{

Property Pdf As %Integer;

Property PdfText As %String(MAXLEN = "");

Storage Default
{
<Data name="PDFResponseDefaultData">
<Subscript>"PDFResponse"</Subscript>
<Value name="1">
<Value>Pdf</Value>
</Value>
<Value name="2">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="3">
<Value>PdfText</Value>
</Value>
</Data>
<DataLocation>^Demo.Operation98A3.PDFResponseD</DataLocation>
<DefaultData>PDFResponseDefaultData</DefaultData>
<IdLocation>^Demo.Operation98A3.PDFResponseD</IdLocation>
<IndexLocation>^Demo.Operation98A3.PDFResponseI</IndexLocation>
<StreamLocation>^Demo.Operation98A3.PDFResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
