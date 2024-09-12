Class Demo.Operations.PDF.PDFOperation Extends Ens.BusinessOperation
{

Property Bucket As %String(MAXLEN = 50);

Property Key As %String(MAXLEN = 1024);

Parameter SETTINGS = "Bucket:S3,Key:S3";

Method OnGetPDFFromS3(pRequest As Demo.Operations.PDF.PDFRequest, Output pResponse As Demo.Operations.PDF.PDFResponse) As %Status
{

    set tSc = $$$OK

    try {
        set tPdf = ..GetPDFFromS3()

        set pResponse = ##class(Demo.Operations.PDF.PDFResponse).%New()

        set tPdfRecord = ##class(Demo.PDFRecord).%New()

        set tPdfRecord.Text = tPdf

        $$$ThrowOnError(tPdfRecord.%Save()) 


        set tPdfId = tPdfRecord.%Id()

        set pResponse.Pdf = tPdfId

        set pResponse.PdfText = tPdf
        
    } catch tEx {
        set tSc = tEx.AsStatus()
    }

    return tSc
}

Method GetPDFFromS3() As %SYS.Python [ Language = python ]
{
    from io import BytesIO
    from PyPDF2 import PdfReader
    import boto3
    from botocore import UNSIGNED
    from botocore.client import Config
    from botocore.exceptions import ClientError

    if(self.Bucket != "" and self.Key != ""):

        # Initialize a session using Amazon S3 with unsigned configuration
        s3 = boto3.client('s3', config=Config(signature_version=UNSIGNED))

        response = s3.get_object(Bucket=self.Bucket,Key=self.Key)

        reader = PdfReader(BytesIO(response['Body'].read()))

        text = ""

        for page in reader.pages:
            text += page.extract_text()

        return text
    else:
        return ""
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.Operations.PDF.PDFRequest">
    <Method>OnGetPDFFromS3</Method>
  </MapItem>
</MapItems>
}

}
