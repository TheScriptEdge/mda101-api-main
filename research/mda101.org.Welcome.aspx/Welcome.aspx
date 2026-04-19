<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="./css/main.css?20240720" rel="stylesheet" type="text/css"/>
        <link href="./css/ddsmoothmenu.css" rel="stylesheet" type="text/css"/>
        <script src="./js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="./js/ddsmoothmenu.js" type="text/javascript"></script>
        <script type="text/javascript">
            ddsmoothmenu.init({
                mainmenuid: "topMenu",
                //menu DIV id
                orientation: 'h',
                //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu',
                //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup"//"markup" or ["container_id", "path_to_menu_file"]
            });
        </script>
        <!-- bottomBar -->
        <link type="text/css" href="./css/fBar.css" rel="stylesheet"/>
        <script type="text/javascript" src="./js/fBar.js"></script>
        <script type="text/javascript" src="./js/jquery.hoverbox.js"></script>
        <!-- QTip -->
        <script type="text/javascript" src="./js/jquery.qtip.min.js"></script>
        <script src="./js/jquery-ui-1.11.0/jquery-ui.min.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="./js/jquery-ui-1.11.0/jquery-ui.theme.min.css"/>
        <link type="text/css" rel="stylesheet" href="./css/qtip.css"/>
        <script type="text/javascript">

            function alertOnclick() {
                hideUnreadQtip = 1;
                $('#alertpanel').qtip('hide').qtip('disable');
                $("#bb-alerts-ul").animate({
                    scrollTop: 0
                }, 1);
            }

            function showUnreadMessagesTooltip() {
                $('#alertpanel').qtip({
                    content: {
                        title: {
                            text: "&nbsp;",
                            button: 'X'
                        },
                        text: "ישנן הודעות 'קרא וחתום' שלא אישרת את קריאתן<BR/>על כל הודעה לחץ על הלינק של 'קראתי' בסוף ההודעה כדי לאשר את קריאתה"
                    },
                    position: {
                        my: 'bottom center',
                        // Use the corner...
                        at: 'top center'// ...and opposite corner
                    },
                    show: {
                        when: false,
                        // Don't specify a show event
                        ready: true // Show the tooltip when ready
                    },
                    hide: false,
                    // Don't specify a hide event
                    style: 'qtip-red qtip-rounded'

                }).click(alertOnclick);
                // qTip

                $('#alertpanel a').click(alertOnclick);
            }

            $(document).ready(function() {
                loadBar();
                handleBarUpdate();

                try {
                    // Before ajax
                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                    prm.add_beginRequest(onBeforeSubmit);

                    // Before posting/navigating from page
                    $(window).bind('beforeunload', function() {
                        onBeforeSubmit();
                    });
                } catch (err) {}

            });

            function hideQuickMsgLoading() {
                document.getElementById('quickMsgLoadDiv').style.display = 'none';
            }

            function showQuickMsgLoading() {
                document.getElementById('quickMsgLoadDiv').style.display = '';
            }

            function quickMessage(user) {
                showQuickMsgLoading();
                $("#iframeQuickMsg").attr('src', "MessagesComposeStripped.aspx?RN=" + user);
                $("#iframeQuickMsg").load(function() {
                    hideQuickMsgLoading();
                });
                $("#dvQuickMsg").show();
            }

            function quickMessageHide() {
                $("#iframeQuickMsg").attr('src', "");
                $("#dvQuickMsg").hide();
            }
        </script>
        <script language="javascript" type="text/javascript">
            nl_link = "https://mda101.org/site_accessibility.html";
            nl_dir = "./js/nl-files/";
            nl_pos = "tr";
        </script>
        <script language="javascript" type="text/javascript" src="./js/nagishli.js?v=2.3" charset="utf-8" defer></script>
        <!-- End bottomBar -->
        <title>מערכת מתנדבי מרחב ירושלים - ראשי
</title>
        <script language="javascript" type="text/javascript" src="./js/scroller.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/scroller.css"/>
        <style type="text/css">
            div#dvScroller ul li {
                background: white;
                color: blue;
                padding: 5px;
                font-size: small;
                font-weight: normal;
                margin-bottom: 5px;
                border-bottom: 3px dotted black;
            }

            div#dvUpdates, div#dvUserInfo, div#dvScroller, div#dvPoll, div#dvBirthdays, div#dvTotalFree, div#dvContact {
                width: 100%;
                margin-left: 3px;
                margin-bottom: 8px;
            }

            div#dvScroller {
                border: 0px;
                border-right: 1px dotted gray;
                border-left: 1px dotted gray;
            }

            div#dvScroller, div#dvUpdates {
                height: 250px;
            }

            div#dvUpdates, div#dvPoll, div#dvBirthdays {
                overflow: hidden;
            }

            div#dvScroller {
                direction: rtl;
                text-align: right;
            }

            div#dvOneLine {
                clear: both;
                float: right;
                height: 90px;
                width: 73%;
                overflow: auto;
                margin-left: 3px;
                padding: 4px;
            }

            .bottomLeftPane {
                margin: 0px;
                padding: 0px;
                float: left;
                border-left: 1px dotted gray;
                border-right: 1px dotted gray;
                height: 90px;
                overflow: auto;
                width: 25%;
                padding-right: 5px;
            }

            div#dvTzevaAdom {
                border: 3px solid #FF0000;
            }

            /* END Tzeva Adom */
            div#dvTotalFree {
                clear: both;
                height: 60px;
                margin: 0;
                padding: 0;
                padding-top: 20px;
            }

            .ulHistory, div#dvUpdates ul, #ulBirthdays, div#dvTotalFree ul, .ulTzevaAdom {
                list-style-type: none;
                padding: 2px;
                margin: 0px;
            }

            div#dvUpdates {
                border-right: 1px dotted gray;
            }

            div#dvLinks ul {
                list-style-type: none;
                padding-right: 40px;
            }

            div#dvTotalFree ul li, div#dvLinks ul li {
                padding-bottom: 5px;
            }

            div#dvUpdates ul {
                list-style-type: disc;
            }

            div#dvUpdates ul li {
                padding-top: 1px;
            }

            .ulHistory li, ulTzevaAdom li {
                padding: 1px;
                border-bottom: 1px dotted Gray;
            }

            #ulBirthdays li {
                float: right;
                padding-right: 6px;
                height: 14px;
            }

            #ulBirthdays li a img {
                vertical-align: bottom;
            }

            #ulBirthdays li:hover {
                color: Red;
            }

            .ulHistory li img {
                position: relative;
                vertical-align: middle;
            }

            .historyData {
                font-family: Arial, Helvetica, sans-serif;
                font-size: small;
            }

            div#dvBirthdays {
                clear: both;
                float: right;
                height: 42px;
            }

            div#dvBirthdays ul {
                padding: 0;
                margin: 3px 0 0 0;
                direction: rtl;
            }

            div#dvUserInfo ul {
                margin: 0;
                padding: 0;
            }

            div#dvUserInfo ul li, div#dvBirthdays ul li {
                float: right;
                position: relative;
                display: inline;
                padding: 0px 0px 0 10px;
            }

            div#dvBirthdays {
                border-top: 1px dotted gray;
                border-bottom: 1px dotted gray;
            }

            div#dvPoll {
                height: 125px;
            }

            div#dvUpdates ul li {
                font-size: small;
            }

            .col4 {
                width: 24%;
            }

            .oneLiner {
                font-size: medium;
            }

            #tblPollResults tr td {
                border-bottom: 1px dotted Gray;
                font-size: smaller;
            }

            div#dvContact a:link, div#dvContact a:visited {
                text-decoration: underline;
            }

            .newLI {
                background: rgb(252,236,252);
                /* Old browsers */
                background: -moz-radial-gradient(center, ellipse cover, rgba(252,236,252,1) 0%, rgba(255,124,216,1) 100%);
                /* FF3.6+ */
                background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(252,236,252,1)), color-stop(100%,rgba(255,124,216,1)));
                /* Chrome,Safari4+ */
                background: -webkit-radial-gradient(center, ellipse cover, rgba(252,236,252,1) 0%,rgba(255,124,216,1) 100%);
                /* Chrome10+,Safari5.1+ */
                background: -o-radial-gradient(center, ellipse cover, rgba(252,236,252,1) 0%,rgba(255,124,216,1) 100%);
                /* Opera 12+ */
                background: -ms-radial-gradient(center, ellipse cover, rgba(252,236,252,1) 0%,rgba(255,124,216,1) 100%);
                /* IE10+ */
                background: radial-gradient(center, ellipse cover, rgba(252,236,252,1) 0%,rgba(255,124,216,1) 100%);
                /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fcecfc', endColorstr='#ff7cd8',GradientType=1 );
                /* IE6-9 fallback on horizontal gradient */
            }

            .row {
                margin-left: -10px;
            }

            .row:before, .row:after {
                content: "";
                display: table;
            }

            .row:after {
                clear: both;
            }

            [class*="span"] {
                float: left;
                margin-left: 10px;
            }

            .browsers {
                margin: 30px auto;
                width: 90%;
            }

            .browser-block {
                margin-left: 50px;
                text-align: center;
            }

            .browser-block a {
                text-align: center;
            }

            .browser-block img {
                display: block;
                margin: 0 auto;
            }

            .warning {
                background-color: Red;
            }
        </style>
        <script language="javascript" type="text/javascript">
            function resizeElementHeight(element) {
                try {
                    var height = 0;
                    var bottomMargin = 70;
                    var body = window.document.body;
                    if (window.innerHeight) {
                        height = window.innerHeight;
                    } else if (body.parentElement.clientHeight) {
                        height = body.parentElement.clientHeight;
                    } else if (body && body.clientHeight) {
                        height = body.clientHeight;
                    }
                    element.style.height = ((height - element.offsetTop - bottomMargin) + "px");
                } catch (e) {}
            }

            function showLoading() {
                document.getElementById('loadDiv').style.display = '';
            }

            function hideLoading() {
                document.getElementById('loadDiv').style.display = 'none';
            }

            function showPollLoading() {
                var btnPoll = "#ctl00_ContentPlaceHolder1_btnPollAnswer";
                document.getElementById('loadPollDiv').style.display = '';

                $(btnPoll).hide();
            }

            function btnAddMessage_ClientClick() {
                var btnMsg = "#ctl00_ContentPlaceHolder1_btnAddMessage";
                showLoading();
                $(btnMsg).hide();
            }

            function imgPreload() {
                // counter
                var i = 0;

                // create object
                imageObj = [];

                // set image list
                images = new Array();
                images[0] = "./images/bbox.jpg"
                images[1] = "./images/greenbox.jpg"
                images[2] = "./images/hoverbox.jpg"
                images[3] = "./images/shibutzTypeSel.png"
                images[4] = "./images/shibutzType.png"
                images[5] = "./images/pop_arrow.gif"
                images[6] = "./images/cardio.gif"
                images[7] = "./images/homeMenuHover.png"
                images[8] = "./images/messagesMenuHover.png"

                // start preloading
                for (i = 0; i <= 8; i++) {
                    imageObj[i] = new Image();
                    imageObj[i].src = images[i];
                }
            }

            $(document).ready(function() {
                resizeElementHeight($("#dvOneLine").get(0));
                resizeElementHeight($("#dvOneLineData").get(0));
                resizeElementHeight($("#dvHistory").get(0));

                // Tzeva Adom:
                //resizeElementHeight($("#dvTzevaAdom").get(0));
                //getJson();
                //var t = setInterval(getJson, 3000);

                imgPreload();
            });

            //Tzeva Adom
            function getJson() {
                $.ajax({
                    url: "GetTzevaAdomJson.ashx?req=" + (+new Date),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    cache: false,
                    success: function(data) {
                        checkJson(data);
                    },
                    error: function(requestObject, error, errorThrown) {}
                });
            }

            var loading = true;
            var lastMessage = "";
            var warnTime = 0;
            var warningToggle = 0;
            var warning = false;

            function noWarn() {
                warning = false;
                $('#ulTzevaAdom').removeClass('warning');
            }

            function doWarn() {
                warningToggle = 0;
                if (!warning) {
                    toggleWarning();
                }
            }

            function toggleWarning() {
                warning = true;
                warningToggle++;
                $('#ulTzevaAdom').toggleClass('warning');
                if (warningToggle > 15) {
                    noWarn();
                } else {
                    setTimeout(toggleWarning, 500);
                }
            }

            function checkJson(data) {
                var messages = data;
                var coords;
                var str = "";
                var first = true;
                var warn = false;
                if (messages != null && $.trim(messages) != '') {
                    $("#ulTzevaAdom").empty();
                    $.each(messages, function(i, m) {
                        $("#ulTzevaAdom").append("<li>" + m + "</li>");
                        if (!!first) {
                            first = false;
                            if (lastMessage != m && !loading) {
                                warn = true;
                                warnTime = (+new Date);
                            }
                            lastMessage = m;
                        }
                    });
                    loading = false;
                }

                if (warn) {
                    doWarn();
                }
                //            else
                //            {
                //                if (((+new Date) - warnTime) > 30000)
                //                {
                //                    noWarn();
                //                }
                //            }
            }
        </script>
    </head>
    <body class="siteBody">
        <form name="aspnetForm" method="post" action="./Welcome.aspx" id="aspnetForm">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value=""/>
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value=""/>
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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"/>
            </div>
            <script type="text/javascript">
                //<![CDATA[
                var theForm = document.forms['aspnetForm'];
                if (!theForm) {
                    theForm = document.aspnetForm;
                }
                function __doPostBack(eventTarget, eventArgument) {
                    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                        theForm.__EVENTTARGET.value = eventTarget;
                        theForm.__EVENTARGUMENT.value = eventArgument;
                        theForm.submit();
                    }
                }
                //]]>
            </script>
            <script src="/WebResource.axd?d=pynGkmcFUV13He1Qd6_TZMQxmC1c8dx5oGQenbivQKdboHRP64DJ5olxTdNiea1SKFRcM7r_b9PtWFq4_1uHuQ2&amp;t=638901881280000000" type="text/javascript"></script>
            <script src="/ScriptResource.axd?d=NJmAwtEo3Ipnlaxl6CMhvn-JhsDljJq1VBcCKboX-V2_xAW4YYkWSX68kGejQiEFxuhsMpp5bS-xqjJy-Fes0e-BamtcvlMJxlonOZzWKE6gqiBbPycwUfyTPLov7eNjfA6u8aYngTRX6SqgKKJCQBXkJuwcTPKJXfaGA5IUTB41&amp;t=32e5dfca" type="text/javascript"></script>
            <script src="/ScriptResource.axd?d=dwY9oWetJoJoVpgL6Zq8OHIyhZnbL7LGSNGibImfFp9XGobhNOYQbUjoI_JZWTEYh6VoeJNG4WIcHPOW17B7izt6-RAZOAMsl9tsmZzVriScmYr-SijbIbQGVkMyTFM3e-H2uejjxdz_FeVkohK2-5-QQ0mGQ50DUjR1EFmIVbo1&amp;t=32e5dfca" type="text/javascript"></script>
            <div>
                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="4B9E2203"/>
                <input type="hidden" name="__PREVIOUSPAGE" id="__PREVIOUSPAGE" value="Zg75WZYiCaMHeD-e4Ry8A-SgSXA6Stus_LPPBqDgunuMZeBXig2UwlHYclYONQ5QjxEZ_OPrkjSivhef7EpNmw2"/>
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="kd1+zpVL6d84lXk51JZPzapqo2b0R/+79b50sahU5MoSZxwdUWGd9OMWzoIBeu8hC0W+ffirlLhsL9YnvdxLJL6ba/ssSQScqEtuIX1Db8NUpmVJhKGWjX/aF/LwwHG4hfzpay8cYtRBeRszcmqGXRbFysHojM3XU2b57+zsvHex0Hfk0pg4SsAY29M6pfelV3tqnw+FGUp46PUWebNJCIKpnfsLfSSPkgBWTIn0U9xMRnEBmOvNnwxnA/VbA7tkcTePqeuDVHNnFquFSvTQ1GYr470ZX28L2NK0vTUPIECBHUOjaJQ5GHD8p6a8otaPHIP8eU+Hw03CmCYdo9d0QqOt/ZuuYLqUy+X7ganIaKOyekMQPe96X5hBqqyFTcBd"/>
            </div>
            <script type="text/javascript">
                //<![CDATA[
                Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'aspnetForm', ['tctl00$updpanelMessages', ''], [], [], 90, 'ctl00');
                //]]>
            </script>
            <script language="javascript" type="text/javascript">
                var onlineul = "#bb-online-ul";
                var onlineNum = "#bb-online-num";
                var alertsul = "#bb-alerts-ul";
                var alertsNum = "#bb-alerts-num";
                var unreadNum = "#bb-unread-num";
                var unreadNum2 = "#mailButton-unread-num";
                //var alertsBar = "#alertpanel";
                var alertsBar = ".alerts";
                var hdnUserMsgsRemove = "hdnMasterUserMsgsRemove";
                var hdnUsersReload = "hdnMasterUsersReload";
                var hdnUsersList = "#hdnMasterUsersList";
                //var hdnMsgsList       = "#ctl00_hdnMsgsList";
                var hdnMsgsList = "#hdnMsgsList";
                var hdnUnreadMsgs = "#hdnUnreadMsgs";
                var idx = 0;
                var reloadInt;
                var msgsShowInt;
                var usersShowInt;
                var msgsBlinkInt;
                var chatsBlinkInt;
                var hideUnreadQtip = 0;

                // Disable non essential postback values
                function onBeforeSubmit() {//$(hdnUsersList).val('');
                }

                function handleBarUpdate() {
                    loadUsers();
                    loadMsgs();
                    reloadInt = setInterval("reloadUsers()", 60000);
                    msgsShowInt = setInterval("loadMsgs()", 10000);
                    usersShowInt = setInterval("loadUsers()", 10000);
                }
                function reloadUsers() {
                    document.getElementById(hdnUsersReload).value = ++idx;
                    __doPostBack(hdnUsersReload, '');
                }

                function loadUsers() {
                    try {
                        var obj = jQuery.parseJSON($(hdnUsersList).val());
                        var total = 0;
                        if (!!$(onlineul)) {
                            $(onlineul).empty();
                            $.each(obj, function(idx, data) {

                                total = idx + 1;

                                iSrc = "./images/user.png";
                                iText = "מתנדב";
                                if (!!data.Gold || !!data.sGold) {
                                    iSrc = "./images/usergold.png";
                                    iText = "מנהל";
                                } else if (!!data.Worker) {
                                    iSrc = "./images/usergray.png";
                                    iText = "עובד";
                                } else if (!!data.Noar) {
                                    iSrc = "./images/userred.png";
                                    iText = "נוער";
                                }

                                iText = "<b>" + data.Name + "</b><br/>" + iText;
                                iImg = "";

                                if (data.ImgId) {
                                    iText += "<br/><img src='./users/" + data.ImgId + "' style='width:128px;height:128px;'/>";
                                    iImg = "<img src='./users/" + data.ImgId + "' style='width:20px;height:20px;'/>"
                                } else {
                                    iText += "<br/><img src='./users/noImg.jpg' style='width:128px;height:128px;'/>";
                                }

                                $(onlineul).append('<li title="' + iText + '"><a href="#" onclick="quickMessage(\'' + escape(data.Name) + '\');"><img src="' + iSrc + '" alt="' + iText + '" />' + iImg + data.Name + '</a></li>');
                            });
                        }
                        $(onlineNum).html(total);
                        $('#chatpanel .subpanel li').hoverbox();
                    } catch (err) {}
                }

                function loadMsgs() {
                    try {
                        try {
                            var obj = jQuery.parseJSON($(hdnMsgsList).val());
                        } catch (e) {}
                        var total = 0;

                        if (!!$(alertsul)) {
                            $(alertsul).empty();
                            $(alertsul).addClass("invisible");
                            if (!!obj) {
                                $.each(obj, function(idx, data) {
                                    mid = data.mId;
                                    total = idx + 1;
                                    liVar = '<li>';
                                    if (!(total % 2)) {
                                        liVar = '<li class="altAlerts">';
                                    }

                                    $(alertsul).append(liVar + '<a href="#" class="delete" id="usrMsg_' + mid + '" onclick="handleMsg(' + mid + ');">X</a><b>' + data.mTitle + '</b><p>' + data.mMsg + '</p><a href="#" class="readMsg" id="usrMsg_' + mid + '" onclick="handleMsg(' + mid + ');">קראתי</a></li>');
                                });

                                $(alertsul).removeClass("invisible");
                            }
                        }

                        try {
                            clearInterval(msgsBlinkInt);
                            clearInterval(chatsBlinkInt);
                        } catch (e) {}

                        // Unread msgs
                        var unread = parseInt($(hdnUnreadMsgs).val());
                        $("#alertSubPanelUnread").addClass("invisible");
                        $(unreadNum).hide();
                        $(unreadNum2).hide();
                        if (!isNaN(unread)) {
                            if (unread > 0) {
                                $("#alertSubPanelUnread").removeClass("invisible");
                                $("#alertSubPanelUnread").html('<a href="./MessagesFolder.aspx" ><img src="../images/messagesMenu.png">&nbsp;<b>' + unread + ' הודעות חדשות</b></a>');
                                //total += unread;

                                $(unreadNum).html(unread);
                                $(unreadNum).show();

                                $(unreadNum2).html(unread).show();
                                chatsBlinkInt = setInterval("blinkChat()", 2000);
                            }
                        }

                        if (total > 0) {

                            $(alertsNum).html(total);
                            $(alertsNum).show();
                            msgsBlinkInt = setInterval("blinkMsgs()", 3000);

                            if (total >= 3) {
                                if (!hideUnreadQtip) {
                                    showUnreadMessagesTooltip();
                                }
                            }
                        } else {
                            $(alertsNum).hide();
                        }
                    } catch (err) {}
                }

                function handleMsg(msg) {
                    try {
                        clearInterval(msgsShowInt);
                    } catch (e) {}
                    $('#usrMsg_' + msg).parent().hide();
                    document.getElementById(hdnUserMsgsRemove).value = msg;
                    $(alertsNum).text($(alertsNum).text() - 1);
                    if ($(alertsNum).text() <= 0) {
                        $(alertsNum).hide();

                        try {
                            clearInterval(msgsBlinkInt);
                        } catch (e) {}
                    }
                    __doPostBack(hdnUserMsgsRemove, '');
                }

                function blinkChat() {
                    $("#liChatAmount").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
                }

                function blinkMsgs() {
                    doBGFade(document.getElementById('alertpanel'), [255, 100, 20], [226, 226, 226], 'rgb(226,226,226)', 40, 20, 1);
                }

                // BGFade - Start
                function easeInOut(minValue, maxValue, totalSteps, actualStep, powr) {
                    //Generic Animation Step Value Generator By www.hesido.com
                    var delta = maxValue - minValue;
                    var stepp = minValue + (Math.pow(((1 / totalSteps) * actualStep), powr) * delta);
                    return Math.ceil(stepp)
                }

                function doBGFade(elem, startRGB, endRGB, finalColor, steps, intervals, powr) {

                    //BG Fader by www.hesido.com
                    if (elem.bgFadeInt)
                        window.clearInterval(elem.bgFadeInt);
                    var actStep = 0;

                    elem.bgFadeInt = window.setInterval(function() {

                        elem.style.backgroundColor = "rgb(" + easeInOut(startRGB[0], endRGB[0], steps, actStep, powr) + "," + easeInOut(startRGB[1], endRGB[1], steps, actStep, powr) + "," + easeInOut(startRGB[2], endRGB[2], steps, actStep, powr) + ")";
                        actStep++;

                        if (actStep > steps) {
                            elem.style.backgroundColor = finalColor;
                            window.clearInterval(elem.bgFadeInt);
                        }
                    }, intervals)
                }
                // BGFade - End
            </script>
            <div class="menuPanel">
                <div class="menuPanel_menubar">
                    <div class="rfloat txtXSmall center" style="padding: 5px 30px 0 30px;">רזולוציה מומלצת לאתר זה: 1280*1024
                </div>
                    <div class="rfloat bold center" style="padding: 0 30px 0 30px;">
                        שלום
                <span id="ctl00_lblName">אלישבע פריד</span>
                    </div>
                    <div class="lfloat ddsmoothmenu" id="topMenu">
                        <ul>
                            <li>
                                <a href="./Welcome.aspx">
                                    <img src="../images/homeMenu.png" onmouseover="this.src='../images/homeMenuHover.png';" onmouseout="this.src='../images/homeMenu.png';"/>
                                </a>
                            </li>
                            <li>
                                <a href="./MessagesFolder.aspx" id='liChatAmount'>
                                    <img src="../images/messagesMenu.png" onmouseover="this.src='../images/messagesMenuHover.png';" onmouseout="this.src='../images/messagesMenu.png';"/>
                                    <span class="notificationCountMsg lfloat roundCorners" id="bb-unread-num" style="display: none;">0</span>
                                </a>
                            </li>
                            <li>
                                <a style="color: #0000FF" id="aShibutzim">שיבוצים</a>
                                <ul>
                                    <li>
                                        <a id="ctl00_btnShibutz" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$btnShibutz&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Shibutz.aspx&quot;, false, true))">שיבוץ</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_btnAvtahot" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$btnAvtahot&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Avtahot.aspx&quot;, false, true))">אבטחות</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_btnCourses" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$btnCourses&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Courses.aspx&quot;, false, true))">השתלמויות</a>
                                    </li>
                                    <li id="ctl00_libtnDriverLearnerShift">
                                        <a id="ctl00_btnDriverLearnerShift" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$btnDriverLearnerShift&quot;, &quot;&quot;, false, &quot;&quot;, &quot;DriverLearnerShift.aspx&quot;, false, true))">השתלמות נהיגה</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_btnTrainingQuestionnaires" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$btnTrainingQuestionnaires&quot;, &quot;&quot;, false, &quot;&quot;, &quot;TrainingQuestionnaires.aspx&quot;, false, true))">הכשרות מקצועיות</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a style="color: #0000FF" id="aContact">פניות</a>
                                <ul>
                                    <li>
                                        <a id="ctl00_lbContact" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$lbContact&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Contact.aspx&quot;, false, true))">פניות למשרד מתנדבים</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_lbContactMonitor" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$lbContactMonitor&quot;, &quot;&quot;, false, &quot;&quot;, &quot;ContactMonitor.aspx&quot;, false, true))">מעקב אחר פניות</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a id="ctl00_btnUpdate" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$btnUpdate&quot;, &quot;&quot;, false, &quot;&quot;, &quot;UpdateDetails.aspx&quot;, false, true))">עדכון פרטים</a>
                            </li>
                            <li>
                                <a id="ctl00_btnDisconnect" href="javascript:__doPostBack(&#39;ctl00$btnDisconnect&#39;,&#39;&#39;)">יציאה</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="txtSmall center RTLDiv topDavid">
                [אתר זה בחסות : דוד דהן – טכנאי תקשורת ומחשבים – מכירה –שדרוג – ותחזוקה – 0522-895877
        או 
                <a href="/cdn-cgi/l/email-protection#11757067787551757d75723f727e3f787d">
                    <span class="__cf_email__" data-cfemail="781c190e111c381c141c1b561b17561114">[email &#160;protected]</span>
                </a>
                <b>שימו לב:</b>
                בבעיות בנושא האתר יש לפתוח פניה <b>(המספר הינו לתמיכה טכנית בלבד. ש לשלוח וואטסאפ ולא להתקשר. לכל נושא אחר נא התקשרו למשרד מתנדבים.)</b>
                ]
        
            </div>
            <div class="clearFloat">&nbsp;</div>
            <div class="RTLDiv" style="width: 100%;">
                <div class="lfloat col4">
                    <div class="bold" style="text-align: center;">קישורים שימושיים
            </div>
                    <div class="RTLDiv" id="dvLinks">
                        <ul>
                            <li>
                                <a href="VolDiscounts.aspx">הנחות בבתי עסק למתנדבי מדא</a>
                            </li>
                            <li>
                                <a href="KraHatom.aspx">הסטוריית קרא וחתום</a>
                            </li>
                            <li>
                                <a href="Forms.aspx">טפסים למתנדבים ולראשי צוותים</a>
                            </li>
                            <li>
                                <a href="Officials.aspx">יצירת קשר עם בעלי תפקידים</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="lfloat col4" style="margin-left: 1%;">
                    <div id="ctl00_ContentPlaceHolder1_dvScrollTitle" class="bold" style="text-align: center;">הודעות למתנדבים</div>
                    <div id="dvScroller" class="scroller" onmouseover="scroller.stopscroll();" onmouseout="scroller.scrollmsg(1);">
                        <ul id="ctl00_ContentPlaceHolder1_ulScrollerData"></ul>
                    </div>
                </div>
                <div class="lfloat col4">
                    <div class="bold" style="text-align: center;">לוח מודעות
            </div>
                    <div id="dvUpdates">
                        <ul id="ctl00_ContentPlaceHolder1_ulUpdates">
                            <li>
                                <p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; background-color: rgb(250, 250, 250); text-align: center;'>
                                    <span id='ctl00_ctl00_ContentPlaceHolder1_manage_gvMessages_ctl03_Label1' style='color: rgb(0, 0, 205); font-size: 18px;'>
                                        <strong>
                                            <u>שעות קבלת קהל ופניות מתנדבים</u>
                                        </strong>
                                    </span>
                                </p>
                                <p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; background-color: rgb(250, 250, 250); text-align: center;'>
                                    <span id='ctl00_ctl00_ContentPlaceHolder1_manage_gvMessages_ctl03_Label1' style='color: rgb(0, 0, 205); font-size: 18px;'>
                                        להלן שעות קבלת קהל במשרד מתנדבים: ימי &nbsp;<strong>א-ה</strong>
                                        &nbsp;בין השעות &nbsp;<strong>09:00-17:00</strong>
                                    </span>
                                </p>
                                <p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; background-color: rgb(250, 250, 250); text-align: center;'>
                                    <span id='ctl00_ctl00_ContentPlaceHolder1_manage_gvMessages_ctl03_Label1'>
                                        <span style='color: rgb(0, 0, 205);'>
                                            <span style='font-size: 18px;'>משרד המתנדבים מטפל בשאר הזמן בפניות טלפוניות או באמצעות אתר השיבוץ (מומלץ)</span>
                                        </span>
                                    </span>
                                </p>
                                <p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; background-color: rgb(250, 250, 250); text-align: center;'>
                                    <span id='ctl00_ctl00_ContentPlaceHolder1_manage_gvMessages_ctl03_Label1'>
                                        <span style='color: rgb(0, 0, 205);'>
                                            <span style='font-size: 18px;'>שימו לב לרשימת בעלי התפקידים ותחומי אחריותם.</span>
                                        </span>
                                    </span>
                                </p>
                                <p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; background-color: rgb(250, 250, 250); text-align: center;'>
                                    <span id='ctl00_ctl00_ContentPlaceHolder1_manage_gvMessages_ctl03_Label1'>
                                        <span style='color: rgb(0, 0, 205);'>
                                            <span style='font-size: 16px;'>
                                                <span style='font-size: 18px;'>לשירותכם תמיד, משרד מתנדבים</span>
                                            </span>
                                        </span>
                                    </span>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="rfloat col4" style="margin-right: 1%;">
                    <div id="dvUserInfo">
                        <div class="bold" style="text-align: center; padding-bottom: 10px;">
                            <span id="ctl00_ContentPlaceHolder1_lblYearTitle" class="bold">סיכום שנת 2026</span>
                        </div>
                        <ul class="small">
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_lblTotalShiftsTitle" class="bold">מס' משמרות:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblTotalShifts">9</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label1" class="bold">מס' אבטחות:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblTotalAvtahot">0</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label4" class="bold">מס' השתלמויות:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblTotalCourses">0</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_lblCoursesDriving" class="bold">מס' השתלמויות נהיגה:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblTotalCoursesDriving">0</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_lblCoursesAvtahot" class="bold">מס' השתלמויות אבטחה:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblTotalCoursesAvtahot">0</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label3" class="bold">משמרת אחרונה: </span>
                                <span id="ctl00_ContentPlaceHolder1_lblLastShift" class="txtSmall">16/04/2026 (לפני 3 ימים)</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_lblNextShiftDatesTitle" class="bold">מועדי המשמרות הבאות:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblNextShiftDates">20/04 </span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_lblDmeiHaverReceiptTitle" class="bold" style="color:Red;">מספר קבלה דמי חבר 2025:</span>
                                <span id="ctl00_ContentPlaceHolder1_lblDmeiHaverReceipt" class="txtSmall" style="color:Red;">אין</span>
                            </li>
                        </ul>
                    </div>
                    <div id="dvTotalFree">
                        <div class="bold" style="border-top: 1px dotted gray; padding-top: 10px; text-align: center;">עכשיו באתר
                </div>
                        <ul id="ulTotalFree">
                            <li>
                                <a href="Avtahot.aspx">90 אבטחות פנויות</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="dvBirthdays" style="margin: 0px 0px 5px 0px;">
                <img src="./images/cake.png" class="rfloat" style="position: relative; top: 4px;"/>
                <div class="rfloat" style="padding-right: 6px;padding-top:3px;">
                    <span class="bold rfloat">מזל טוב למתנדבים הבאים!</span>
                    <span class="txtXSmall bold clearFloat rfloat">(לחץ על השם כדי לשלוח הודעת מזל טוב)</span>
                </div>
                <ul id="ulBirthdays">
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%90%d7%93%d7%95%d7%94+%d7%9c%d7%95%d7%99');">&nbsp;אדוה לוי</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%90%d7%95%d7%a8%d7%99+%d7%a9%d7%a9%d7%95%d7%9f');">&nbsp;אורי ששון</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%90%d7%99%d7%99%d7%9c%d7%aa+%d7%9c%d7%95%d7%99');">&nbsp;איילת לוי</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%90%d7%9c%d7%99+%d7%a8%d7%95%d7%98');">
                            <img src="./users/tp9880_20211123025634.jpg" height="20px" width="20px" title="<b>אלי רוט</b><br/><img src='./users/p9880_20211123025634.jpg' style='width:128px;height:128px;'/>">&nbsp;אלי רוט
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%92%d7%9c%d7%a2%d7%93+%d7%95%d7%90%d7%a0%d7%95%d7%9f');">&nbsp;גלעד ואנון</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%99%d7%94%d7%95%d7%93%d7%94+%d7%91%d7%9f%d7%99%d7%a6%d7%97%d7%a7');">
                            <img src="./users/tp13434_20250616173513.jpg" height="20px" width="20px" title="<b>יהודה בןיצחק</b><br/><img src='./users/p13434_20250616173513.jpg' style='width:128px;height:128px;'/>">&nbsp;יהודה בןיצחק
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%99%d7%95%d7%90%d7%9c+%d7%a9%d7%9c%d7%99%d7%99%d7%93%d7%a8');">
                            <img src="./users/tp4593_20250201182545.jpg" height="20px" width="20px" title="<b>יואל שליידר</b><br/><img src='./users/p4593_20250201182545.jpg' style='width:128px;height:128px;'/>">&nbsp;יואל שליידר
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%9c%d7%90%d7%94+%d7%a1%d7%95%d7%9c%d7%98%d7%9f');">&nbsp;לאה סולטן</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%9e%d7%92%d7%93+%d7%a8%d7%90%d7%91%d7%99%d7%94');">
                            <img src="./users/tp13114_20240404212021.jpg" height="20px" width="20px" title="<b>מגד ראביה</b><br/><img src='./users/p13114_20240404212021.jpg' style='width:128px;height:128px;'/>">&nbsp;מגד ראביה
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%9e%d7%95%d7%98%d7%99+%d7%a4%d7%a8%d7%99%d7%93%d7%9e%d7%9f');">&nbsp;מוטי פרידמן</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%9e%d7%a8%d7%99%d7%9d+%d7%9c%d7%99%d7%a4%d7%99%d7%a0%d7%a1%d7%a7%d7%99');">&nbsp;מרים ליפינסקי</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a0%d7%93%d7%91+%d7%96%d7%95%d7%94%d7%a8');">
                            <img src="./users/tp14364_20250728201653.jpg" height="20px" width="20px" title="<b>נדב זוהר</b><br/><img src='./users/p14364_20250728201653.jpg' style='width:128px;height:128px;'/>">&nbsp;נדב זוהר
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a0%d7%aa%d7%a0%d7%90%d7%9c+%d7%94%d7%99%d7%9c%d7%9e%d7%9f');">&nbsp;נתנאל הילמן</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a2%d7%93%d7%99%d7%90%d7%9c+%d7%a8%d7%95%d7%91%d7%99%d7%a0%d7%a1');">&nbsp;עדיאל רובינס</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a2%d7%95%d7%a4%d7%a8%d7%99+%d7%92%d7%b3%d7%95%d7%a8%d7%92%d7%b3%d7%99');">
                            <img src="./users/tp12700_20231210174048.jpg" height="20px" width="20px" title="<b>עופרי ג׳ורג׳י</b><br/><img src='./users/p12700_20231210174048.jpg' style='width:128px;height:128px;'/>">&nbsp;עופרי ג׳ורג׳י
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a2%d7%9e%d7%a0%d7%95%d7%90%d7%9c+%d7%92%d7%a8%d7%99%d7%a0%d7%95%d7%95%d7%9c%d7%93');">
                            <img src="./users/tp480_20130409121406.jpg" height="20px" width="20px" title="<b>עמנואל גרינוולד</b><br/><img src='./users/p480_20130409121406.jpg' style='width:128px;height:128px;'/>">&nbsp;עמנואל גרינוולד
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a7%d7%98%d7%99%d7%94+%d7%95%d7%99%d7%99%d7%a0%d7%a8');">
                            <img src="./users/tp511_20130324183829.jpg" height="20px" width="20px" title="<b>קטיה ויינר</b><br/><img src='./users/p511_20130324183829.jpg' style='width:128px;height:128px;'/>">&nbsp;קטיה ויינר
                        </a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a8%d7%9e%d7%94+%d7%9e%d7%a0%d7%a9%d7%94');">&nbsp;רמה מנשה</a>
                    </li>
                    <li class="birthdayData">
                        <a href="#" onclick="quickMessage('%d7%a9%d7%9e%d7%95%d7%90%d7%9c%d7%90%d7%94%d7%a8%d7%95%d7%9f+%d7%99%d7%a9%d7%a8%d7%90%d7%9c');">
                            <img src="./users/tp14077_20260211100601.jpg" height="20px" width="20px" title="<b>שמואלאהרון ישראל</b><br/><img src='./users/p14077_20260211100601.jpg' style='width:128px;height:128px;'/>">&nbsp;שמואלאהרון ישראל
                        </a>
                    </li>
                </ul>
            </div>
            <div id="dvOneLine" class="RTLDiv">
                <span class="bold">הודעות קצרות</span>
                <span class="xSmall">(זה המקום שלכם להתבטא!)</span>
                &nbsp;&nbsp;<input name="ctl00$ContentPlaceHolder1$tbOneLine" type="text" maxlength="250" id="ctl00_ContentPlaceHolder1_tbOneLine" style="width: 65%"/>
                <input type="submit" name="ctl00$ContentPlaceHolder1$btnAddMessage" value="הוסף הודעה" onclick="btnAddMessage_ClientClick();" id="ctl00_ContentPlaceHolder1_btnAddMessage"/>
                <img id="loadDiv" style="display: none;" src="./images/cardio.gif"/>
                <div id="dvOneLineData" style="overflow: auto; height: 90px;">
                    <ul id="ctl00_ContentPlaceHolder1_ulOneLiners">
                        <li class="oneLiner">
                            <span class="txtXSmall">[18/04/2026 21:36]</span>
                            &nbsp;<b>נתאי סאייג:</b>
                            &nbsp;ערב טוב! תקן ריק מחר בערב בנהז פסגה מוזמנים לתפוס!
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[18/04/2026 20:44]</span>
                            &nbsp;<b>רינת סנובל:</b>
                            &nbsp;ערב טוב, אפשר להסיר אותי בבקשה ממשמרת בוקר תחנה מחר?
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[18/04/2026 20:43]</span>
                            &nbsp;<b>רינת סנובל:</b>
                            &nbsp;ערב טוב
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[18/04/2026 20:19]</span>
                            &nbsp;<b>מאירה שיין:</b>
                            &nbsp;זה
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[18/04/2026 18:28]</span>
                            &nbsp;<b>ג'ומאנה מוחתסב:</b>
                            &nbsp;שלום, שכחתי את הכוס התרמי שלי היום באמבלנס 2117, מישו מצא בבקשה לשלוח הודעה לווטסאפ 0545719204
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[15/04/2026 20:23]</span>
                            &nbsp;<img src="./users/tp7281_20240406232657.jpg" height="20px" width="20px" title="<b>אבישי ירדן</b><br/><img src='./users/p7281_20240406232657.jpg' style='width:128px;height:128px;'/>">
                            <b>אבישי ירדן:</b>
                            &nbsp;היי, אפשר להסיר אותי ממרתון ירושלים? נקראתי למילואים
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[15/04/2026 10:19]</span>
                            &nbsp;<b>נטליה סמושקין:</b>
                            &nbsp;בוקר טוב, מבקשת להסיר אותי בבקשה מאבטחה ב20.04 טקס יום הזיכרון - ככר ספרא
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[14/04/2026 20:37]</span>
                            &nbsp;<b>נלי ארנפלד:</b>
                            &nbsp;אהלן ערב טוב לכולם. יש שני מקומות פנויים בשבת ערב השבוע ה18.4 מוזמנים לאייש &#129782;
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[14/04/2026 11:19]</span>
                            &nbsp;<img src="./users/tp14335_20250529165234.jpg" height="20px" width="20px" title="<b>שרה פולק</b><br/><img src='./users/p14335_20250529165234.jpg' style='width:128px;height:128px;'/>">
                            <b>שרה פולק:</b>
                            &nbsp;בבקשה להסיר אותי מאבטחה בפסטיבל נטראז - מצוקי דרגות ב16/4.
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[14/04/2026 00:01]</span>
                            &nbsp;<img src="./users/tp10728_20250408231140.jpg" height="20px" width="20px" title="<b>אלעזר מוסקוב</b><br/><img src='./users/p10728_20250408231140.jpg' style='width:128px;height:128px;'/>">
                            <b>אלעזר מוסקוב:</b>
                            &nbsp;נמצא אוזניות באמבולנס 1637 מי שאיבד לשלוח הודעת וואטסאפ ל 0529528813
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[12/04/2026 18:19]</span>
                            &nbsp;<b>יאיר ברוכים:</b>
                            &nbsp;אשמח להסרה משיבוץ למשמרת ערב מחר עם גיסון גרדנר
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[12/04/2026 03:51]</span>
                            &nbsp;<b>בןציון שטיימאן:</b>
                            &nbsp;יש לך אופציה למעלה עבור חשיבות אחר אמור  להיות לך שם ביתר
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[10/04/2026 14:52]</span>
                            &nbsp;<img src="./users/tp15534_20260409231320.jpg" height="20px" width="20px" title="<b>יהודה גבאי</b><br/><img src='./users/p15534_20260409231320.jpg' style='width:128px;height:128px;'/>">
                            <b>יהודה גבאי:</b>
                            &nbsp;איך עושים שיבוץ למשמרת בביתר עילית
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[10/04/2026 02:28]</span>
                            &nbsp;<b>שלמה בלסיאנו:</b>
                            &nbsp;אשמח להסרה משיבוץ של אבטחה ערב יום הזיכרון בכפר עציון
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[09/04/2026 21:53]</span>
                            &nbsp;<b>אליהו טאובר:</b>
                            &nbsp;מגיע כמתוכנן למשמרת הלילה אין צורך להסיר אותי
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[09/04/2026 20:37]</span>
                            &nbsp;<b>אליהו טאובר:</b>
                            &nbsp;היי אשמח להסרה בדחיפות ממשמרת לילה תקן תחנה בין חמישי לשישי עקב בלתמ
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[09/04/2026 12:42]</span>
                            &nbsp;<b>איתמר ליבוביץ:</b>
                            &nbsp;הי אשמח להסרה מחר ממשמרת בוקר עכ, תודה
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[08/04/2026 20:32]</span>
                            &nbsp;<b>לאה קראנסדורף:</b>
                            &nbsp;אפשר להסיר אותי משמרת ערב מחר עם הנהג ידידיה קופליק אני חולה
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[06/04/2026 11:33]</span>
                            &nbsp;<b>ידידיה גורדון:</b>
                            &nbsp;בנק הזם
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[04/04/2026 20:09]</span>
                            &nbsp;<img src="./users/tp11554_20230114230609.png" height="20px" width="20px" title="<b>לורד עטיה</b><br/><img src='./users/p11554_20230114230609.png' style='width:128px;height:128px;'/>">
                            <b>לורד עטיה:</b>
                            &nbsp;שבוע טוב אשמח להסיר אותי ממשמרת מחר ערב בלבן תחנה
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[02/04/2026 20:30]</span>
                            &nbsp;<img src="./users/tp13072_20240908105905.jpg" height="20px" width="20px" title="<b>צוריאל חיון</b><br/><img src='./users/p13072_20240908105905.jpg' style='width:128px;height:128px;'/>">
                            <b>צוריאל חיון:</b>
                            &nbsp;איפה משתבצים בישובי בנימין? זה לא מופיע בשיבוצים
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[31/03/2026 22:45]</span>
                            &nbsp;<img src="./users/tp12658_20250914122411.jpg" height="20px" width="20px" title="<b>רועי אמיר</b><br/><img src='./users/p12658_20250914122411.jpg' style='width:128px;height:128px;'/>">
                            <b>רועי אמיר:</b>
                            &nbsp;חג שמח, מספר חוסרים מחר במשמרות בוקר, נשמח לעזרתכם!
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[30/03/2026 12:14]</span>
                            &nbsp;<img src="./users/tp12658_20250914122411.jpg" height="20px" width="20px" title="<b>רועי אמיר</b><br/><img src='./users/p12658_20250914122411.jpg' style='width:128px;height:128px;'/>">
                            <b>רועי אמיר:</b>
                            &nbsp;מתנדבים יקרים שימו לב !, שיבוץ ירושלים לבן לחודש אפריל עלה לאתר, מוזמנים להשתבץ !
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[30/03/2026 12:14]</span>
                            &nbsp;<img src="./users/tp12658_20250914122411.jpg" height="20px" width="20px" title="<b>רועי אמיר</b><br/><img src='./users/p12658_20250914122411.jpg' style='width:128px;height:128px;'/>">
                            <b>רועי אמיר:</b>
                            &nbsp;מתנדבים יקרים שימו לב ! שיבוץ ירושלים לבן לחודש אפריל עלה לאתר, מוזמנים להשתבץ !
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[29/03/2026 17:19]</span>
                            &nbsp;<img src="./users/tp10299_20241216181305.jpg" height="20px" width="20px" title="<b>שלום קסטרייך</b><br/><img src='./users/p10299_20241216181305.jpg' style='width:128px;height:128px;'/>">
                            <b>שלום קסטרייך:</b>
                            &nbsp;15:00-23:00
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[29/03/2026 14:38]</span>
                            &nbsp;<b>גולדי פינצס:</b>
                            &nbsp;הי ,מאיזה שעה עד איזה שעה זה משמרת ערב?
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[29/03/2026 14:30]</span>
                            &nbsp;<b>שמחה שירר:</b>
                            &nbsp;שכחתי באמבולנס 2112 שקית עם קופסאות פלסטיק בחמישי בלילה, אם מישהו ראה בבקשה צרו קשר 0556868180
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[29/03/2026 01:26]</span>
                            &nbsp;<b>אלישע פרקש:</b>
                            &nbsp;אפשר בבקשה להסיר אותי משמרת ערב יום שני תחנה?
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[26/03/2026 22:56]</span>
                            &nbsp;<b>חנן פרינס:</b>
                            &nbsp;מישהו יכול בבקשה להסיר אותי ממשמרת בוקר מחר (עקב הלוויה)
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[26/03/2026 08:01]</span>
                            &nbsp;<b>אלעזר מור:</b>
                            &nbsp;מספר קורס אתה יכול לראות בלומדות
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[25/03/2026 17:20]</span>
                            &nbsp;<img src="./users/tp11059_20260222024055.jpg" height="20px" width="20px" title="<b>אליהו סמיה</b><br/><img src='./users/p11059_20260222024055.jpg' style='width:128px;height:128px;'/>">
                            <b>אליהו סמיה:</b>
                            &nbsp;איפה אני יכול לראות מה המספר קורס שלי?
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[25/03/2026 07:44]</span>
                            &nbsp;<b>שילה שטיינר:</b>
                            &nbsp;בוקר טוב!! יש מצב להוריד אותי משיבוץ מחר (חמישי) ערב תחנה? אני רואה שלא אוכל...
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[25/03/2026 02:49]</span>
                            &nbsp;<b>מרדכייצחק פביאן:</b>
                            &nbsp;מזל טוב
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[25/03/2026 01:34]</span>
                            &nbsp;<b>יונתן אוסטרן:</b>
                            &nbsp;מה אומר אחי
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[22/03/2026 14:30]</span>
                            &nbsp;<b>מרדכייצחק פביאן:</b>
                            &nbsp;יוני אוסטרן
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[22/03/2026 00:53]</span>
                            &nbsp;<b>מרים גרינברג:</b>
                            &nbsp;בבקשה להסיר אותי ממשמרת בוקר פסגת זאב  ב22 לחודש
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[21/03/2026 20:33]</span>
                            &nbsp;<b>יצחק שחר:</b>
                            &nbsp;שבוע טוב אם אפשר להסיר אותי מהמשמרת יום ראשון בוקר י-ם 8-16
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[20/03/2026 17:21]</span>
                            &nbsp;<img src="./users/tp5169_20151027145834.jpg" height="20px" width="20px" title="<b>הלל ברנר</b><br/><img src='./users/p5169_20151027145834.jpg' style='width:128px;height:128px;'/>">
                            <b>הלל ברנר:</b>
                            &nbsp;איפה משתבצים לישובים בבנימין?
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[19/03/2026 16:47]</span>
                            &nbsp;<img src="./users/tp11512_20250504153556.jpg" height="20px" width="20px" title="<b>שלמה הלרשטיין</b><br/><img src='./users/p11512_20250504153556.jpg' style='width:128px;height:128px;'/>">
                            <b>שלמה הלרשטיין:</b>
                            &nbsp;השארתי חמצוור שחור באמבולנס 2119 אחרי משמרת שישי בוקר 6/3, אם מישהו ראה אותו או יודע מי היה על האמבולנס לאחר מכאן אשמח שיפנה אלי. 0585404414
                        </li>
                        <li class="oneLiner">
                            <span class="txtXSmall">[18/03/2026 20:49]</span>
                            &nbsp;<img src="./users/tp14504_20250731182109.png" height="20px" width="20px" title="<b>איתן שרייבר</b><br/><img src='./users/p14504_20250731182109.png' style='width:128px;height:128px;'/>">
                            <b>איתן שרייבר:</b>
                            &nbsp;אשאר בשיבוץ - אין צורך להסיר אותי
                        </li>
                    </ul>
                </div>
            </div>
            <div id="dvTzevaAdom" class="roundCorners bottomLeftPane" style="display: none;">
                <span class="bold txtRed">&nbsp;דיווחי צבע אדום - מתעדכן אוטומטית כל מספר שניות</span>
                <hr/>
                <ul id="ulTzevaAdom" class="ulTzevaAdom"/>
            </div>
            <div id="dvHistory" class="bottomLeftPane RTLDiv">
                <ul id="ctl00_ContentPlaceHolder1_ulHistory" class="ulHistory">
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:10]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>מושקא קניבסקי</b>
                        לאבטחה: <b>יום הזיכרון - הר הרצל</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:09]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>אורי כהן</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:09]</span>
                        &nbsp;&nbsp;<b>אלימלך מסלו</b>
                        השתבץ לאבטחה: <b>חזרה ערב יום הזיכרון - הכותל המערבי </b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:09]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>עלמה אילן</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת בוקר ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:06]</span>
                        &nbsp;<img src="./users/tp13925_20251027081715.jpg" height="20px" width="20px" title="<b>מני שטינמץ</b><br/><img src='./users/p13925_20251027081715.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>מני שטינמץ</b>
                        השתבץ לשיבוץ <b>בית שמש</b>
                        (משמרת לילה ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:04]</span>
                        &nbsp;&nbsp;<b>יאיר חכימי</b>
                        השתבץ לשיבוץ <b>בית שמש</b>
                        (משמרת לילה ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:03]</span>
                        &nbsp;<img src="./users/tp6911_20170608081611.png" height="20px" width="20px" title="<b>דרור ראובן</b><br/><img src='./users/p6911_20170608081611.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>דרור ראובן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 22:02]</span>
                        &nbsp;<img src="./users/tp6911_20170608081611.png" height="20px" width="20px" title="<b>דרור ראובן</b><br/><img src='./users/p6911_20170608081611.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>דרור ראובן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:55]</span>
                        &nbsp;&nbsp;<b>יחיאל שניידר</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:52]</span>
                        &nbsp;&nbsp;<b>נטע ידיד</b>
                        השתבצה לאבטחה: <b>משחק הפועל ירושלים - טדי</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:52]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:51]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>נוגה גבריאלי</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:51]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>מושקא קניבסקי</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:51]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>נוגה גבריאלי</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:51]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>מושקא קניבסקי</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:51]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        שיבץ את <b>אביה בן עיון</b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:50]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        הסיר את <b>עובד</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:49]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        שיבץ את <b>מעיין </b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:49]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        הסיר את <b>הילה כהן</b>
                        משיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-09/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:48]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>מיכאל יגן</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:48]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        הסיר את <b>מנהלה</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:48]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>אגם יחזקאל</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:48]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        שיבץ את <b>אביה\</b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:48]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>מיכל שבת</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:48]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        הסיר את <b>מנהלה</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:47]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        הסיר את <b>אורי קלצמן</b>
                        משיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:46]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        הסיר את <b>עובד</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        שיבץ את <b>זגמן </b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp2954_20130602095830.jpg" height="20px" width="20px" title="<b>נדב ארזי</b><br/><img src='./users/p2954_20130602095830.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נדב ארזי</b>
                        שיבץ את <b>זגמן</b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>דניאל אמזלג</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת בוקר ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp9037_20191107122825.jpg" height="20px" width="20px" title="<b>ירין אזולאי</b><br/><img src='./users/p9037_20191107122825.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>ירין אזולאי</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>שלי צוקרמן</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת בוקר ב-25/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>סתיו שמש</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:45]</span>
                        &nbsp;<img src="./users/tp9037_20191107122825.jpg" height="20px" width="20px" title="<b>ירין אזולאי</b><br/><img src='./users/p9037_20191107122825.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>ירין אזולאי</b>
                        הסיר את <b>תומר גרבצקי</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:44]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>לנה סתפאנוב</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:44]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>אבישג דניאל</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:44]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:44]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>תהל שרהאליה</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:44]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        שיבצה את <b>בת שירות</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:44]</span>
                        &nbsp;&nbsp;<b>מגד אבורמילה</b>
                        שיבצה את <b>מוחמד עבידאת</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>דביר שבציון</b>
                        הסיר עצמו משיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>מגד אבורמילה</b>
                        הסירה את <b>איוב עמירה</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>אלירן בןהרוש</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:43]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:41]</span>
                        &nbsp;&nbsp;<b>שמעון מסר</b>
                        השתבץ לאבטחה: <b>משחק הפועל ירושלים - טדי</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:39]</span>
                        &nbsp;&nbsp;<b>כרמל קליף</b>
                        הסיר עצמו מאבטחה: <b>משחק הפועל ירושלים - טדי</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:38]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        הסיר את <b>מושקא קניבסקי</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:38]</span>
                        &nbsp;<img src="./users/tp8789_20190902180245.jpg" height="20px" width="20px" title="<b>סעיד אבו סביח</b><br/><img src='./users/p8789_20190902180245.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>סעיד אבו סביח</b>
                        הסיר את <b>עבדאלרחמן סנדוקה</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:38]</span>
                        &nbsp;<img src="./users/tp13955_20250119194445.jpg" height="20px" width="20px" title="<b>נהוראי לוינזון</b><br/><img src='./users/p13955_20250119194445.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נהוראי לוינזון</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:38]</span>
                        &nbsp;<img src="./users/tp2079_20130505200419.jpg" height="20px" width="20px" title="<b>רפי סעייד</b><br/><img src='./users/p2079_20130505200419.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>רפי סעייד</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:37]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>חיה לוק</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת לילה ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:37]</span>
                        &nbsp;&nbsp;<b>אביגיל נידם</b>
                        השתבצה לאבטחה: <b>משחק בוגרים הפועל - ספורטק</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:36]</span>
                        &nbsp;&nbsp;<b>נתאי סאייג</b>
                        כתב הודעה ב'הודעות קצרות'
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:34]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:33]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>אביטל קופפר</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:33]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>גבריאל שאדי</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:33]</span>
                        &nbsp;&nbsp;<b>תומר גרבצקי</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:32]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>יהונתן אור</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:32]</span>
                        &nbsp;<img src="./users/tp14571_20251126200321.jpg" height="20px" width="20px" title="<b>דוד קליין</b><br/><img src='./users/p14571_20251126200321.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>דוד קליין</b>
                        השתבץ לשיבוץ <b>בית שמש</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:32]</span>
                        &nbsp;&nbsp;<b>נתאי סאייג</b>
                        הסיר את <b>שילת סרוסי</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:32]</span>
                        &nbsp;&nbsp;<b>נתאי סאייג</b>
                        הסיר את <b>דביר דמארי</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:32]</span>
                        &nbsp;&nbsp;<b>נתאי סאייג</b>
                        הסיר את <b>ידידיה זילברשטיין</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:31]</span>
                        &nbsp;&nbsp;<b>אביב נורני</b>
                        שיבץ את <b>אלקנה הרשקוביץ</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:31]</span>
                        &nbsp;&nbsp;<b>אביב נורני</b>
                        שיבץ את <b>תהל רוזנשטיין</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:31]</span>
                        &nbsp;&nbsp;<b>אביב נורני</b>
                        שיבץ את <b>שחר נענה</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:31]</span>
                        &nbsp;&nbsp;<b>אביב נורני</b>
                        שיבץ את <b>שילת אוחנה</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:30]</span>
                        &nbsp;&nbsp;<b>אביב נורני</b>
                        שיבץ את <b>רועימשה ניקולסצוקער</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:30]</span>
                        &nbsp;&nbsp;<b>אביב נורני</b>
                        השתבץ לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:30]</span>
                        &nbsp;&nbsp;<b>כרמל קליף</b>
                        השתבץ לאבטחה: <b>משחק הפועל ירושלים - טדי</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:29]</span>
                        &nbsp;&nbsp;<b>תהילה קדוש</b>
                        הסירה את <b>בת שרות</b>
                        משיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:29]</span>
                        &nbsp;&nbsp;<b>אליסף פינץ</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:29]</span>
                        &nbsp;<img src="./users/tp12269_20230907142041.jpg" height="20px" width="20px" title="<b>נחמיה ווליצקי</b><br/><img src='./users/p12269_20230907142041.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נחמיה ווליצקי</b>
                        השתבץ לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:29]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>שירה בןסימון</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:28]</span>
                        &nbsp;<img src="./users/tp2000_20130814162340.jpg" height="20px" width="20px" title="<b>אבישי שפירא</b><br/><img src='./users/p2000_20130814162340.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אבישי שפירא</b>
                        השתבץ לאבטחה: <b>טקס יום הזיכרון - ככר ספרא</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:28]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>גרשון בריל</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת לילה ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:28]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>גרשון בריל</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת לילה ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:27]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>עילאי אוחנה</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:27]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>יהונתן אור</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:27]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>שירה בןמשה</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:26]</span>
                        &nbsp;<img src="./users/tp12673_20250830075209.jpg" height="20px" width="20px" title="<b>מיכאל מור</b><br/><img src='./users/p12673_20250830075209.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>מיכאל מור</b>
                        שיבץ את <b>דביר הרבסט</b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:26]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>עידן רוזנבאום</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:26]</span>
                        &nbsp;&nbsp;<b>ליבי גלבגיסר</b>
                        שיבצה את <b>יעקב זטמן</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:26]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>נועה פרץ</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:25]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>עדי לוברבום</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:25]</span>
                        &nbsp;<img src="./users/tp12502_20250119003310.jpg" height="20px" width="20px" title="<b>משה ברלין</b><br/><img src='./users/p12502_20250119003310.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>משה ברלין</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:25]</span>
                        &nbsp;<img src="./users/tp1602_20230511093219.jpg" height="20px" width="20px" title="<b>ראובן הרו</b><br/><img src='./users/p1602_20230511093219.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>ראובן הרו</b>
                        הסיר את <b>שמואל מודס</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:23]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>אריאל שמש</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:22]</span>
                        &nbsp;<img src="./users/tp8939_20191029203441.jpg" height="20px" width="20px" title="<b>יצחק מזרחי</b><br/><img src='./users/p8939_20191029203441.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יצחק מזרחי</b>
                        שיבץ את <b>נועה פרץ</b>
                        לשיבוץ <b>מעלה אדומים</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>גבריאל שאדי</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>לירון אליס</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>אברהם נעימי</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>יעל כהן</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;&nbsp;<b>ברכה פלדמן</b>
                        השתבצה לשיבוץ <b>ירושלים לבן</b>
                        (משמרת לילה ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>עדי כהן</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:21]</span>
                        &nbsp;&nbsp;<b>ליהי אברהם</b>
                        השתבצה לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:20]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>מוריה נחמן</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:20]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>אריאל נעימי</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:20]</span>
                        &nbsp;&nbsp;<b>מרדכי טייב</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:20]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>גבריאל שאדי</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:20]</span>
                        &nbsp;&nbsp;<b>יותם צור</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:20]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>מלכה הלמן</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:19]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>נעמה אברהמי</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:19]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        שיבץ את <b>חיים מיטלדורף</b>
                        לשיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:19]</span>
                        &nbsp;<img src="./users/tp12146_20240214161746.png" height="20px" width="20px" title="<b>יעקב זטמן</b><br/><img src='./users/p12146_20240214161746.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יעקב זטמן</b>
                        הסיר את <b>נועם איטח</b>
                        משיבוץ <b>בית שמש</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:18]</span>
                        &nbsp;<img src="./users/tp15492_20260409173251.png" height="20px" width="20px" title="<b>שפרה מלכא</b><br/><img src='./users/p15492_20260409173251.png' style='width:128px;height:128px;'/>">
                        &nbsp;<b>שפרה מלכא</b>
                        השתבצה לשיבוץ <b>ירושלים לבן</b>
                        (משמרת בוקר ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:18]</span>
                        &nbsp;<img src="./users/tp14251_20250504223302.jpg" height="20px" width="20px" title="<b>יחיא נתשה</b><br/><img src='./users/p14251_20250504223302.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יחיא נתשה</b>
                        השתבץ לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:17]</span>
                        &nbsp;<img src="./users/tp6545_20171027161526.jpg" height="20px" width="20px" title="<b>אופק לוי</b><br/><img src='./users/p6545_20171027161526.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אופק לוי</b>
                        הסירה את <b>אורי צוקרמן</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:17]</span>
                        &nbsp;<img src="./users/tp6545_20171027161526.jpg" height="20px" width="20px" title="<b>אופק לוי</b><br/><img src='./users/p6545_20171027161526.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אופק לוי</b>
                        הסירה את <b>אורי צוקרמן</b>
                        משיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:17]</span>
                        &nbsp;&nbsp;<b>מתנאל שרעבי</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:16]</span>
                        &nbsp;&nbsp;<b>עדי ילון</b>
                        שיבצה את <b>לינוי אביטל</b>
                        לאבטחה: <b>ביתר מול חיפה - טדי</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:16]</span>
                        &nbsp;&nbsp;<b>עדי ילון</b>
                        הסירה את <b>ישי קדרון</b>
                        מאבטחה: <b>ביתר מול חיפה - טדי</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:16]</span>
                        &nbsp;&nbsp;<b>מתנאל שרעבי</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:16]</span>
                        &nbsp;&nbsp;<b>מתנאל שרעבי</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:16]</span>
                        &nbsp;&nbsp;<b>אורי צוקרמן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:15]</span>
                        &nbsp;<img src="./users/tp14251_20250504223302.jpg" height="20px" width="20px" title="<b>יחיא נתשה</b><br/><img src='./users/p14251_20250504223302.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יחיא נתשה</b>
                        השתבץ לשיבוץ <b>ירושלים לבן</b>
                        (משמרת לילה ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:15]</span>
                        &nbsp;<img src="./users/tp14251_20250504223302.jpg" height="20px" width="20px" title="<b>יחיא נתשה</b><br/><img src='./users/p14251_20250504223302.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יחיא נתשה</b>
                        השתבץ לשיבוץ <b>ירושלים לבן</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:12]</span>
                        &nbsp;<img src="./users/tp14373_20251224132452.jpg" height="20px" width="20px" title="<b>יוסףחיים נזרוב</b><br/><img src='./users/p14373_20251224132452.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יוסףחיים נזרוב</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:11]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        השתבץ לשיבוץ <b>גוש עציון</b>
                        (משמרת בוקר ב-18/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:10]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>יעקב ווגליין</b>
                        לשיבוץ <b>גוש עציון</b>
                        (משמרת בוקר ב-18/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:10]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        השתבץ לשיבוץ <b>גוש עציון</b>
                        (משמרת לילה ב-18/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:10]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>יעקב ווגליין</b>
                        לשיבוץ <b>גוש עציון</b>
                        (משמרת לילה ב-18/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:07]</span>
                        &nbsp;&nbsp;<b>תמר קפלן</b>
                        השתבצה לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:06]</span>
                        &nbsp;<img src="./users/tp11160_20250923205026.jpg" height="20px" width="20px" title="<b>יונתן סורין</b><br/><img src='./users/p11160_20250923205026.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יונתן סורין</b>
                        הסיר את <b>מנהלה</b>
                        מאבטחה: <b>ערב יום הזיכרון - בריכת הסולטן</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:02]</span>
                        &nbsp;&nbsp;<b>הילה דוד</b>
                        שיבצה את <b>ליבי גלבגיסר</b>
                        לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-21/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:02]</span>
                        &nbsp;<img src="./users/tp8046_20250228000630.jpg" height="20px" width="20px" title="<b>שלמה גוטליב</b><br/><img src='./users/p8046_20250228000630.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>שלמה גוטליב</b>
                        השתבץ לשיבוץ <b>כונני קהילה</b>
                        (משמרת בוקר ב-18/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:02]</span>
                        &nbsp;&nbsp;<b>אורי צוקרמן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:02]</span>
                        &nbsp;<img src="./users/tp11433_20221212122022.jpg" height="20px" width="20px" title="<b>שמעון שטיינגרט</b><br/><img src='./users/p11433_20221212122022.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>שמעון שטיינגרט</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:01]</span>
                        &nbsp;&nbsp;<b>צביה גוטנברג</b>
                        השתבצה לאבטחה: <b>התרמת דם - אפרת</b>
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:01]</span>
                        &nbsp;<img src="./users/tp8114_20260128114442.jpg" height="20px" width="20px" title="<b>אילון אלעזר כהן</b><br/><img src='./users/p8114_20260128114442.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אילון אלעזר כהן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:01]</span>
                        &nbsp;<img src="./users/tp8114_20260128114442.jpg" height="20px" width="20px" title="<b>אילון אלעזר כהן</b><br/><img src='./users/p8114_20260128114442.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אילון אלעזר כהן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:01]</span>
                        &nbsp;<img src="./users/tp12812_20240203194131.jpg" height="20px" width="20px" title="<b>נתנאל הלר</b><br/><img src='./users/p12812_20240203194131.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>נתנאל הלר</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:01]</span>
                        &nbsp;&nbsp;<b>אליהו טאובר</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp12705_20231227154140.jpg" height="20px" width="20px" title="<b>יהודה כלפה</b><br/><img src='./users/p12705_20231227154140.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>יהודה כלפה</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp10326_20220301100109.jpg" height="20px" width="20px" title="<b>אברהם זייבלד</b><br/><img src='./users/p10326_20220301100109.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אברהם זייבלד</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>זכריה קוניג</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת לילה ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;&nbsp;<b>מרדכי טייב</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp11262_20230816100304.jpg" height="20px" width="20px" title="<b>חיים קליין</b><br/><img src='./users/p11262_20230816100304.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>חיים קליין</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;&nbsp;<b>מרדכי טייב</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;&nbsp;<b>אורי צוקרמן</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת ערב ב-23/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp11262_20230816100304.jpg" height="20px" width="20px" title="<b>חיים קליין</b><br/><img src='./users/p11262_20230816100304.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>חיים קליין</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-22/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp12135_20230502090435.jpg" height="20px" width="20px" title="<b>אהרון היימן</b><br/><img src='./users/p12135_20230502090435.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון היימן</b>
                        שיבץ את <b>עדי ניסים</b>
                        לשיבוץ <b>ירושלים לבן</b>
                        (משמרת לילה ב-20/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;<img src="./users/tp12594_20240918175909.jpg" height="20px" width="20px" title="<b>אהרון קליין</b><br/><img src='./users/p12594_20240918175909.jpg' style='width:128px;height:128px;'/>">
                        &nbsp;<b>אהרון קליין</b>
                        השתבץ לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת לילה ב-19/04/2026)
                    </li>
                    <li class="historyData">
                        <span class="txtXSmall">[18/04/2026 21:00]</span>
                        &nbsp;&nbsp;<b>אודליה דניאלי</b>
                        השתבצה לשיבוץ <b>ירושלים אט״ן ונט״ן</b>
                        (משמרת בוקר ב-24/04/2026)
                    </li>
                </ul>
            </div>
</div>
<!-- START Do not modify -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js" defer></script>
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript" language="javascript">
    var scroller = new scroller({
        id: 'dvScroller',
        mode: 'auto',
        pause: 0,
        navpanel: {
            show: false,
            cancelauto: false
        },
        animatespeed: 4000 //<--no comma following last option

    });
</script>
<script type="text/javascript">
    try {
        var pageTracker = _gat._getTracker("UA-12938643-1");
        pageTracker._trackPageview();
    } catch (err) {}
</script>
<div id="dataInfor" style="z-index: 105; left: 200px; display: none;" class="footerLogo">
    (C) 2011 - Elad Nahor (C) 2011 - Elad Nahor (C) 2011 - Elad Nahor (C) 2011 - Elad Nahor (C) 2011 - Elad Nahor (C) 2011 - Elad Nahor <a href="http://www.nahor.net">http://www.nahor.net</a>
</div>
<!-- END Do not modify -->
<!-- Quick Message Panel -->
<div class="darkenBackgroundAdvanced invisible" id="dvQuickMsg">
    <br/>
    <br/>
    <br/>
    <div class="roundCorners center">
        <div style="background: #dadada; width: 600px; height: 420px;" class="center">
            <iframe src="" id="iframeQuickMsg" frameborder="0" style="width: 600px; height: 420px; z-index: 999;"></iframe>
            <a onclick="quickMessageHide();" style="position: relative; bottom: 45px;">
                <img src="../images/closeIcon.png" onmouseover="this.src='../images/closeIconHover.png';" onmouseout="this.src='../images/closeIcon.png';"/>
            </a>
            <img id="quickMsgLoadDiv" src="/images/loading.gif" style="position: relative; bottom: 45px;"/>
        </div>
    </div>
</div>
<div class="bottomPanelFooter"></div>
<!-- Bottom Bar -->
<div id="footpanel" class="noPrint">
    <ul id="mainpanel">
        <li>
            <a href="./Welcome.aspx" class="home">
                <small>עמוד ראשי</small>
            </a>
        </li>
        <li>
            <a href="./Contact.aspx" class="contactButton">
                <small>פניות למשרד מתנדבים</small>
            </a>
        </li>
        <li></li>
        <li>
            <a href="./UpdateDetails.aspx" class="updateDetailsButton">
                <small>עדכון פרטים</small>
            </a>
        </li>
        <li></li>
        <li></li>
        <li>
            <a href="./Shibutz.aspx" class="shibutzButton">
                <small>שיבוצים</small>
            </a>
        </li>
        <li>
            <a href="./Avtahot.aspx" class="avtahotButton">
                <small>אבטחות</small>
            </a>
        </li>
        <li>
            <a href="./Courses.aspx" class="coursesButton">
                <small>השתלמויות</small>
            </a>
        </li>
        <li>
            <a href="./TestsResults.aspx" class="testsButton">
                <small>תוצאות מבחנים</small>
            </a>
        </li>
        <li id="alertpanel">
            <a href="#" class="alerts">
                <span class="notificationCount lfloat" id="bb-alerts-num" style="display: none;">0</span>
                הודעות ועדכונים
            </a>
            <div class="subpanel">
                <h3>
                    <span>&ndash;</span>
                    הודעות ועדכונים
                </h3>
                <div id="alertSubPanelUnread" class="invisible unreadSubpanel center"></div>
                <ul id="bb-alerts-ul">
                    <li class="view">
                        <a href="#">אין הודעות חדשות</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="chatpanel">
            <a href="#" class="chat">
                מחוברים (<strong id="bb-online-num">0</strong>
                )
            </a>
            <div class="subpanel">
                <h3>
                    <span>&ndash;</span>
                    מי מחובר
                </h3>
                <ul id="bb-online-ul"></ul>
            </div>
        </li>
        <li id="mailButton">
            <span class="notificationCountMsg lfloat roundCorners" id="mailButton-unread-num" style="display: none;">0</span>
            <a href="./MessagesFolder.aspx" class="mailButton">
                <small>תיבת
                    דואר</small>
            </a>
        </li>
        <li>
            <a href="./KraHatom.aspx" class="kraHatomButton">
                <small>היסטוריית קרא וחתום</small>
            </a>
        </li>
        <li>
            <a href="./Officials.aspx" class="officialsButton">
                <small>בעלי תפקידים</small>
            </a>
        </li>
        <li>
            <a href="./Forms.aspx" class="formsButton">
                <small>טפסים שימושיים</small>
            </a>
        </li>
        <li>
            <a href="./Faq.aspx" class="helpButton">
                <small>שאלות נפוצות</small>
            </a>
        </li>
    </ul>
</div>
<div id="ctl00_updpanelMessages">
    <input type="hidden" name="ctl00$hdnMasterUserMsgsRemove" id="hdnMasterUserMsgsRemove"/>
    <input type="hidden" name="ctl00$hdnMasterUsersReload" id="hdnMasterUsersReload"/>
    <input type="hidden" id="hdnMasterUsersList"/>
    <input type="hidden" id="hdnMsgsList"/>
    <input type="hidden" id="hdnUnreadMsgs"/>
</div>
<div id="bottomPanelFooter" class="clearFloat">&nbsp;</div>
<!-- START Do not modify -->
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));

    try {
        var pageTracker = _gat._getTracker("UA-12938643-1");
        pageTracker._trackPageview();
    } catch (err) {}
</script>
<div id="dataInfor" style="z-index: 105; left: 200px; display: none;" class="footerLogo">
    (C) 2012 - Elad Nahor <a href="http://www.nahor.net">http://www.nahor.net</a>
    <br/>
</div>
<!-- END Do not modify -->
<script type="text/javascript">
    //<![CDATA[
    $('#ulBirthdays li img').hoverbox();
    $('#dvOneLine li img').hoverbox();
    $('#dvHistory li img').hoverbox();
    $(hdnMsgsList).val('[{"mId":"345","mTitle":"שאגת ארי בדיקת זמינות חובשים/בוגרים מרחבי","mMsg":"https://\\u0026#102;orms.gle/cTKee6ZttyDEi9gJA"}]');
    $(hdnUnreadMsgs).val(0);
    $(hdnUsersList).val('[{"Name":"יצחק מזרחי","Gold":true,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p8939_20191029203441.jpg"},{"Name":"אביב נורני","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"אהרון היימן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12135_20230502090435.jpg"},{"Name":"אוריה זגמן","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p6279_20190321001719.jpg"},{"Name":"אוריין לוי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p14028_20250109160239.jpg"},{"Name":"אלימלך מסלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"אליסף פינץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"אלישבע פריד","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"הוד בנאלי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"זאב טלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12740_20240310010445.jpg"},{"Name":"חנה דשבסקי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"חנוך גרוס","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"חסד דנציגר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"טליה פישר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יוסי פנט","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"יחיאל שטרן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p14481_20250828081246.jpg"},{"Name":"יצחק וינר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יצחק ליכטנשטיין","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11411_20220920092130.jpg"},{"Name":"לאה מליק","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"מגד אבורמילה","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"מוריה קניוטו","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מני שטינמץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13925_20251027081715.jpg"},{"Name":"נאור סקר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p552_20230505143807.jpg"},{"Name":"נהוראי לוינזון","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13955_20250119194445.jpg"},{"Name":"נועה תירם","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"ניתאי לוי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"נתי הלוי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11147_20240321095559.jpg"},{"Name":"נתנאל הלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12812_20240203194131.jpg"},{"Name":"עידו חן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"עלמה אילן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"רועי אמיר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12658_20250914122411.jpg"},{"Name":"רחלגאולה בוזגלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"רעות ציפמן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שילת אוחנה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p14671_20251124190648.png"},{"Name":"שירה עוזרי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שמחה שירר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"שמעון הורוויץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p10205_20211106182019.jpg"},{"Name":"שמעון שטיינגרט","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11433_20221212122022.jpg"},{"Name":"תהל שליידר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תמר לוריא","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תפארת מורי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13283_20240723184611.jpg"}]');
    //]]>
</script>
</form><script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8c78df7c7c0f484497ecbca7046644da1771523124516" integrity="sha512-8DS7rgIrAmghBFwoOTujcf6D9rXvH8xm8JQ1Ja01h9QX8EzXldiszufYa4IFfKdLUKTTrnSFXLDkUEOTrZQ8Qg==" data-cf-beacon='{"version":"2024.11.0","token":"6cdd2ec92a0f4f5a9b39eeac3526e60b","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
</body></html>
