/// 
Class Demo.Processes.InjectionProcess Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='DocId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='450' >
<call name='Call Pdf Operation' target='PDF Operation' async='0' xpos='200' ypos='250' >
<request type='Demo.Operations.PDF.PDFRequest' />
<response type='Demo.Operations.PDF.PDFResponse' >
<assign property="context.DocId" value="callresponse.Pdf" action="set" languageOverride="" />
</response>
</call>
<call name='Call Embedding Operation' target='Embedding Operation' async='0' xpos='200' ypos='350' >
<request type='Demo.Operations.Embedding.EmbeddingRequest' >
<assign property="callrequest.Pdf" value="context.DocId" action="set" languageOverride="" />
</request>
<response type='Demo.Operations.Embedding.EmbeddingResponse' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
