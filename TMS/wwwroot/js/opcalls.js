

const retrieveTicketList = async () =>
{
    const url =  "/Operator/api/api/getactiveticketlist";
    const retTask = await fetch(url);
    
    let result = await retTask.json();
    return result;
}



const populateTicketList = async () =>
{
    const selectElement = document.getElementById("active-ticket-list");
    let result = await retrieveTicketList();
    
    result.data.forEach(ticket => {
        let opt = document.createElement("option");
        opt.value = ticket.id;
        opt.innerText = `ID: ${ticket.id} | ${ticket.ticketTitle}`;
        selectElement.appendChild(opt);
    });
}

const resetEditor = () =>
{
    const selectElement = document.getElementById("active-ticket-list");
    selectElement.children[0].selected = true;
    tinymce.get("editor").setContent("");
}

const prepareEditorWithTemplate = async () =>
{
    console.log("Pressed");

    let template = `<div class="mceNonEditable" style="width: 930px; height: 1315px; border: 1px solid black;">
    <div style="margin: 50px 50px 50px 50px">
    <table style="border: 1px solid black; width: 100%;">
    <tbody>
    <tr>
    <td style="height: 40px;" width="301"><span style="font-size: 16px;"><span style="background-color: palegoldenrod;" id="spanPrName">[ProjectName]</span></span></td>
    <td style="height: 40px; text-align: right;" width="301"><span style="font-size: 16px;"><span style="background-color: palegoldenrod;" id="spanDocId">[DocumentID]</span></span></td>
    </tr>
    </tbody>
    </table>
    <p>&nbsp;</p>
    <p style="text-align: center;"><span style="color: #236fa1; font-size: 36pt;">Ticket resolution report</span></p>
    <p style="margin-left: 40px; margin-right: 40px;"><span style="font-size: 8pt;">(Use this report after successful troubleshooting of an assigned customer support ticket. Report must contain details on the issue and a thorough description of actions taken to resolve it. Use multiple pages if necessary. Submit your report for review as soon as possible)</span></p>
    <table style="height: 950px; border: 1px solid black" width="100%">
    <tbody>
    <tr>

    <td colspan="3" width="301" style="background-color: lightsteelblue; height: 60px;">
        <div style="padding-left: 20px;">
            <div style="font-size: 16px;">Operator ID:</div>
            <div style="font-size: 12px;">[Operator internal ID &ndash; inserted automatically]</div>
        </div>
    </td>
    <td width="301" style="background-color: lightsteelblue; height: 60px;">
        <p style="padding-left: 20px;">Date</p>
    </td>
    </tr>
    <tr>
    <td colspan="3" width="301" style="border: 1px solid black; height: 60px;">
    <p style="padding-left: 20px;"><span style="background-color: palegoldenrod;" id="spanOpId">[OperatorID]</span></p>
    </td>
    <td width="301" style="border: 1px solid black; height: 60px;">
        <p style="padding-left: 20px;"><span style="background-color: palegoldenrod;" id="spanCurDate">[CurrentDate]</span></p>
    </td>
    </tr>
    <tr>
    <td colspan="4" width="100%">
        <span>&nbsp;</span>
    </td>
    </tr>
    <tr>
    <td width="86" style="border: 1px solid black; background-color: lightsteelblue; height: 40px;">
        <div style="padding-left: 20px; font-size: 16px;">Ticket ID</div>
    </td>
    <td width="86" style="border: 1px solid black; height: 40px;">
        <div style="padding-left: 20px; font-size: 16px;"><span style="background-color: palegoldenrod;" id="spanTiId">[TicketID]</span></div>
    </td>
    <td colspan="2">
     <span>&nbsp;</span>
    </td>
    </tr>
    <tr>
    <td colspan="4" width="601" style="border: 1px solid black; background-color: lightsteelblue; height: 60px;">
        <div style="padding-left: 20px; font-size: 16px;">Issue detail: &nbsp; &nbsp;<span style="background-color: rgb(219, 219, 219);" id="spanTiTitle">[TicketTitle]</span></div>
    </td>
    </tr>
    <tr>
    <td colspan="4" width="601" style="padding-left: 20px; font-size: 16px;">    
    <p><span style="background-color: rgb(219, 219, 219);" id="spanTiBody">[TicketBody]</span></p>
    </td>
    </tr>
    <tr>
    <td colspan="4" width="601" style="border: 1px solid black; background-color: lightsteelblue; height: 60px;">
        <div style="padding-left: 20px; font-size: 16px;">Disposition of problem &nbsp; &nbsp;<span class="mceEditable" style="background-color: rgb(199, 238, 181);" id="spanReTitle">Enter your report title</span></div>
    </td>
    </tr>
    <tr>
    <td class="mceEditable" colspan="4" width="601" style="border: 1px solid black; padding-left: 20px; font-size: 16px;">
        <div style="font-size: 16px;"><span style="background-color: rgb(199, 238, 181);" id="spanReBody">Enter your report here</span></div>
    </td>
    </tr>
    
    <tr>
    <td colspan="3" width="301" style="padding-left: 20px; font-size: 16px; border: 1px solid black; background-color: lightsteelblue; height: 60px;">
        <div style="font-size: 16px;"> Controller</div>
    </td>
    <td width="301" style="border: 1px solid black; padding-left: 20px; font-size: 16px; height: 60px;">
        <div style="font-size: 16px;"> Tobias Markholm</div>
    </td>
    </tr>
    <tr>
    <td colspan="4" width="601">
        <p style="margin-left: 10px; margin-right: 20px;"><span style="font-size: 8pt;">
            This document will be reviewed by an appointed Coordinator. This document may be subjected for review by another party within or outside the Organization. All documents
            submitted for a review must comply with current policies regarding personal data and privacy guidelines. It is the responsibility of the author to adhere to Organizations guidelineswhen forming 
            this document. Any questions or uncertainties may be resolved by adressing the appointed Controller.    
        </span></p>
    </td>
    </tr>
    
    
    </tbody>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    </div>
</div>
`;

    const selectElement = document.getElementById("active-ticket-list");
    
    const str = (new Date()).toISOString().split('T')[0];

    if(selectElement.value ==0)
    {
        tinymce.get("editor").setContent("");
        return;
    } 
    
    let result = await retrieveTicketList();
    
    template = template.replace("[ProjectName]", "Final project");
    template = template.replace("[OperatorID]", result.operatorId);
    setInputValue("inputOperatorId", result.operatorId);

    template = template.replace("[CurrentDate]", str);
    setInputValue("inputCreated", str);

    template = template.replace("[TicketID]", selectElement.value);
    setInputValue("inputTicketId", selectElement.value);

    result.data.forEach(r => {
        if(r.id == selectElement.value)
        {
            template = template.replace("[TicketTitle]", r.ticketTitle);            
            template = template.replace("[TicketBody]", r.ticketBody);
        }
    });

    tinymce.get("editor").setContent(template);

}


const saveReport = () =>
{
    const formNew = document.getElementById("reportForm");
    const spreader = document.createElement("div");
    
    let content =  tinymce.get("editor").getContent();

    spreader.innerHTML = content;
    spreader.style="display: none";    
    formNew.appendChild(spreader);

    const reportTitle = document.getElementById("spanReTitle");
    const reportBody = document.getElementById("spanReBody");
    
    setInputValue("inputTitle", reportTitle.innerHTML);
    setInputValue("inputBody", reportBody.innerHTML);

    formNew.removeChild(spreader);
    resetEditor();
    formNew.submit();
}

const setInputValue = (id, value) =>
{
    const element = document.getElementById(id);
    element.value = value;
}






const showReport = async id =>
{

    const url =  `/Operator/api/api/getreport/${id}`;
    const retTask = await fetch(url);
    
    const reportObject = await retTask.json();     

    const canvas = document.getElementById("operatorReportPlaceHolder");

    let template = `<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">

      <div class="modal-content">

        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Report ID : ${reportObject.report.id}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

                <div class="mceNonEditable" style="width: 930px; height: 1315px; border: 1px solid black;">
                    <div style="margin: 50px 50px 50px 50px">
                    <table style="border: 1px solid black; width: 100%;">
                    <tbody>
                    <tr>
                    <td style="height: 40px;" width="301" class="px-2"><span style="font-size: 16px;"> Final Project </span></td>
                    <td style="height: 40px; text-align: right;" width="301"  class="px-2"><span style="font-size: 16px;"> Report ID: ${reportObject.report.id} </span></td>
                    </tr>
                    </tbody>
                    </table>
                    <p>&nbsp;</p>
                    <p style="text-align: center;"><span style="color: #236fa1; font-size: 36pt;">Ticket resolution report</span></p>
                    <p style="margin-left: 40px; margin-right: 40px;"><span style="font-size: 8pt;">(Use this report after successful troubleshooting of an assigned customer support ticket. Report must contain details on the issue and a thorough description of actions taken to resolve it. Use multiple pages if necessary. Submit your report for review as soon as possible)</span></p>
                    <table style="height: 950px; border: 1px solid black" width="100%">
                    <tbody>
                    <tr>

                    <td colspan="3" width="301" style="background-color: lightsteelblue; height: 60px;">
                        <div style="padding-left: 20px;">
                            <div style="font-size: 16px;">Operator ID:</div>
                            <div style="font-size: 12px;">[Operator internal ID &ndash; inserted automatically]</div>
                        </div>
                    </td>
                    <td width="301" style="background-color: lightsteelblue; height: 60px;">
                        <p style="padding-left: 20px;">Date</p>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="3" width="301" style="border: 1px solid black; height: 60px;">
                    <p style="padding-left: 20px;"> ${reportObject.report.operatorId} </p>
                    </td>
                    <td width="301" style="border: 1px solid black; height: 60px;">
                        <p style="padding-left: 20px;"> ${reportObject.report.created} </p>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="4" width="100%">
                        <span>&nbsp;</span>
                    </td>
                    </tr>
                    <tr>
                    <td width="86" style="border: 1px solid black; background-color: lightsteelblue; height: 40px;">
                        <div style="padding-left: 20px; font-size: 16px;">Ticket ID</div>
                    </td>
                    <td width="86" style="border: 1px solid black; height: 40px;">
                        <div style="padding-left: 20px; font-size: 16px;">${reportObject.report.ticketId}</div>
                    </td>
                    <td colspan="2">
                    <span>&nbsp;</span>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="4" width="601" style="border: 1px solid black; background-color: lightsteelblue; height: 60px;">
                        <div style="padding-left: 20px; font-size: 16px;">Issue detail: &nbsp; &nbsp; ${reportObject.ticket.ticketTitle} </div>
                    </td>
                    </tr>
                    <tr>
                    <td class="mceEditable" colspan="4" width="601" style="padding-left: 20px; font-size: 16px;">    
                    <p> ${reportObject.ticket.ticketBody} </p>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="4" width="601" style="border: 1px solid black; background-color: lightsteelblue; height: 60px;">
                        <div style="padding-left: 20px; font-size: 16px;">Disposition of problem &nbsp; &nbsp; ${reportObject.report.title} </div>
                    </td>
                    </tr>
                    <tr>
                    <td class="mceEditable" colspan="4" width="601" style="border: 1px solid black; padding-left: 20px; font-size: 16px;">
                        <div style="font-size: 16px;"> ${reportObject.report.body} </div>
                    </td>
                    </tr>
                    
                    <tr>
                    <td colspan="3" width="301" style="padding-left: 20px; font-size: 16px; border: 1px solid black; background-color: lightsteelblue; height: 60px;">
                        <div style="font-size: 16px;"> Controller</div>
                    </td>
                    <td width="301" style="border: 1px solid black; padding-left: 20px; font-size: 16px; height: 60px;">
                        <div style="font-size: 16px;"> Tobias Markholm</div>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="4" width="601">
                        <p style="margin-left: 10px; margin-right: 20px;"><span style="font-size: 8pt;">
                            This document will be reviewed by an appointed Coordinator. This document may be subjected for review by another party within or outside the Organization. All documents
                            submitted for a review must comply with current policies regarding personal data and privacy guidelines. It is the responsibility of the author to adhere to Organizations guidelineswhen forming 
                            this document. Any questions or uncertainties may be resolved by adressing the appointed Controller.    
                        </span></p>
                    </td>
                    </tr>
                    
                    
                    </tbody>
                    </table>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    </div>
                </div>


        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>            
        </div>
     </div>

    </div>
</div>`;

    
    
    canvas.innerHTML= template;

    var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
        keyboard: false
      })
      console.log(myModal);
   myModal.show();
}