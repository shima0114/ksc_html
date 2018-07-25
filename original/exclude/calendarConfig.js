var funcSelect = function(start, end, allDay) {
    //debugger;
    alert("start :: " + start + ", end :: " + end + ", allDay :: " + allDay);
}

var funcEvent = function(calEvent, jsEvent, view) {
    //debugger;
    alert("calEvent :: " + calEvent + ", jsEvent :: " + jsEvent + ", view :: " + view);
}

function showCalendar() {
    $("#calendar").fullCalendar({editable: true,selectable: true, select : funcSelect, eventClick : funcEvent, events: [
            {
                title: 'イベント',
                start: '2018-05-14 09:00:00',
                end: '2018-05-14 10:00:00',
                editable : true,
                detail : ""
            },
            {
                title: 'イベント',
                start: '2018-05-14 10:00:00',
                end: '2018-05-14 11:00:00'
            },
            {
                title: 'イベント',
                start: '2018-05-14 11:00:00',
                end: '2018-05-14 12:00:00'
            },
            {
                title: 'イベント',
                start: '2018-05-14 12:00:00',
                end: '2018-05-14 13:00:00'
            }
        ]});
}