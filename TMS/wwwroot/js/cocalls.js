//global ticket queue variable that is set via retrieveQueue
var globalQueue;
//

window.addEventListener('load', (event) => {
    console.log('page is fully loaded');
    retrieveQueue();

    const landingPad = document.getElementById("landingPad");
    if(landingPad != null)
    {
        landingPad.addEventListener('dragenter', dragEnter)
        landingPad.addEventListener('dragover', dragOver);
        landingPad.addEventListener('dragleave', dragLeave);
        landingPad.addEventListener('drop', drop);
    }
  });

  
const pickImg = id =>
{
    const imgmap =
    {
        [1] : '/lib/low.png',
        [2] : '/lib/medium.png',
        [3] : '/lib/high.png',
        [4] : '/lib/extreme.png'
    };
    return (imgmap[id]);
}

const retrieveQueue = async () =>
{
    const url =  "/Coordinator/api/api/getqueueasjson";
   
    const retTask = await fetch(url);
    let data = await retTask.json();

    //set global var
    globalQueue = data.queue;

    const queueHeader = document.getElementById("queueTitleCount");
    if (data.queue.length > 0)
    {
        queueHeader.style.color = "black";
        queueHeader.innerHTML = "To assign: " + data.queue.length;
    }
    else
    {
        queueHeader.style.color = "darkgray";
        queueHeader.innerHTML = "To assign: 0";    
    }

    //clear UL
    const queueList = document.getElementById("queueTicketList");    
    let children = Array.from(queueList.children);
    children.forEach(c => queueList.removeChild(c));

    //fill with new li's
    data.queue.forEach(q => {

        let li = document.createElement("li");
        li.className = "list-group-item";
        li.draggable = "true";
        li.addEventListener('dragstart', ticketDragStart);
        li.addEventListener('dragend', ticketDragEnd)
        li.id = q.id;

        let template = `<div>
                    <img src="${pickImg(q.urgency)}" style="height: 16px;" /> Ticket - ${q.id}
                    <a role="button" onclick="removeFromQueue(${q.id})" class="float-end">
                    <i class="fas fa-times" style="color: red"></i>
                    </a>
                    </div>`;

        li.innerHTML = template;
        queueList.appendChild(li);
    });   
} 

const removeFromQueue = async id =>
{
    const url =  `/Coordinator/api/api/deletequeueitem/${id}`;
    const retTask = await fetch(url, { method: "DELETE"} );
    retrieveQueue();
}

const addToQueue = async id =>
{
    const url =  `/Coordinator/api/api/addtoqueue/${id}`;
    
    const retTask = await fetch(url,
        {
            method: 'POST',
            headers: { 'Content-type': 'application/json' },
            body: "OK"
        });

    retrieveQueue();
}

function ticketDragStart(event)
{
    console.log("Drag started");
    event.dataTransfer.setData('text/plain', event.target.id);
    event.currentTarget.style.opacity = '0.4';    
}
function ticketDragEnd(event)
{
    console.log("Drag stopped");
    event.currentTarget.style.opacity = '1';
}


function dragEnter(event)
{
    console.log("Dragenter is fired");
    event.preventDefault();
    event.target.classList.add("bg-danger");
}
function dragOver(event)
{
    console.log("DragOver is fired");
    event.preventDefault();
    event.target.classList.add("bg-danger");
}
function dragLeave(event)
{
    console.log("DragLeave is fired");
    event.target.classList.remove("bg-danger");
}
function drop(event)
{
    console.log("Drop is fired");
    event.preventDefault();
    event.target.classList.remove("bg-danger");

    //id of dragged item
    const id = event.dataTransfer.getData('text/plain');
    let title ="";
    globalQueue.forEach(item => {
        if(item.id == id)         
            title = item.ticketTitle;        
    });

    const myCollapse = document.getElementById('lp-collapse-form');
    const bsCollapse = new bootstrap.Collapse(myCollapse, {toggle: false});
    const spanId = document.getElementById("ticket-id");
    const inputId = document.getElementById("input-ticket-id");
    const spanTitle = document.getElementById("ticket-title");

    spanId.textContent=id;
    inputId.value = id;
    spanTitle.textContent = title;
    bsCollapse.show();
}

function cancelLandingPad()
{
    const myCollapse = document.getElementById('lp-collapse-form');
    const bsCollapse = new bootstrap.Collapse(myCollapse, {toggle: false});
    const spanId = document.getElementById("ticket-id");
    const inputId = document.getElementById("input-ticket-id");
    const spanTitle = document.getElementById("ticket-title");

    spanId.textContent="";
    inputId.value = "";
    spanTitle.textContent = "";
    bsCollapse.hide();
}

async function validateLandingPad()
{


    const url = "/Coordinator/api/api/canaddscheduleitem";
   
    operatorId = document.getElementById("lpOperatorId").value;
    selectedDate =  document.getElementById("lpSelectedDate").value;
    startTime = document.getElementById("lpStartTime").value;
    endTime = document.getElementById("lpEndTime").value;

    form = document.getElementById("lpForm");
    
    errMsg = 
    {
        badstarttime: "Bad Start Time value",
        badendtime: "Bad End Time value", 
        badtime: "Wrong time span",
        toomuch: "Requested interval is too long",
        overlap: "Time interval overlaps with existing",
        badop: "Bad Operator ID"      
    }

    const retTask = await fetch(`${url}?operatorId=${operatorId}&selectedDate=${selectedDate}&startTime=${startTime}&endTime=${endTime}`,{ method: "GET"});        
    const result = await retTask.json();
    
    console.log(result);
    
    if(result.result == "NOK")
    {        
        var b = errMsg[result.error];
        alert (b);
    }
    else    
        form.submit();
}


const showReport = async (id, noMarkButton) =>
{
    
    const url =  `/Coordinator/api/api/getreport/${id}`;
    
    const retTask = await fetch(url);
    
    const reportObject = await retTask.json();
    
    const canvas = document.getElementById("operatorReportPlaceHolder");


    let markCompletedButton = noMarkButton === 'True' ? "" : `<button type="button" class="btn btn-primary"  onclick="markCompleted(${reportObject.ticket.id})" data-bs-dismiss="modal">Mark as Completed</button>`;

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
            ${markCompletedButton}
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


const markCompleted = async (id) =>
{
    const url =  `/Coordinator/api/api/markcompleted/${id}`;
    const retTask = await fetch(url, { method: 'PATCH' } );    
    
    window.location.reload();
}

const closeTicket_openConfirmation = id =>
{

    const confirmationDialog = document.getElementById('closeConfirm');
    const confirmationDialogTitle = document.getElementById('closeConfirmTicketId');
    const closeConfirmInput = document.getElementById('closeConfirmInputId');

    confirmationDialogTitle.innerText = id;
    closeConfirmInput.value = id;
   
    var myModal = new bootstrap.Modal(confirmationDialog, {
        keyboard: false
      })
      console.log(myModal);
    
    myModal.show();
}


async function BuildChart()
{
    const url = `/Coordinator/api/api/getchartdata`;

    const retTask = await fetch(url);

    const retObj = await retTask.json();
    
    let labelX = [];
    let dataY = [];

    for (const [key, value] of Object.entries(retObj))
    {                
        labelX.push(key);
        dataY.push(value);
    }

    console.log(labelX);
    console.log(dataY);

    let ctx = document.getElementById('myChart');
    let myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labelX,
            datasets: [{
                label: '# of Tickets',
                data: dataY,
                fill: false,
                borderColor: 'rgb(75, 192, 192)',

            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

}

const setFillProgress = percent =>
{
    const progressBar = document.getElementById("fillProgress");
    progressBar.style.width = `${percent}%`;
    progressBar.setAttribute("aria-valuenow", percent);
    progressBar.innerText = `${percent}%`;
}


