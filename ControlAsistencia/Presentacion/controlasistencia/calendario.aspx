﻿<%@ Page Title="Calendario" Language="C#" MasterPageFile="~/controlasistencia/Plantilla.Master" AutoEventWireup="true" CodeBehind="calendario.aspx.cs" Inherits="Presentacion.calendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">

    <div class="row">
                    <div class="col-lg-12">
                        <div class="page-title">
                            <h1>Calendario <small>Académico</small> </h1>
                            <ol class="breadcrumb">
                                <li><i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                                </li>
                                <li class="active">Blank Page</li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
    <div class="row">
                        <div class="col-lg-3">
                            <div class="portlet portlet-default">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h4>Draggable Events</h4>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="portlet-body">
                                    <!-- the events -->
                                    <div id='external-events'>
                                        <div class='external-event bg-green'>Lunch</div>
                                        <div class='external-event bg-red'>Go home</div>
                                        <div class='external-event bg-aqua'>Do homework</div>
                                        <div class='external-event bg-yellow'>Work on UI design</div>
                                        <div class='external-event bg-navy'>Sleep tight</div>
                                        <p>
                                            <input type='checkbox' id='drop-remove' /> <label for='drop-remove'>remove after drop</label>
                                        </p>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                            <div class="portlet portlet-default">
                                <div class="portlet-heading">
                                    <div class="portlet-title">
                                        <h3>Create Event</h3>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="portlet-body">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                                        <button type="button" id="color-chooser-btn" class="btn btn-danger btn-block btn-sm dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>
                                        <ul class="dropdown-menu" id="color-chooser">
                                            <li><a class="text-green" href="#"><i class="fa fa-square"></i> Green</a></li>
                                            <li><a class="text-blue" href="#"><i class="fa fa-square"></i> Blue</a></li>
                                            <li><a class="text-navy" href="#"><i class="fa fa-square"></i> Navy</a></li>
                                            <li><a class="text-yellow" href="#"><i class="fa fa-square"></i> Yellow</a></li>
                                            <li><a class="text-orange" href="#"><i class="fa fa-square"></i> Orange</a></li>
                                            <li><a class="text-aqua" href="#"><i class="fa fa-square"></i> Aqua</a></li>
                                            <li><a class="text-red" href="#"><i class="fa fa-square"></i> Red</a></li>
                                            <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i> Fuchsia</a></li>
                                            <li><a class="text-purple" href="#"><i class="fa fa-square"></i> Purple</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                    <div class="input-group">
                                        <input id="new-event" type="text" class="form-control" placeholder="Event Title">
                                        <div class="input-group-btn">
                                            <button id="add-new-event" type="button" class="btn btn-default btn-flat">Add</button>
                                        </div><!-- /btn-group -->
                                    </div><!-- /input-group -->
                                </div>
                            </div>
                        </div><!-- /.col -->
                        <div class="col-md-9">
                            <div class="portlet portlet-default">
                                <div class="box-body no-padding">
                                    <!-- THE CALENDAR -->
                                    <div class="clearfix"></div>
                                    <div class="portlet-body">
                                        <div id="calendar"></div>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                        </div><!-- /.col -->
                    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <!-- Page specific script -->
    <script type="text/javascript">
        $(function () {

            /* initialize the external events
             -----------------------------------------------------------------*/
            function ini_events(ele) {
                ele.each(function () {

                    // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                    // it doesn't need to have a start or end
                    var eventObject = {
                        title: $.trim($(this).text()) // use the element's text as the event title
                    };

                    // store the Event Object in the DOM element so we can get to it later
                    $(this).data('eventObject', eventObject);

                    // make the event draggable using jQuery UI
                    $(this).draggable({
                        zIndex: 1070,
                        revert: true, // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });

                });
            }
            ini_events($('#external-events div.external-event'));

            /* initialize the calendar
             -----------------------------------------------------------------*/
            //Date for the calendar events (dummy data)
            var date = new Date();
            var d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear();
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                buttonText: {//This is to add icons to the visible buttons
                    prev: "<span class='fa fa-caret-left'></span>",
                    next: "<span class='fa fa-caret-right'></span>",
                    today: 'today',
                    month: 'month',
                    week: 'week',
                    day: 'day'
                },
                //Random default events
                events: [
                    {
                        id: "event1",
                        title: 'All Day Event',
                        start: new Date(y, m, 1),
                        backgroundColor: "#f56954", //red
                        borderColor: "#f56954" //red
                    },
                    {
                        id: "event2",
                        title: 'Long Event',
                        start: new Date(y, m, d - 5),
                        end: new Date(y, m, d - 2),
                        backgroundColor: "#f39c12", //yellow
                        borderColor: "#f39c12" //yellow
                    },
                    {
                        id: "event3",
                        title: 'Meeting',
                        start: new Date(y, m, d, 10, 30),
                        allDay: false,
                        backgroundColor: "#0073b7", //Blue
                        borderColor: "#0073b7" //Blue
                    },
                    {
                        id: "event4",
                        title: 'Lunch',
                        start: new Date(y, m, d, 12, 0),
                        end: new Date(y, m, d, 14, 0),
                        allDay: false,
                        backgroundColor: "#00c0ef", //Info (aqua)
                        borderColor: "#00c0ef" //Info (aqua)
                    },
                    {
                        id: "event5",
                        title: 'Birthday Party',
                        start: new Date(y, m, d + 1, 19, 0),
                        end: new Date(y, m, d + 1, 22, 30),
                        allDay: false,
                        backgroundColor: "#00a65a", //Success (green)
                        borderColor: "#00a65a" //Success (green)
                    },
                    {
                        id: "event6",
                        title: 'Click for Google',
                        start: new Date(y, m, 28),
                        end: new Date(y, m, 29),
                        url: 'http://google.com/',
                        backgroundColor: "#3c8dbc", //Primary (light-blue)
                        borderColor: "#3c8dbc" //Primary (light-blue)
                    }
                ],
                editable: true,
                selectable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                select: function (start, end, allDay) {
                    return bootbox.prompt("Titulo del evento", function (title) {
                        if (title != null) {
                            $('#calendar').fullCalendar("renderEvent", {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay
                            }, true);
                            return $('#calendar').fullCalendar('unselect');
                        }
                    });
                },
                eventClick: function (calEvent, jsEvent, view) {
                    return bootbox.dialog({
                        message: $("<form class='form'><label>Cambiar nombre del evento</label></form><input id='new-event-title' class='form-control' type='text' value='" + calEvent.title + "' /> "),
                        buttons: {
                            "delete": {
                                label: "<i class='icon-trash'></i> Eliminar evento",
                                className: "pull-left",
                                callback: function () {
                                    return $('#calendar').fullCalendar("removeEvents", function (ev) {
                                        return ev._id === calEvent._id;
                                    });
                                }
                            },
                            success: {
                                label: "<i class='icon-save'></i> Guardar",
                                className: "btn-success",
                                callback: function () {
                                    calEvent.title = $("#new-event-title").val();
                                    return $('#calendar').fullCalendar('updateEvent', calEvent);
                                }
                            }
                        }
                    });
                },
                drop: function (date, allDay) { // this function is called when something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');

                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;
                    copiedEventObject.backgroundColor = $(this).css("background-color");
                    copiedEventObject.borderColor = $(this).css("border-color");

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }

                }
            });

            /* ADDING EVENTS */
            var currColor = "#f56954"; //Red by default
            //Color chooser button
            var colorChooser = $("#color-chooser-btn");
            $("#color-chooser > li > a").click(function (e) {
                e.preventDefault();
                //Save color
                currColor = $(this).css("color");
                //Add color effect to button
                colorChooser
                        .css({ "background-color": currColor, "border-color": currColor })
                        .html($(this).text() + ' <span class="caret"></span>');
            });
            $("#add-new-event").click(function (e) {
                e.preventDefault();
                //Get value and make sure it is not null
                var val = $("#new-event").val();
                if (val.length == 0) {
                    return;
                }

                //Create event
                var event = $("<div />");
                event.css({ "background-color": currColor, "border-color": currColor, "color": "#fff" }).addClass("external-event");
                event.html(val);
                $('#external-events').prepend(event);

                //Add draggable funtionality
                ini_events(event);

                //Remove event from text input
                $("#new-event").val("");
            });
        });
    </script>
</asp:Content>
