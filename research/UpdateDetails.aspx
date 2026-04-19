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
        <title>מערכת מתנדבי מרחב ירושלים - עדכון פרטים
</title>
        <style type="text/css">
            span.bold {
                padding-left: 20px;
                min-width: 300px;
                color: Green;
            }

            div.blueBox, div.orangeBox {
                width: 350px;
            }

            .picSize {
                height: 128px;
                width: 128px;
                border: 1px solid black;
            }

            .picSize img {
                height: 128px;
                width: 128px;
            }

            .cardPicSize {
                margin: 0px;
                padding: 0px;
                height: 96px;
                width: 96px;
                border: 1px solid transparent;
            }

            .cardPicSize img {
                height: 96px;
                width: 96px;
            }

            .leftLabel {
                font-weight: bold;
                color: Green;
                width: 85px;
                float: right;
                text-align: right;
                padding-right: 5px;
            }

            .updateDiv {
                border: 3px solid gray;
                width: 100% !important;
            }

            .subjectTitle {
                font-size: large;
                color: #37487B;
            }

            .fixedWidthLabel {
                display: inline-block;
                width: 100px !important;
                min-width: 100px !important;
            }

            .details li {
                padding-bottom: 7px;
            }
        </style>
        <script type="text/javascript" language="javascript">
            function showPwBox() {
                $("#dvPWBox").show(300);
            }

            function hideForceMsg() {
                $("#dvForce").hide();
            }

            function hideErrorMsg() {
                document.getElementById("pnlError").style.display = 'none';
            }

            function ValidateEULA(sender, args) {
                if (document.getElementById("ctl00_ContentPlaceHolder1_cbAgreeEULA").checked == true) {
                    args.IsValid = true;
                } else {
                    args.IsValid = false;
                }
            }
        </script>
    </head>
    <body class="siteBody">
        <form name="aspnetForm" method="post" action="./UpdateDetails.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm">
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
            <script src="/ScriptResource.axd?d=nv7asgRUU0tRmHNR2D6t1DT1nS81rChLYJiqDy9qvKBVSqKRjkQAulB2VtYKpm4BzsPQ7WOeUr6tuYsq527RHjadrnA8pGtSWOAEeSXTPJinMNnJQIZSEZqFgVqnG1t3N2f06YvwBvVzxNhuqs0a-g2&amp;t=fffffffff2f92c66" type="text/javascript"></script>
            <script src="/ScriptResource.axd?d=NJmAwtEo3Ipnlaxl6CMhvn-JhsDljJq1VBcCKboX-V2_xAW4YYkWSX68kGejQiEFxuhsMpp5bS-xqjJy-Fes0e-BamtcvlMJxlonOZzWKE6gqiBbPycwUfyTPLov7eNjfA6u8aYngTRX6SqgKKJCQBXkJuwcTPKJXfaGA5IUTB41&amp;t=32e5dfca" type="text/javascript"></script>
            <script src="/ScriptResource.axd?d=dwY9oWetJoJoVpgL6Zq8OHIyhZnbL7LGSNGibImfFp9XGobhNOYQbUjoI_JZWTEYh6VoeJNG4WIcHPOW17B7izt6-RAZOAMsl9tsmZzVriScmYr-SijbIbQGVkMyTFM3e-H2uejjxdz_FeVkohK2-5-QQ0mGQ50DUjR1EFmIVbo1&amp;t=32e5dfca" type="text/javascript"></script>
            <script type="text/javascript">
                //<![CDATA[
                function WebForm_OnSubmit() {
                    if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false)
                        return false;
                    return true;
                }
                //]]>
            </script>
            <div>
                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="F9FECB3E"/>
                <input type="hidden" name="__PREVIOUSPAGE" id="__PREVIOUSPAGE" value="pnIHZUNk37BU_SbRLd1ymKWJBGB5vLhuGUu4QMxAXSL5sstpX05NaDjR6SdPmnw6bZ09qjKGPlmg95CjhED-6PTL1uLfPnAebYNnTYsIQTE1"/>
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="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"/>
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
                <a href="/cdn-cgi/l/email-protection#b4d0d5c2ddd0f4d0d8d0d79ad7db9addd8">
                    <span class="__cf_email__" data-cfemail="086c697e616c486c646c6b266b67266164">[email &#160;protected]</span>
                </a>
                <b>שימו לב:</b>
                בבעיות בנושא האתר יש לפתוח פניה <b>(המספר הינו לתמיכה טכנית בלבד. ש לשלוח וואטסאפ ולא להתקשר. לכל נושא אחר נא התקשרו למשרד מתנדבים.)</b>
                ]
        
            </div>
            <div class="clearFloat">&nbsp;</div>
            <div class="RTLDiv rfloat" style="width: 50%; margin-right: 15%;">
                <h1 class="center">עדכון פרטים</h1>
                <div id="ctl00_ContentPlaceHolder1_pnlStep1" class="RTLDiv updateDiv roundCorners orangeBox">
                    <div class="center RTLDiv">
                        <h3>
                            שלב:<span class="circleNumSelected">1</span>
                            <span class="circleNum">2</span>
                            <span class="circleNum">3</span>
                            <span class="circleNum">4</span>
                        </h3>
                        <hr/>
                    </div>
                    <br/>
                    <div class="RTLDiv" style="height: 100%; margin-right: 3px;">
                        <div class="subjectTitle">מידע כללי
                </div>
                        <ul class="details">
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label6" class="bold">מספר סלולרי:</span>
                                <input name="ctl00$ContentPlaceHolder1$tbCell" type="text" value="6677207" id="ctl00_ContentPlaceHolder1_tbCell" disabled="disabled" style="width:90px;"/>
                                <select name="ctl00$ContentPlaceHolder1$ddlCellCode" id="ctl00_ContentPlaceHolder1_ddlCellCode" disabled="disabled" style="width:65px;">
                                    <option value="050">050</option>
                                    <option value="051">051</option>
                                    <option selected="selected" value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                    <option value="056">056</option>
                                    <option value="057">057</option>
                                    <option value="058">058</option>
                                    <option value="059">059</option>
                                </select>
                                <input type="submit" name="ctl00$ContentPlaceHolder1$btnChangePhone" value="החלף מספר" id="ctl00_ContentPlaceHolder1_btnChangePhone"/>
                                <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator8" style="color:Red;visibility:hidden;">*</span>
                                <span id="ctl00_ContentPlaceHolder1_RangeValidator1" style="color:Red;visibility:hidden;">*</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label5" class="bold">כתובת אימייל:</span>
                                <input name="ctl00$ContentPlaceHolder1$tbEmail" type="text" value="shevi.kr@gmail.com" id="ctl00_ContentPlaceHolder1_tbEmail" class="stretchTB LTR"/>
                                <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator4" style="color:Red;visibility:hidden;">*</span>
                                <span id="ctl00_ContentPlaceHolder1_RegularExpressionValidator1" style="color:Red;visibility:hidden;">לא תקין</span>
                                <br/>
                            </li>
                            <li>
                                <span class="txtSmall bold" style="color: #000;">המידע הבא משמש לזיהוי, קבלת ציוני
                        מבחנים, דמי חבר וכו</span>
                                <br/>
                                <span id="ctl00_ContentPlaceHolder1_Label10" class="bold">תעודת זהות:</span>
                                <input name="ctl00$ContentPlaceHolder1$tbID" type="text" value="203692694" maxlength="12" id="ctl00_ContentPlaceHolder1_tbID" class="stretchTB"/>
                                <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator5" style="color:Red;visibility:hidden;">*</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label11" class="bold">מין:</span>
                                <table id="ctl00_ContentPlaceHolder1_rblSex" border="0">
                                    <tr>
                                        <td>
                                            <input id="ctl00_ContentPlaceHolder1_rblSex_0" type="radio" name="ctl00$ContentPlaceHolder1$rblSex" value="1"/>
                                            <label for="ctl00_ContentPlaceHolder1_rblSex_0">זכר</label>
                                        </td>
                                        <td>
                                            <input id="ctl00_ContentPlaceHolder1_rblSex_1" type="radio" name="ctl00$ContentPlaceHolder1$rblSex" value="0" checked="checked"/>
                                            <label for="ctl00_ContentPlaceHolder1_rblSex_1">נקבה</label>
                                        </td>
                                    </tr>
                                </table>
                                <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator6" style="color:Red;visibility:hidden;">לא הוזן מין</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label12" class="bold">תאריך לידה:</span>
                                <select name="ctl00$ContentPlaceHolder1$ddlYear" id="ctl00_ContentPlaceHolder1_ddlYear">
                                    <option value="2026">2026</option>
                                    <option value="2025">2025</option>
                                    <option value="2024">2024</option>
                                    <option value="2023">2023</option>
                                    <option value="2022">2022</option>
                                    <option value="2021">2021</option>
                                    <option value="2020">2020</option>
                                    <option value="2019">2019</option>
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                    <option value="2007">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option selected="selected" value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                    <option value="1958">1958</option>
                                    <option value="1957">1957</option>
                                    <option value="1956">1956</option>
                                    <option value="1955">1955</option>
                                    <option value="1954">1954</option>
                                    <option value="1953">1953</option>
                                    <option value="1952">1952</option>
                                    <option value="1951">1951</option>
                                    <option value="1950">1950</option>
                                    <option value="1949">1949</option>
                                    <option value="1948">1948</option>
                                    <option value="1947">1947</option>
                                    <option value="1946">1946</option>
                                    <option value="1945">1945</option>
                                    <option value="1944">1944</option>
                                    <option value="1943">1943</option>
                                    <option value="1942">1942</option>
                                    <option value="1941">1941</option>
                                    <option value="1940">1940</option>
                                    <option value="1939">1939</option>
                                    <option value="1938">1938</option>
                                    <option value="1937">1937</option>
                                    <option value="1936">1936</option>
                                    <option value="1935">1935</option>
                                    <option value="1934">1934</option>
                                    <option value="1933">1933</option>
                                    <option value="1932">1932</option>
                                    <option value="1931">1931</option>
                                    <option value="1930">1930</option>
                                    <option value="1929">1929</option>
                                    <option value="1928">1928</option>
                                    <option value="1927">1927</option>
                                </select>
                                <select name="ctl00$ContentPlaceHolder1$ddlMonth" id="ctl00_ContentPlaceHolder1_ddlMonth">
                                    <option value="0"></option>
                                    <option value="1">1 - ינואר</option>
                                    <option value="2">2 - פברואר</option>
                                    <option value="3">3 - מרץ</option>
                                    <option selected="selected" value="4">4 - אפריל</option>
                                    <option value="5">5 - מאי</option>
                                    <option value="6">6 - יוני</option>
                                    <option value="7">7 - יולי</option>
                                    <option value="8">8 - אוגוסט</option>
                                    <option value="9">9 - ספטמבר</option>
                                    <option value="10">10 - אוקטובר</option>
                                    <option value="11">11 - נובמבר</option>
                                    <option value="12">12 - דצמבר</option>
                                </select>
                                <select name="ctl00$ContentPlaceHolder1$ddlDay" id="ctl00_ContentPlaceHolder1_ddlDay">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option selected="selected" value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <span id="ctl00_ContentPlaceHolder1_RangeValidator3" style="color:Red;visibility:hidden;">*</span>
                                <span id="ctl00_ContentPlaceHolder1_RangeValidator4" style="color:Red;visibility:hidden;">שנת לידה לא חוקית</span>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label13" class="bold">כתובת:</span>
                                <br/>
                                <span class="txtSmall bold" style="color: #000; width: 30px; margin-right: 10px; padding-left: 0px;">רחוב</span>
                                <input name="ctl00$ContentPlaceHolder1$tbAddress" type="text" value="מר עוקבא" maxlength="50" id="ctl00_ContentPlaceHolder1_tbAddress"/>
                                <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator9" style="color:Red;visibility:hidden;">*</span>
                                <span class="txtSmall bold" style="color: #000;">מספר</span>
                                <input name="ctl00$ContentPlaceHolder1$tbAddressNum" type="text" value="2" maxlength="10" id="ctl00_ContentPlaceHolder1_tbAddressNum" style="width: 30px;"/>
                                <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator7" style="color:Red;visibility:hidden;">*</span>
                                <span class="txtSmall bold" style="color: #000; width: 30px; margin-right: 10px; padding-left: 8px;">עיר</span>
                                <select name="ctl00$ContentPlaceHolder1$ddlCities" id="ctl00_ContentPlaceHolder1_ddlCities" style="width: 150px;">
                                    <option value="1">אבו גוש</option>
                                    <option value="2">אבו סנאן</option>
                                    <option value="3">אבטין</option>
                                    <option value="4">אבטליון</option>
                                    <option value="5">אביאל</option>
                                    <option value="6">אביבים</option>
                                    <option value="7">אביגדור</option>
                                    <option value="8">אביחיל</option>
                                    <option value="9">אביטל</option>
                                    <option value="10">אביעזר</option>
                                    <option value="11">אבירים</option>
                                    <option value="12">אבן יהודה</option>
                                    <option value="13">אבן מנחם</option>
                                    <option value="14">אבן ספיר</option>
                                    <option value="15">אבן שמואל</option>
                                    <option value="16">אבני איתן</option>
                                    <option value="17">אבני חפץ</option>
                                    <option value="18">אבנת</option>
                                    <option value="19">אבשלום</option>
                                    <option value="20">אדורה</option>
                                    <option value="21">אדירים</option>
                                    <option value="22">אדמית</option>
                                    <option value="23">אדרת</option>
                                    <option value="24">אודים</option>
                                    <option value="25">אודם</option>
                                    <option value="26">אוהד</option>
                                    <option value="27">אום אל-פחם</option>
                                    <option value="28">אום אל-קוטוף</option>
                                    <option value="29">אום בטין</option>
                                    <option value="30">אומן</option>
                                    <option value="31">אומץ</option>
                                    <option value="32">אופקים</option>
                                    <option value="33">אור הגנוז</option>
                                    <option value="34">אור הנר</option>
                                    <option value="35">אור יהודה</option>
                                    <option value="36">אור עקיבא</option>
                                    <option value="37">אורה</option>
                                    <option value="38">אורון</option>
                                    <option value="39">אורות</option>
                                    <option value="40">אורטל</option>
                                    <option value="41">אורים</option>
                                    <option value="42">אורנים</option>
                                    <option value="43">אורנית</option>
                                    <option value="44">אושה</option>
                                    <option value="45">אזור</option>
                                    <option value="46">אחווה</option>
                                    <option value="47">אחוזם</option>
                                    <option value="48">אחוזת ברק</option>
                                    <option value="49">אחיהוד</option>
                                    <option value="50">אחיטוב</option>
                                    <option value="51">אחיסמך</option>
                                    <option value="52">אחיעזר</option>
                                    <option value="53">איבים</option>
                                    <option value="54">אייל</option>
                                    <option value="55">איילת השחר</option>
                                    <option value="56">אילון</option>
                                    <option value="57">אילון תבור</option>
                                    <option value="58">אילות</option>
                                    <option value="59">אילנייה</option>
                                    <option value="60">אילת</option>
                                    <option value="61">איתמר</option>
                                    <option value="62">איתן</option>
                                    <option value="63">איתנים</option>
                                    <option value="64">אכסאל</option>
                                    <option value="65">אל -עזי</option>
                                    <option value="66">אל -עריאן</option>
                                    <option value="67">אל -רום</option>
                                    <option value="68">אל סייד</option>
                                    <option value="69">אלומה</option>
                                    <option value="70">אלומות</option>
                                    <option value="71">אלון הגליל</option>
                                    <option value="72">אלון מורה</option>
                                    <option value="73">אלון שבות</option>
                                    <option value="74">אלוני אבא</option>
                                    <option value="75">אלוני הבשן</option>
                                    <option value="76">אלוני יצחק</option>
                                    <option value="77">אלונים</option>
                                    <option value="78">אלי-עד</option>
                                    <option value="79">אליכין</option>
                                    <option value="80">אליפז</option>
                                    <option value="81">אליפלט</option>
                                    <option value="82">אליקים</option>
                                    <option value="83">אלישיב</option>
                                    <option value="84">אלישמע</option>
                                    <option value="85">אלמגור</option>
                                    <option value="86">אלמוג</option>
                                    <option value="87">אלעד</option>
                                    <option value="88">אלעזר</option>
                                    <option value="89">אלפי מנשה</option>
                                    <option value="90">אלקוש</option>
                                    <option value="91">אלקנה</option>
                                    <option value="92">אמונים</option>
                                    <option value="93">אמירים</option>
                                    <option value="94">אמנון</option>
                                    <option value="95">אמציה</option>
                                    <option value="96">אניעם</option>
                                    <option value="97">אספר</option>
                                    <option value="98">אעבלין</option>
                                    <option value="99">אפיק</option>
                                    <option value="100">אפיקים</option>
                                    <option value="101">אפק</option>
                                    <option value="102">אפרתה</option>
                                    <option value="103">ארבל</option>
                                    <option value="104">ארגמן</option>
                                    <option value="105">ארז</option>
                                    <option value="106">אריאל</option>
                                    <option value="107">ארסוף</option>
                                    <option value="108">אשבול</option>
                                    <option value="109">אשבל</option>
                                    <option value="110">אשדוד</option>
                                    <option value="111">אשדות יעקב (איחוד)</option>
                                    <option value="112">אשדות יעקב (מאוחד)</option>
                                    <option value="113">אשחר</option>
                                    <option value="114">אשכולות</option>
                                    <option value="115">אשל הנשיא</option>
                                    <option value="116">אשלים</option>
                                    <option value="117">אשקלון</option>
                                    <option value="118">אשרת</option>
                                    <option value="119">אשתאול</option>
                                    <option value="120">באקה-ג &#39;ת</option>
                                    <option value="121">באר אורה</option>
                                    <option value="122">באר טוביה</option>
                                    <option value="123">באר יעקב</option>
                                    <option value="124">באר מילכה</option>
                                    <option value="125">באר שבע</option>
                                    <option value="126">בארות יצחק</option>
                                    <option value="127">בארותיים</option>
                                    <option value="128">בארי</option>
                                    <option value="129">בוסתן הגליל</option>
                                    <option value="130">בועיינה-נוג &#39;ידאת</option>
                                    <option value="131">בוקעאתא</option>
                                    <option value="132">בורגתה</option>
                                    <option value="133">בחן</option>
                                    <option value="134">בטחה</option>
                                    <option value="135">ביצרון</option>
                                    <option value="136">ביר אל-מכסור</option>
                                    <option value="137">ביר הדאג &#39;</option>
                                    <option value="138">בירייה</option>
                                    <option value="139">בית אורן</option>
                                    <option value="140">בית אל</option>
                                    <option value="141">בית אלעזרי</option>
                                    <option value="142">בית אלפא</option>
                                    <option value="143">בית אריה</option>
                                    <option value="144">בית ברל</option>
                                    <option value="145">בית ג &#39;ן</option>
                                    <option value="146">בית גוברין</option>
                                    <option value="147">בית גמליאל</option>
                                    <option value="148">בית דגן</option>
                                    <option value="149">בית הגדי</option>
                                    <option value="150">בית הלוי</option>
                                    <option value="151">בית הלל</option>
                                    <option value="152">בית העמק</option>
                                    <option value="153">בית הערבה</option>
                                    <option value="154">בית השיטה</option>
                                    <option value="155">בית זיד</option>
                                    <option value="156">בית זית</option>
                                    <option value="157">בית זרע</option>
                                    <option value="158">בית חולים פוריה</option>
                                    <option value="159">בית חורון</option>
                                    <option value="160">בית חירות</option>
                                    <option value="161">בית חלקיה</option>
                                    <option value="162">בית חנן</option>
                                    <option value="163">בית חנניה</option>
                                    <option value="164">בית חשמונאי</option>
                                    <option value="165">בית יהושע</option>
                                    <option value="166">בית יוסף</option>
                                    <option value="167">בית ינאי</option>
                                    <option value="168">בית יצחק-שער חפר</option>
                                    <option value="169">בית לחם הגלילית</option>
                                    <option value="170">בית מאיר</option>
                                    <option value="171">בית נחמיה</option>
                                    <option value="172">בית ניר</option>
                                    <option value="173">בית נקופה</option>
                                    <option value="174">בית עובד</option>
                                    <option value="175">בית עוזיאל</option>
                                    <option value="176">בית עזרא</option>
                                    <option value="177">בית עריף</option>
                                    <option value="178">בית צבי</option>
                                    <option value="179">בית קמה</option>
                                    <option value="180">בית קשת</option>
                                    <option value="181">בית רבן</option>
                                    <option value="182">בית רימון</option>
                                    <option value="183">בית שאן</option>
                                    <option selected="selected" value="184">בית שמש</option>
                                    <option value="185">בית שערים</option>
                                    <option value="186">בית שקמה</option>
                                    <option value="187">ביתן אהרן</option>
                                    <option value="188">ביתר עילית</option>
                                    <option value="189">בלפוריה</option>
                                    <option value="190">בן זכאי</option>
                                    <option value="191">בן עמי</option>
                                    <option value="192">בן שמן (כפר נוער)</option>
                                    <option value="193">בן שמן (מושב)</option>
                                    <option value="194">בני ברק</option>
                                    <option value="195">בני דרום</option>
                                    <option value="196">בני דרור</option>
                                    <option value="197">בני יהודה</option>
                                    <option value="198">בני עטרות</option>
                                    <option value="199">בני עי &quot;ש</option>
                                    <option value="200">בני ציון</option>
                                    <option value="201">בני ראם</option>
                                    <option value="202">בניה</option>
                                    <option value="203">בנימינה-גבעת עדה</option>
                                    <option value="204">בסמ &quot;ה</option>
                                    <option value="205">בסמת טבעון</option>
                                    <option value="206">בענה</option>
                                    <option value="207">בצרה</option>
                                    <option value="208">בצת</option>
                                    <option value="209">בקוע</option>
                                    <option value="210">בקעות</option>
                                    <option value="211">בר גיורא</option>
                                    <option value="212">בר יוחאי</option>
                                    <option value="213">ברור חיל</option>
                                    <option value="214">ברוש</option>
                                    <option value="215">ברכה</option>
                                    <option value="216">ברכיה</option>
                                    <option value="217">ברעם</option>
                                    <option value="218">ברק</option>
                                    <option value="219">ברקאי</option>
                                    <option value="220">ברקן</option>
                                    <option value="221">ברקת</option>
                                    <option value="222">בת הדר</option>
                                    <option value="223">בת חן</option>
                                    <option value="224">בת חפר</option>
                                    <option value="225">בת ים</option>
                                    <option value="226">בת עין</option>
                                    <option value="227">בת שלמה</option>
                                    <option value="228">ג &#39;דיידה-מכר</option>
                                    <option value="229">ג &#39;ולס</option>
                                    <option value="230">ג &#39;לג &#39;וליה</option>
                                    <option value="231">ג &#39;סר א-זרקא</option>
                                    <option value="232">ג &#39;ש (גוש חלב)</option>
                                    <option value="233">גאולי תימן</option>
                                    <option value="234">גאולים</option>
                                    <option value="235">גאליה</option>
                                    <option value="236">גבולות</option>
                                    <option value="237">גבים</option>
                                    <option value="238">גבע</option>
                                    <option value="239">גבע בנימין</option>
                                    <option value="240">גבע כרמל</option>
                                    <option value="241">גבעולים</option>
                                    <option value="242">גבעון החדשה</option>
                                    <option value="243">גבעות בר</option>
                                    <option value="244">גבעת אבני</option>
                                    <option value="245">גבעת אלה</option>
                                    <option value="246">גבעת ברנר</option>
                                    <option value="247">גבעת השלושה</option>
                                    <option value="248">גבעת זאב</option>
                                    <option value="249">גבעת ח &quot;ן</option>
                                    <option value="250">גבעת חביבה</option>
                                    <option value="251">גבעת חיים (איחוד)</option>
                                    <option value="252">גבעת חיים (מאוחד)</option>
                                    <option value="253">גבעת יואב</option>
                                    <option value="254">גבעת יערים</option>
                                    <option value="255">גבעת ישעיהו</option>
                                    <option value="256">גבעת כ &quot;ח</option>
                                    <option value="257">גבעת ניל &quot;י</option>
                                    <option value="258">גבעת עוז</option>
                                    <option value="259">גבעת שמואל</option>
                                    <option value="260">גבעת שמש</option>
                                    <option value="261">גבעת שפירא</option>
                                    <option value="262">גבעתי</option>
                                    <option value="263">גבעתיים</option>
                                    <option value="264">גברעם</option>
                                    <option value="265">גבת</option>
                                    <option value="266">גדות</option>
                                    <option value="267">גדיש</option>
                                    <option value="268">גדעונה</option>
                                    <option value="269">גדרה</option>
                                    <option value="270">גונן</option>
                                    <option value="271">גורן</option>
                                    <option value="272">גורנות הגליל</option>
                                    <option value="273">גזית</option>
                                    <option value="274">גזר</option>
                                    <option value="275">גיאה</option>
                                    <option value="276">גיבתון</option>
                                    <option value="277">גיזו</option>
                                    <option value="278">גילון</option>
                                    <option value="279">גילת</option>
                                    <option value="280">גינוסר</option>
                                    <option value="281">גיניגר</option>
                                    <option value="282">גינתון</option>
                                    <option value="283">גיתה</option>
                                    <option value="284">גיתית</option>
                                    <option value="285">גלאון</option>
                                    <option value="286">גלגל</option>
                                    <option value="287">גליל ים</option>
                                    <option value="288">גליל עליון מז של &quot;ש</option>
                                    <option value="289">גלעד (אבן יצחק)</option>
                                    <option value="290">גמ &quot;ל מחוז דרום</option>
                                    <option value="291">גמזו</option>
                                    <option value="292">גן הדרום</option>
                                    <option value="293">גן השומרון</option>
                                    <option value="294">גן חיים</option>
                                    <option value="295">גן יאשיה</option>
                                    <option value="296">גן יבנה</option>
                                    <option value="297">גן נר</option>
                                    <option value="298">גן שורק</option>
                                    <option value="299">גן שלמה</option>
                                    <option value="300">גן שמואל</option>
                                    <option value="301">גנות</option>
                                    <option value="302">גנות הדר</option>
                                    <option value="303">גני הדר</option>
                                    <option value="304">גני יוחנן</option>
                                    <option value="305">גני עם</option>
                                    <option value="306">גני תקווה</option>
                                    <option value="307">געש</option>
                                    <option value="308">געתון</option>
                                    <option value="309">גפן</option>
                                    <option value="310">גרופית</option>
                                    <option value="311">גשור</option>
                                    <option value="312">גשר</option>
                                    <option value="313">גשר הזיו</option>
                                    <option value="314">גת (קיבוץ)</option>
                                    <option value="315">גת רימון</option>
                                    <option value="316">דאלית אל-כרמל</option>
                                    <option value="317">דבורה</option>
                                    <option value="318">דבורייה</option>
                                    <option value="319">דבירה</option>
                                    <option value="320">דברת</option>
                                    <option value="321">דגניה א &#39;</option>
                                    <option value="322">דגניה ב &#39;</option>
                                    <option value="323">דוב &quot;ב</option>
                                    <option value="324">דולב</option>
                                    <option value="325">דור</option>
                                    <option value="326">דורות</option>
                                    <option value="327">דחי</option>
                                    <option value="328">דייר אל-אסד</option>
                                    <option value="329">דייר חנא</option>
                                    <option value="330">דייר ראפאת</option>
                                    <option value="331">דימונה</option>
                                    <option value="332">דישון</option>
                                    <option value="333">דלייה</option>
                                    <option value="334">דלתון</option>
                                    <option value="335">דמיידה</option>
                                    <option value="336">דן</option>
                                    <option value="337">דפנה</option>
                                    <option value="338">דקל</option>
                                    <option value="339">דרום השרון של &quot;ש</option>
                                    <option value="340">דרום יהודה</option>
                                    <option value="341">דריג &#39;את</option>
                                    <option value="342">האון</option>
                                    <option value="343">הבונים</option>
                                    <option value="344">הגושרים</option>
                                    <option value="345">הדר עם</option>
                                    <option value="346">הוד השרון</option>
                                    <option value="347">הודיות</option>
                                    <option value="348">הודייה</option>
                                    <option value="349">הושעיה</option>
                                    <option value="350">הזורע</option>
                                    <option value="351">הזורעים</option>
                                    <option value="352">החותרים</option>
                                    <option value="353">היוגב</option>
                                    <option value="354">הילה</option>
                                    <option value="355">המעפיל</option>
                                    <option value="356">המרכז למחקר-נחל שורק</option>
                                    <option value="357">הסוללים</option>
                                    <option value="358">העוגן</option>
                                    <option value="359">הר אדר</option>
                                    <option value="360">הר אלכסנדר של &quot;ש</option>
                                    <option value="361">הר גילה</option>
                                    <option value="362">הר עמשא</option>
                                    <option value="363">הראל</option>
                                    <option value="364">הרדוף</option>
                                    <option value="365">הרי יהודה של &quot;ש</option>
                                    <option value="366">הרי נצרת תירען</option>
                                    <option value="367">הרצלייה</option>
                                    <option value="368">הררית</option>
                                    <option value="369">השומרון</option>
                                    <option value="370">ורד יריחו</option>
                                    <option value="371">ורדון</option>
                                    <option value="372">זבדיאל</option>
                                    <option value="373">זוהר</option>
                                    <option value="374">זיקים</option>
                                    <option value="375">זיתן</option>
                                    <option value="376">זכרון יעקב</option>
                                    <option value="377">זכריה</option>
                                    <option value="378">זמר</option>
                                    <option value="379">זמרת</option>
                                    <option value="380">זנוח</option>
                                    <option value="381">זרועה</option>
                                    <option value="382">זרזיר</option>
                                    <option value="383">זרחיה</option>
                                    <option value="384">ח &#39;ואלד</option>
                                    <option value="385">חבצלת השרון</option>
                                    <option value="386">חבר</option>
                                    <option value="387">חגור</option>
                                    <option value="388">חגי</option>
                                    <option value="389">חגלה</option>
                                    <option value="390">חד-נס</option>
                                    <option value="391">חדיד</option>
                                    <option value="392">חדרה</option>
                                    <option value="393">חולדה</option>
                                    <option value="394">חולון</option>
                                    <option value="395">חולית</option>
                                    <option value="396">חולתה</option>
                                    <option value="397">חוסן</option>
                                    <option value="398">חוסנייה</option>
                                    <option value="399">חופית</option>
                                    <option value="400">חוקוק</option>
                                    <option value="401">חורה</option>
                                    <option value="402">חורפיש</option>
                                    <option value="403">חורשים</option>
                                    <option value="404">חזון</option>
                                    <option value="405">חיבת ציון</option>
                                    <option value="406">חיננית</option>
                                    <option value="407">חיפה</option>
                                    <option value="408">חירות</option>
                                    <option value="409">חלוץ</option>
                                    <option value="410">חלמיש</option>
                                    <option value="411">חלץ</option>
                                    <option value="412">חמאם</option>
                                    <option value="413">חמד</option>
                                    <option value="414">חמדיה</option>
                                    <option value="415">חמדת</option>
                                    <option value="416">חמרה</option>
                                    <option value="417">חניאל</option>
                                    <option value="418">חניתה</option>
                                    <option value="419">חנתון</option>
                                    <option value="420">חספין</option>
                                    <option value="421">חפץ חיים</option>
                                    <option value="422">חפצי-בה</option>
                                    <option value="423">חצב</option>
                                    <option value="424">חצבה</option>
                                    <option value="425">חצור-אשדוד</option>
                                    <option value="426">חצור הגלילית</option>
                                    <option value="427">חצרים</option>
                                    <option value="428">חרב לאת</option>
                                    <option value="429">חרוצים</option>
                                    <option value="430">חרמש</option>
                                    <option value="431">חרשים</option>
                                    <option value="432">חשמונאים</option>
                                    <option value="433">טבריה</option>
                                    <option value="434">טובא-זנגרייה</option>
                                    <option value="435">טורעאן</option>
                                    <option value="436">טייבה</option>
                                    <option value="437">טייבה (בעמק)</option>
                                    <option value="438">טירה</option>
                                    <option value="439">טירת יהודה</option>
                                    <option value="440">טירת כרמל</option>
                                    <option value="441">טירת צבי</option>
                                    <option value="442">טל-אל</option>
                                    <option value="443">טל שחר</option>
                                    <option value="444">טללים</option>
                                    <option value="445">טלמון</option>
                                    <option value="446">טמרה</option>
                                    <option value="447">טמרה (יזרעאל)</option>
                                    <option value="448">טנא</option>
                                    <option value="449">טפחות</option>
                                    <option value="450">יאנוח-ג &#39;ת</option>
                                    <option value="451">יבול</option>
                                    <option value="452">יבנאל</option>
                                    <option value="453">יבנה</option>
                                    <option value="454">יגור</option>
                                    <option value="455">יגל</option>
                                    <option value="456">יד בנימין</option>
                                    <option value="457">יד השמונה</option>
                                    <option value="458">יד חנה</option>
                                    <option value="459">יד מרדכי</option>
                                    <option value="460">יד נתן</option>
                                    <option value="461">יד רמב &quot;ם</option>
                                    <option value="462">ידידה</option>
                                    <option value="463">יהוד</option>
                                    <option value="464">יהל</option>
                                    <option value="465">יובל</option>
                                    <option value="466">יובלים</option>
                                    <option value="467">יודפת</option>
                                    <option value="468">יונתן</option>
                                    <option value="469">יושיביה</option>
                                    <option value="470">יזרעאל</option>
                                    <option value="471">יחיעם</option>
                                    <option value="472">יטבתה</option>
                                    <option value="473">ייט &quot;ב</option>
                                    <option value="474">יכיני</option>
                                    <option value="475">ים המלח - בתי מלון</option>
                                    <option value="476">ינוב</option>
                                    <option value="477">ינון</option>
                                    <option value="478">יסוד המעלה</option>
                                    <option value="479">יסודות</option>
                                    <option value="480">יסעור</option>
                                    <option value="481">יעד</option>
                                    <option value="482">יעל</option>
                                    <option value="483">יעף</option>
                                    <option value="484">יערה</option>
                                    <option value="485">יפיע</option>
                                    <option value="486">יפית</option>
                                    <option value="487">יפעת</option>
                                    <option value="488">יפתח</option>
                                    <option value="489">יצהר</option>
                                    <option value="490">יציץ</option>
                                    <option value="491">יקום</option>
                                    <option value="492">יקיר</option>
                                    <option value="493">יקנעם (מושבה)</option>
                                    <option value="494">יקנעם עילית</option>
                                    <option value="495">יראון</option>
                                    <option value="496">ירדנה</option>
                                    <option value="497">ירוחם</option>
                                    <option value="498">ירושלים</option>
                                    <option value="499">ירחיב</option>
                                    <option value="500">ירכא</option>
                                    <option value="501">ירקונה</option>
                                    <option value="502">ישע</option>
                                    <option value="503">ישעי</option>
                                    <option value="504">ישרש</option>
                                    <option value="505">יתד</option>
                                    <option value="506">כאבול</option>
                                    <option value="507">כאוכב אבו אל-היג &#39;א</option>
                                    <option value="508">כברי</option>
                                    <option value="509">כדורי</option>
                                    <option value="510">כדיתה</option>
                                    <option value="511">כוכב השחר</option>
                                    <option value="512">כוכב יאיר</option>
                                    <option value="513">כוכב יעקב</option>
                                    <option value="514">כוכב מיכאל</option>
                                    <option value="515">כורזים</option>
                                    <option value="516">כחל</option>
                                    <option value="517">כחלה</option>
                                    <option value="518">כיסופים</option>
                                    <option value="519">כישור</option>
                                    <option value="520">כליל</option>
                                    <option value="521">כלנית</option>
                                    <option value="522">כמאנה</option>
                                    <option value="523">כמהין</option>
                                    <option value="524">כמון</option>
                                    <option value="525">כנות</option>
                                    <option value="526">כנף</option>
                                    <option value="527">כנרות של &quot;ש</option>
                                    <option value="528">כנרת (מושבה)</option>
                                    <option value="529">כנרת (קבוצה)</option>
                                    <option value="530">כסיפה</option>
                                    <option value="531">כסלון</option>
                                    <option value="532">כסרא-סמיע</option>
                                    <option value="533">כעביה-טבאש-חג &#39;אג &#39;רה</option>
                                    <option value="534">כפר אביב</option>
                                    <option value="535">כפר אדומים</option>
                                    <option value="536">כפר אוריה</option>
                                    <option value="537">כפר אחים</option>
                                    <option value="538">כפר ביאליק</option>
                                    <option value="539">כפר ביל &quot;ו</option>
                                    <option value="540">כפר בלום</option>
                                    <option value="541">כפר בן נון</option>
                                    <option value="542">כפר ברא</option>
                                    <option value="543">כפר ברוך</option>
                                    <option value="544">כפר גדעון</option>
                                    <option value="545">כפר גלים</option>
                                    <option value="546">כפר גליקסון</option>
                                    <option value="547">כפר גלעדי</option>
                                    <option value="548">כפר דניאל</option>
                                    <option value="549">כפר האורנים</option>
                                    <option value="550">כפר החורש</option>
                                    <option value="551">כפר המכבי</option>
                                    <option value="552">כפר הנגיד</option>
                                    <option value="553">כפר הנוער הדתי</option>
                                    <option value="554">כפר הנשיא</option>
                                    <option value="555">כפר הס</option>
                                    <option value="556">כפר הרא &quot;ה</option>
                                    <option value="557">כפר הרי &quot;ף</option>
                                    <option value="558">כפר ויתקין</option>
                                    <option value="559">כפר ורבורג</option>
                                    <option value="560">כפר ורדים</option>
                                    <option value="561">כפר זוהרים</option>
                                    <option value="562">כפר זיתים</option>
                                    <option value="563">כפר חב &quot;ד</option>
                                    <option value="564">כפר חושן</option>
                                    <option value="565">כפר חיטים</option>
                                    <option value="566">כפר חיים</option>
                                    <option value="567">כפר חנניה</option>
                                    <option value="568">כפר חסידים א &#39;</option>
                                    <option value="569">כפר חסידים ב &#39;</option>
                                    <option value="570">כפר חרוב</option>
                                    <option value="571">כפר טרומן</option>
                                    <option value="572">כפר יאסיף</option>
                                    <option value="573">כפר ידידיה</option>
                                    <option value="574">כפר יהושע</option>
                                    <option value="575">כפר יונה</option>
                                    <option value="576">כפר יחזקאל</option>
                                    <option value="577">כפר יעבץ</option>
                                    <option value="578">כפר כמא</option>
                                    <option value="579">כפר כנא</option>
                                    <option value="580">כפר מונש</option>
                                    <option value="581">כפר מימון</option>
                                    <option value="582">כפר מל &quot;ל</option>
                                    <option value="583">כפר מנדא</option>
                                    <option value="584">כפר מנחם</option>
                                    <option value="585">כפר מסריק</option>
                                    <option value="586">כפר מצר</option>
                                    <option value="587">כפר מרדכי</option>
                                    <option value="588">כפר נטר</option>
                                    <option value="589">כפר סאלד</option>
                                    <option value="590">כפר סבא</option>
                                    <option value="591">כפר סילבר</option>
                                    <option value="592">כפר סירקין</option>
                                    <option value="593">כפר עבודה</option>
                                    <option value="594">כפר עזה</option>
                                    <option value="595">כפר עציון</option>
                                    <option value="596">כפר פינס</option>
                                    <option value="597">כפר קאסם</option>
                                    <option value="598">כפר קיש</option>
                                    <option value="599">כפר קרע</option>
                                    <option value="600">כפר ראש הנקרה</option>
                                    <option value="601">כפר רוזנואלד (זרעית)</option>
                                    <option value="602">כפר רופין</option>
                                    <option value="603">כפר רות</option>
                                    <option value="604">כפר שמאי</option>
                                    <option value="605">כפר שמואל</option>
                                    <option value="606">כפר שמריהו</option>
                                    <option value="607">כפר תבור</option>
                                    <option value="608">כפר תפוח</option>
                                    <option value="609">כרכום</option>
                                    <option value="610">כרם בן זמרה</option>
                                    <option value="611">כרם בן שמן</option>
                                    <option value="612">כרם יבנה (ישיבה)</option>
                                    <option value="613">כרם מהר &quot;ל</option>
                                    <option value="614">כרם שלום</option>
                                    <option value="615">כרמי יוסף</option>
                                    <option value="616">כרמי צור</option>
                                    <option value="617">כרמיאל</option>
                                    <option value="618">כרמייה</option>
                                    <option value="619">כרמים</option>
                                    <option value="620">כרמל</option>
                                    <option value="621">לבון</option>
                                    <option value="622">לביא</option>
                                    <option value="623">לבנים</option>
                                    <option value="624">להב</option>
                                    <option value="625">להבות הבשן</option>
                                    <option value="626">להבות חביבה</option>
                                    <option value="627">להבים</option>
                                    <option value="628">לוד</option>
                                    <option value="629">לוזית</option>
                                    <option value="630">לוחמי הגיטאות</option>
                                    <option value="631">לוטם</option>
                                    <option value="632">לוטן</option>
                                    <option value="633">לימן</option>
                                    <option value="634">לכיש</option>
                                    <option value="635">לפיד</option>
                                    <option value="636">לפידות</option>
                                    <option value="637">לקיה</option>
                                    <option value="638">מאור</option>
                                    <option value="639">מאיר שפיה</option>
                                    <option value="640">מבוא ביתר</option>
                                    <option value="641">מבוא דותן</option>
                                    <option value="642">מבוא חורון</option>
                                    <option value="643">מבוא חמה</option>
                                    <option value="644">מבוא מודיעים</option>
                                    <option value="645">מבואות ים</option>
                                    <option value="646">מבועים</option>
                                    <option value="647">מבטחים</option>
                                    <option value="648">מבקיעים</option>
                                    <option value="649">מבשרת ציון</option>
                                    <option value="650">מג &#39;ד אל-כרום</option>
                                    <option value="651">מג &#39;דל שמס</option>
                                    <option value="652">מגאר</option>
                                    <option value="653">מגדים</option>
                                    <option value="654">מגדל</option>
                                    <option value="655">מגדל העמק</option>
                                    <option value="656">מגדל עוז</option>
                                    <option value="657">מגדל תפן</option>
                                    <option value="658">מגדלים</option>
                                    <option value="659">מגידו</option>
                                    <option value="660">מגל</option>
                                    <option value="661">מגן</option>
                                    <option value="662">מגן שאול</option>
                                    <option value="663">מגשימים</option>
                                    <option value="664">מדרך עוז</option>
                                    <option value="665">מדרשת בן גוריון</option>
                                    <option value="666">מדרשת רופין</option>
                                    <option value="667">מודיעין-מכבים-רעות</option>
                                    <option value="668">מודיעין עילית</option>
                                    <option value="669">מולדה</option>
                                    <option value="670">מולדת</option>
                                    <option value="671">מוצא עילית</option>
                                    <option value="672">מוקייבלה</option>
                                    <option value="673">מורן</option>
                                    <option value="674">מורשת</option>
                                    <option value="675">מזור</option>
                                    <option value="676">מזכרת בתיה</option>
                                    <option value="677">מזרע</option>
                                    <option value="678">מזרעה</option>
                                    <option value="679">מחולה</option>
                                    <option value="680">מחניים</option>
                                    <option value="681">מחסיה</option>
                                    <option value="682">מטולה</option>
                                    <option value="683">מטע</option>
                                    <option value="684">מי עמי</option>
                                    <option value="685">מיטב</option>
                                    <option value="686">מייסר</option>
                                    <option value="687">מיצר</option>
                                    <option value="688">מירב</option>
                                    <option value="689">מירון</option>
                                    <option value="690">מישר</option>
                                    <option value="691">מיתר</option>
                                    <option value="692">מכורה</option>
                                    <option value="693">מכחול</option>
                                    <option value="694">מכמורת</option>
                                    <option value="695">מכמנים</option>
                                    <option value="696">מלאה</option>
                                    <option value="697">מלילות</option>
                                    <option value="698">מלכייה</option>
                                    <option value="699">מלכישוע</option>
                                    <option value="700">מנוחה</option>
                                    <option value="701">מנוף</option>
                                    <option value="702">מנות</option>
                                    <option value="703">מנחמיה</option>
                                    <option value="704">מנרה</option>
                                    <option value="705">מנשית זבדה</option>
                                    <option value="706">מסד</option>
                                    <option value="707">מסדה</option>
                                    <option value="708">מסילות</option>
                                    <option value="709">מסילת ציון</option>
                                    <option value="710">מסלול</option>
                                    <option value="711">מסעדה</option>
                                    <option value="712">מעברות</option>
                                    <option value="713">מעגלים</option>
                                    <option value="714">מעגן</option>
                                    <option value="715">מעגן מיכאל</option>
                                    <option value="716">מעוז חיים</option>
                                    <option value="717">מעון</option>
                                    <option value="718">מעונה</option>
                                    <option value="719">מעיין ברוך</option>
                                    <option value="720">מעיין צבי</option>
                                    <option value="721">מעיליא</option>
                                    <option value="722">מעלה אדומים</option>
                                    <option value="723">מעלה אפרים</option>
                                    <option value="724">מעלה גלבוע</option>
                                    <option value="725">מעלה גמלא</option>
                                    <option value="726">מעלה החמישה</option>
                                    <option value="727">מעלה לבונה</option>
                                    <option value="728">מעלה מכמש</option>
                                    <option value="729">מעלה עירון</option>
                                    <option value="730">מעלה עמוס</option>
                                    <option value="731">מעלה שומרון</option>
                                    <option value="732">מעלות-תרשיחא</option>
                                    <option value="733">מענית</option>
                                    <option value="734">מעש</option>
                                    <option value="735">מפלסים</option>
                                    <option value="736">מצדות יהודה</option>
                                    <option value="737">מצובה</option>
                                    <option value="738">מצליח</option>
                                    <option value="739">מצפה</option>
                                    <option value="740">מצפה אבי &quot;ב</option>
                                    <option value="741">מצפה אילן</option>
                                    <option value="742">מצפה יריחו</option>
                                    <option value="743">מצפה נטופה</option>
                                    <option value="744">מצפה רמון</option>
                                    <option value="745">מצפה שלם</option>
                                    <option value="746">מצר</option>
                                    <option value="747">מקווה ישראל</option>
                                    <option value="748">מרגליות</option>
                                    <option value="749">מרום גולן</option>
                                    <option value="750">מרחב עם</option>
                                    <option value="751">מרחביה (מושב)</option>
                                    <option value="752">מרחביה (קיבוץ)</option>
                                    <option value="753">מרכז אזורי כדורי</option>
                                    <option value="754">מרכז אזורי מרום הגליל</option>
                                    <option value="755">מרכז אזורי משגב</option>
                                    <option value="756">מרכז כ &quot;ח</option>
                                    <option value="757">מרכז שוהם</option>
                                    <option value="758">מרכז שפירא</option>
                                    <option value="759">משאבי שדה</option>
                                    <option value="760">משגב דב</option>
                                    <option value="761">משגב עם</option>
                                    <option value="762">משהד</option>
                                    <option value="763">משואה</option>
                                    <option value="764">משואות יצחק</option>
                                    <option value="765">משכיות</option>
                                    <option value="766">משמר איילון</option>
                                    <option value="767">משמר דוד</option>
                                    <option value="768">משמר הירדן</option>
                                    <option value="769">משמר הנגב</option>
                                    <option value="770">משמר העמק</option>
                                    <option value="771">משמר השבעה</option>
                                    <option value="772">משמר השרון</option>
                                    <option value="773">משמרות</option>
                                    <option value="774">משמרת</option>
                                    <option value="775">משען</option>
                                    <option value="776">מתן</option>
                                    <option value="777">מתת</option>
                                    <option value="778">מתתיהו</option>
                                    <option value="779">נאות גולן</option>
                                    <option value="780">נאות הכיכר</option>
                                    <option value="781">נאות מרדכי</option>
                                    <option value="782">נאות סמדר</option>
                                    <option value="783">נאעורה</option>
                                    <option value="784">נבטים</option>
                                    <option value="785">נגבה</option>
                                    <option value="786">נגוהות</option>
                                    <option value="787">נהורה</option>
                                    <option value="788">נהלל</option>
                                    <option value="789">נהרייה</option>
                                    <option value="790">נוב</option>
                                    <option value="791">נוגה</option>
                                    <option value="792">נווה אבות</option>
                                    <option value="793">נווה אור</option>
                                    <option value="794">נווה אטי &quot;ב</option>
                                    <option value="795">נווה אילן</option>
                                    <option value="796">נווה איתן</option>
                                    <option value="797">נווה דניאל</option>
                                    <option value="798">נווה זוהר</option>
                                    <option value="799">נווה זיו</option>
                                    <option value="800">נווה חריף</option>
                                    <option value="801">נווה ים</option>
                                    <option value="802">נווה ימין</option>
                                    <option value="803">נווה ירק</option>
                                    <option value="804">נווה מבטח</option>
                                    <option value="805">נווה מיכאל</option>
                                    <option value="806">נווה שלום</option>
                                    <option value="807">נועם</option>
                                    <option value="808">נוף איילון</option>
                                    <option value="809">נופים</option>
                                    <option value="810">נופית</option>
                                    <option value="811">נופך</option>
                                    <option value="812">נוקדים</option>
                                    <option value="813">נורדייה</option>
                                    <option value="814">נורית</option>
                                    <option value="815">נחושה</option>
                                    <option value="816">נחל עוז</option>
                                    <option value="817">נחלה</option>
                                    <option value="818">נחליאל</option>
                                    <option value="819">נחלים</option>
                                    <option value="820">נחם</option>
                                    <option value="821">נחף</option>
                                    <option value="822">נחשולים</option>
                                    <option value="823">נחשון</option>
                                    <option value="824">נחשונים</option>
                                    <option value="825">נטועה</option>
                                    <option value="826">נטור</option>
                                    <option value="827">נטעים</option>
                                    <option value="828">נטף</option>
                                    <option value="829">ניין</option>
                                    <option value="830">ניל &quot;י</option>
                                    <option value="831">ניצן</option>
                                    <option value="832">ניצן ב &#39;</option>
                                    <option value="833">ניצנה (קהילת חינוך)</option>
                                    <option value="834">ניצני סיני</option>
                                    <option value="835">ניצני עוז</option>
                                    <option value="836">ניצנים</option>
                                    <option value="837">ניר אליהו</option>
                                    <option value="838">ניר בנים</option>
                                    <option value="839">ניר גלים</option>
                                    <option value="840">ניר דוד (תל עמל)</option>
                                    <option value="841">ניר ח &quot;ן</option>
                                    <option value="842">ניר יפה</option>
                                    <option value="843">ניר יצחק</option>
                                    <option value="844">ניר ישראל</option>
                                    <option value="845">ניר משה</option>
                                    <option value="846">ניר עוז</option>
                                    <option value="847">ניר עם</option>
                                    <option value="848">ניר עציון</option>
                                    <option value="849">ניר עקיבא</option>
                                    <option value="850">ניר צבי</option>
                                    <option value="851">נירים</option>
                                    <option value="852">נירית</option>
                                    <option value="853">נירן</option>
                                    <option value="854">נמל תעופה בן-גוריון</option>
                                    <option value="855">נס הרים</option>
                                    <option value="856">נס עמים</option>
                                    <option value="857">נס ציונה</option>
                                    <option value="858">נעורים</option>
                                    <option value="859">נעלה</option>
                                    <option value="860">נעמ &quot;ה</option>
                                    <option value="861">נען</option>
                                    <option value="862">נפת בית לחם</option>
                                    <option value="863">נפת ג &#39;נין</option>
                                    <option value="864">נפת חברון</option>
                                    <option value="865">נפת טול כרם</option>
                                    <option value="866">נפת ירדן</option>
                                    <option value="867">נפת ראמאללה</option>
                                    <option value="868">נפת שכם</option>
                                    <option value="869">נצר סרני</option>
                                    <option value="870">נצרת</option>
                                    <option value="871">נצרת עילית</option>
                                    <option value="872">נשר</option>
                                    <option value="873">נתיב הגדוד</option>
                                    <option value="874">נתיב הל &quot;ה</option>
                                    <option value="875">נתיב העשרה</option>
                                    <option value="876">נתיב השיירה</option>
                                    <option value="877">נתיבות</option>
                                    <option value="878">נתניה</option>
                                    <option value="879">סאג &#39;ור</option>
                                    <option value="880">סאסא</option>
                                    <option value="881">סביון</option>
                                    <option value="882">סגולה</option>
                                    <option value="883">סואעד (חמרייה)</option>
                                    <option value="884">סולם</option>
                                    <option value="885">סוסיה</option>
                                    <option value="886">סופה</option>
                                    <option value="887">סח &#39;נין</option>
                                    <option value="888">סלמה</option>
                                    <option value="889">סלעית</option>
                                    <option value="890">סמר</option>
                                    <option value="891">סעד</option>
                                    <option value="892">סער</option>
                                    <option value="893">ספיר</option>
                                    <option value="894">סתרייה</option>
                                    <option value="895">ע &#39;ג &#39;ר</option>
                                    <option value="896">עבדון</option>
                                    <option value="897">עברון</option>
                                    <option value="898">עגור</option>
                                    <option value="899">עד הלום</option>
                                    <option value="900">עדי</option>
                                    <option value="901">עדנים</option>
                                    <option value="902">עוזה</option>
                                    <option value="903">עוזייר</option>
                                    <option value="904">עולש</option>
                                    <option value="905">עומר</option>
                                    <option value="906">עופר</option>
                                    <option value="907">עוצם</option>
                                    <option value="908">עזוז</option>
                                    <option value="909">עזר</option>
                                    <option value="910">עזריאל</option>
                                    <option value="911">עזריה</option>
                                    <option value="912">עזריקם</option>
                                    <option value="913">עטרת</option>
                                    <option value="914">עידן</option>
                                    <option value="915">עיילבון</option>
                                    <option value="916">עיינות</option>
                                    <option value="917">עילוט</option>
                                    <option value="918">עין איילה</option>
                                    <option value="919">עין אל-אסד</option>
                                    <option value="920">עין גב</option>
                                    <option value="921">עין גדי</option>
                                    <option value="922">עין דור</option>
                                    <option value="923">עין הבשור</option>
                                    <option value="924">עין הוד</option>
                                    <option value="925">עין החורש</option>
                                    <option value="926">עין המפרץ</option>
                                    <option value="927">עין הנצי &quot;ב</option>
                                    <option value="928">עין העמק</option>
                                    <option value="929">עין השופט</option>
                                    <option value="930">עין השלושה</option>
                                    <option value="931">עין ורד</option>
                                    <option value="932">עין זיוון</option>
                                    <option value="933">עין חוד</option>
                                    <option value="934">עין חצבה</option>
                                    <option value="935">עין חרוד (איחוד)</option>
                                    <option value="936">עין חרוד (מאוחד)</option>
                                    <option value="937">עין יהב</option>
                                    <option value="938">עין יעקב</option>
                                    <option value="939">עין כרם-בי &quot;ס חקלאי</option>
                                    <option value="940">עין כרמל</option>
                                    <option value="941">עין מאהל</option>
                                    <option value="942">עין נקובא</option>
                                    <option value="943">עין עירון</option>
                                    <option value="944">עין צורים</option>
                                    <option value="945">עין קנייא</option>
                                    <option value="946">עין ראפה</option>
                                    <option value="947">עין שמר</option>
                                    <option value="948">עין שריד</option>
                                    <option value="949">עין תמר</option>
                                    <option value="950">עינת</option>
                                    <option value="951">עיר אובות</option>
                                    <option value="952">עכו</option>
                                    <option value="953">עלומים</option>
                                    <option value="954">עלי</option>
                                    <option value="955">עלי זהב</option>
                                    <option value="956">עלמה</option>
                                    <option value="957">עלמון</option>
                                    <option value="958">עמוקה</option>
                                    <option value="959">עמינדב</option>
                                    <option value="960">עמיעד</option>
                                    <option value="961">עמיעוז</option>
                                    <option value="962">עמיקם</option>
                                    <option value="963">עמיר</option>
                                    <option value="964">עמנואל</option>
                                    <option value="965">עמק בית שאן של &quot;ש</option>
                                    <option value="966">עמק חולה של &quot;ש</option>
                                    <option value="967">עמק חרוד של &quot;ש</option>
                                    <option value="968">עמקה</option>
                                    <option value="969">ענב</option>
                                    <option value="970">עספיא</option>
                                    <option value="971">עפולה</option>
                                    <option value="972">עפרה</option>
                                    <option value="973">עץ אפרים</option>
                                    <option value="974">עצמון שגב</option>
                                    <option value="975">עראבה</option>
                                    <option value="976">עראמשה</option>
                                    <option value="977">ערב אל נעים</option>
                                    <option value="978">ערד</option>
                                    <option value="979">ערוגות</option>
                                    <option value="980">ערערה</option>
                                    <option value="981">ערערה-בנגב</option>
                                    <option value="982">עשרת</option>
                                    <option value="983">עתלית</option>
                                    <option value="984">עתניאל</option>
                                    <option value="985">פארן</option>
                                    <option value="986">פארק תעשיה חבל מודיעים</option>
                                    <option value="987">פארק תעשיות עמק חפר</option>
                                    <option value="988">פדואל</option>
                                    <option value="989">פדויים</option>
                                    <option value="990">פדיה</option>
                                    <option value="991">פוריידיס</option>
                                    <option value="992">פורייה - כפר עבודה</option>
                                    <option value="993">פורייה - נווה עובד</option>
                                    <option value="994">פורייה עילית</option>
                                    <option value="995">פורת</option>
                                    <option value="996">פטיש</option>
                                    <option value="997">פלך</option>
                                    <option value="998">פלמחים</option>
                                    <option value="999">פני חבר</option>
                                    <option value="1000">פסגות</option>
                                    <option value="1001">פסוטה</option>
                                    <option value="1002">פעמי תש &quot;ז</option>
                                    <option value="1003">פצאל</option>
                                    <option value="1004">פקיעין (בוקייעה)</option>
                                    <option value="1005">פקיעין חדשה</option>
                                    <option value="1006">פרדס חנה-כרכור</option>
                                    <option value="1007">פרדסייה</option>
                                    <option value="1008">פרוד</option>
                                    <option value="1009">פרזון</option>
                                    <option value="1010">פרי גן</option>
                                    <option value="1011">פתח תקווה</option>
                                    <option value="1012">פתחיה</option>
                                    <option value="1013">צאלים</option>
                                    <option value="1014">צביה</option>
                                    <option value="1015">צבעון</option>
                                    <option value="1016">צובה</option>
                                    <option value="1017">צוחר</option>
                                    <option value="1018">צופייה</option>
                                    <option value="1019">צופים</option>
                                    <option value="1020">צופית</option>
                                    <option value="1021">צופר</option>
                                    <option value="1022">צוקי ים</option>
                                    <option value="1023">צוקים</option>
                                    <option value="1024">צור הדסה</option>
                                    <option value="1025">צור יצחק</option>
                                    <option value="1026">צור משה</option>
                                    <option value="1027">צור נתן</option>
                                    <option value="1028">צוריאל</option>
                                    <option value="1029">צורית</option>
                                    <option value="1030">ציפורי</option>
                                    <option value="1031">צלפון</option>
                                    <option value="1032">צנדלה</option>
                                    <option value="1033">צפרייה</option>
                                    <option value="1034">צפרירים</option>
                                    <option value="1035">צפת</option>
                                    <option value="1036">צרופה</option>
                                    <option value="1037">צרעה</option>
                                    <option value="1038">קבוצת יבנה</option>
                                    <option value="1039">קדומים</option>
                                    <option value="1040">קדימה-צורן</option>
                                    <option value="1041">קדמה</option>
                                    <option value="1042">קדמת צבי</option>
                                    <option value="1043">קדר</option>
                                    <option value="1044">קדרון</option>
                                    <option value="1045">קדרים</option>
                                    <option value="1046">קוממיות</option>
                                    <option value="1047">קורנית</option>
                                    <option value="1048">קטורה</option>
                                    <option value="1049">קיסריה</option>
                                    <option value="1050">קלחים</option>
                                    <option value="1051">קליה</option>
                                    <option value="1052">קלנסווה</option>
                                    <option value="1053">קלע</option>
                                    <option value="1054">קציר-חריש</option>
                                    <option value="1055">קצר א-סר</option>
                                    <option value="1056">קצרין</option>
                                    <option value="1057">קריית אונו</option>
                                    <option value="1058">קריית ארבע</option>
                                    <option value="1059">קריית אתא</option>
                                    <option value="1060">קריית ביאליק</option>
                                    <option value="1061">קריית גת</option>
                                    <option value="1062">קריית חינוך מרחבים</option>
                                    <option value="1063">קריית טבעון</option>
                                    <option value="1064">קריית ים</option>
                                    <option value="1065">קריית יערים</option>
                                    <option value="1066">קריית יערים (מוסד)</option>
                                    <option value="1067">קריית מוצקין</option>
                                    <option value="1068">קריית מלאכי</option>
                                    <option value="1069">קריית נטפים</option>
                                    <option value="1070">קריית ענבים</option>
                                    <option value="1071">קריית עקרון</option>
                                    <option value="1072">קריית שלמה</option>
                                    <option value="1073">קריית שמונה</option>
                                    <option value="1074">קרית חינוך עזתה</option>
                                    <option value="1075">קרית תעופה</option>
                                    <option value="1076">קרני שומרון</option>
                                    <option value="1077">קשת</option>
                                    <option value="1078">ראמה</option>
                                    <option value="1079">ראס אל-עין</option>
                                    <option value="1080">ראס עלי</option>
                                    <option value="1081">ראש העין</option>
                                    <option value="1082">ראש פינה</option>
                                    <option value="1083">ראש צורים</option>
                                    <option value="1084">ראשון לציון</option>
                                    <option value="1085">רבבה</option>
                                    <option value="1086">רבדים</option>
                                    <option value="1087">רביבים</option>
                                    <option value="1088">רביד</option>
                                    <option value="1089">רגבה</option>
                                    <option value="1090">רגבים</option>
                                    <option value="1091">רהט</option>
                                    <option value="1092">רווחה</option>
                                    <option value="1093">רוויה</option>
                                    <option value="1094">רוחמה</option>
                                    <option value="1095">רומאנה</option>
                                    <option value="1096">רומת הייב</option>
                                    <option value="1097">רועי</option>
                                    <option value="1098">רותם</option>
                                    <option value="1099">רחוב</option>
                                    <option value="1100">רחובות</option>
                                    <option value="1101">ריחאנייה</option>
                                    <option value="1102">ריחן</option>
                                    <option value="1103">ריינה</option>
                                    <option value="1104">רימונים</option>
                                    <option value="1105">רינתיה</option>
                                    <option value="1106">רכסים</option>
                                    <option value="1107">רם-און</option>
                                    <option value="1108">רמות</option>
                                    <option value="1109">רמות השבים</option>
                                    <option value="1110">רמות מאיר</option>
                                    <option value="1111">רמות מנשה</option>
                                    <option value="1112">רמות נפתלי</option>
                                    <option value="1113">רמלה</option>
                                    <option value="1114">רמת גן</option>
                                    <option value="1115">רמת דוד</option>
                                    <option value="1116">רמת הכובש</option>
                                    <option value="1117">רמת השופט</option>
                                    <option value="1118">רמת השרון</option>
                                    <option value="1119">רמת חובב</option>
                                    <option value="1120">רמת יוחנן</option>
                                    <option value="1121">רמת ישי</option>
                                    <option value="1122">רמת כוכב של &quot;ש</option>
                                    <option value="1123">רמת מגשימים</option>
                                    <option value="1124">רמת מנשה של &quot;ש</option>
                                    <option value="1125">רמת צבי</option>
                                    <option value="1126">רמת רזיאל</option>
                                    <option value="1127">רמת רחל</option>
                                    <option value="1128">רנן</option>
                                    <option value="1129">רעים</option>
                                    <option value="1130">רעננה</option>
                                    <option value="1131">רקפת</option>
                                    <option value="1132">רשפון</option>
                                    <option value="1133">רשפים</option>
                                    <option value="1134">רתמים</option>
                                    <option value="1135">שאר ישוב</option>
                                    <option value="1136">שבי ציון</option>
                                    <option value="1137">שבי שומרון</option>
                                    <option value="1138">שבלי - אום אל-גנם</option>
                                    <option value="1139">שגב-שלום</option>
                                    <option value="1140">שדה אילן</option>
                                    <option value="1141">שדה אליהו</option>
                                    <option value="1142">שדה אליעזר</option>
                                    <option value="1143">שדה בוקר</option>
                                    <option value="1144">שדה דוד</option>
                                    <option value="1145">שדה ורבורג</option>
                                    <option value="1146">שדה יואב</option>
                                    <option value="1147">שדה יעקב</option>
                                    <option value="1148">שדה יצחק</option>
                                    <option value="1149">שדה משה</option>
                                    <option value="1150">שדה נחום</option>
                                    <option value="1151">שדה נחמיה</option>
                                    <option value="1152">שדה ניצן</option>
                                    <option value="1153">שדה עוזיהו</option>
                                    <option value="1154">שדה צבי</option>
                                    <option value="1155">שדות ים</option>
                                    <option value="1156">שדות מיכה</option>
                                    <option value="1157">שדי אברהם</option>
                                    <option value="1158">שדי חמד</option>
                                    <option value="1159">שדי תרומות</option>
                                    <option value="1160">שדמה</option>
                                    <option value="1161">שדמות דבורה</option>
                                    <option value="1162">שדמות מחולה</option>
                                    <option value="1163">שדרות</option>
                                    <option value="1164">שואבה</option>
                                    <option value="1165">שובה</option>
                                    <option value="1166">שובל</option>
                                    <option value="1167">שוהם</option>
                                    <option value="1168">שומרה</option>
                                    <option value="1169">שומרייה</option>
                                    <option value="1170">שוקדה</option>
                                    <option value="1171">שורש</option>
                                    <option value="1172">שורשים</option>
                                    <option value="1173">שושנת העמקים</option>
                                    <option value="1174">שזור</option>
                                    <option value="1175">שחר</option>
                                    <option value="1176">שחרות</option>
                                    <option value="1177">שיבולים</option>
                                    <option value="1178">שיטים</option>
                                    <option value="1179">שייח &#39;דנון</option>
                                    <option value="1180">שילה</option>
                                    <option value="1181">שילת</option>
                                    <option value="1182">שכניה</option>
                                    <option value="1183">שלווה</option>
                                    <option value="1184">שלוחות</option>
                                    <option value="1185">שלומי</option>
                                    <option value="1186">שלומציון</option>
                                    <option value="1187">שמיר</option>
                                    <option value="1188">שמעה</option>
                                    <option value="1189">שמרת</option>
                                    <option value="1190">שמשית</option>
                                    <option value="1191">שני</option>
                                    <option value="1192">שניר</option>
                                    <option value="1193">שעב</option>
                                    <option value="1194">שעל</option>
                                    <option value="1195">שעלבים</option>
                                    <option value="1196">שער אפרים</option>
                                    <option value="1197">שער הגולן</option>
                                    <option value="1198">שער העמקים</option>
                                    <option value="1199">שער מנשה</option>
                                    <option value="1200">שערי תקווה</option>
                                    <option value="1201">שפיים</option>
                                    <option value="1202">שפיר</option>
                                    <option value="1203">שפלת יהודה של &quot;ש</option>
                                    <option value="1204">שפר</option>
                                    <option value="1205">שפרעם</option>
                                    <option value="1206">שקד</option>
                                    <option value="1207">שקף</option>
                                    <option value="1208">שרונה</option>
                                    <option value="1209">שריגים (לי-און)</option>
                                    <option value="1210">שריד</option>
                                    <option value="1211">שרשרת</option>
                                    <option value="1212">שתולה</option>
                                    <option value="1213">שתולים</option>
                                    <option value="1214">תאשור</option>
                                    <option value="1215">תדהר</option>
                                    <option value="1216">תובל</option>
                                    <option value="1217">תומר</option>
                                    <option value="1218">תושייה</option>
                                    <option value="1219">תימורים</option>
                                    <option value="1220">תירוש</option>
                                    <option value="1221">תל-חי</option>
                                    <option value="1222">תל אביב -יפו</option>
                                    <option value="1223">תל יוסף</option>
                                    <option value="1224">תל יצחק</option>
                                    <option value="1225">תל מונד</option>
                                    <option value="1226">תל עדשים</option>
                                    <option value="1227">תל קציר</option>
                                    <option value="1228">תל שבע</option>
                                    <option value="1229">תל תאומים</option>
                                    <option value="1230">תלם</option>
                                    <option value="1231">תלמי אליהו</option>
                                    <option value="1232">תלמי אלעזר</option>
                                    <option value="1233">תלמי ביל &quot;ו</option>
                                    <option value="1234">תלמי יוסף</option>
                                    <option value="1235">תלמי יחיאל</option>
                                    <option value="1236">תלמי יפה</option>
                                    <option value="1237">תלמים</option>
                                    <option value="1238">תמרת</option>
                                    <option value="1239">תנובות</option>
                                    <option value="1240">תעוז</option>
                                    <option value="1241">תעשיון בר-לב</option>
                                    <option value="1242">תעשיון גליל תחתון</option>
                                    <option value="1243">תעשיון דלתון</option>
                                    <option value="1244">תעשיון השרון</option>
                                    <option value="1245">תעשיון חוף יבנה</option>
                                    <option value="1246">תעשיון צריפין</option>
                                    <option value="1247">תעשיון שח &quot;ק</option>
                                    <option value="1248">תעשיות ספירים</option>
                                    <option value="1249">תפרח</option>
                                    <option value="1250">תקומה</option>
                                    <option value="1251">תקוע</option>
                                    <option value="1252">תרבין א-צאנע</option>
                                    <option value="1253">תרום</option>
                                </select>
                            </li>
                            <li>
                                <span id="ctl00_ContentPlaceHolder1_Label36" class="bold">תקנון האתר:</span>
                                <br/>
                                <span style="margin-right: 10px; padding-left: 0px;">&nbsp;</span>
                                <input id="ctl00_ContentPlaceHolder1_cbAgreeEULA" type="checkbox" name="ctl00$ContentPlaceHolder1$cbAgreeEULA" checked="checked"/>
                                <span>
                                    קראתי את <a href="EULA.htm">תקנון האתר</a>
                                    , ואני מאשר את תוכנו
                                </span>
                                <span id="ctl00_ContentPlaceHolder1_CustomValidator2" class="bold" style="color:Red;visibility:hidden;">* יש לאשר את תקנון האתר</span>
                            </li>
                        </ul>
                    </div>
                    <div class="center">
                        <input type="submit" name="ctl00$ContentPlaceHolder1$btnSaveInfoStep1" value="שמור והמשך >>" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$btnSaveInfoStep1&quot;, &quot;&quot;, true, &quot;Step1&quot;, &quot;&quot;, false, false))" id="ctl00_ContentPlaceHolder1_btnSaveInfoStep1" class="center"/>
                    </div>
                </div>
                <span>תהליך הוצאת רישיון נהיגה</span>
                <div id="ctl00_ContentPlaceHolder1_pnlProcesses">
                    <div class="RTLDiv Right">
                        <div>
                            <table class="Center xSmall RTLDiv" cellspacing="0" cellpadding="4" rules="all" border="1" id="ctl00_ContentPlaceHolder1_gvProcessView" style="color:#333333;border-collapse:collapse;">
                                <tr class="reportHeaderRow">
                                    <th scope="col">מס</th>
                                    <th scope="col">שלב</th>
                                    <th scope="col">סטטוס</th>
                                    <th scope="col">תאריך</th>
                                    <th scope="col">מעדכן</th>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl02_lblProcessStep">1</span>
                                    </td>
                                    <td>אישור ממשרד הרישוי</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl02$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl02_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridAlternatingRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl03_lblProcessStep">2</span>
                                    </td>
                                    <td>אישור מראש הצוות</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl03$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl03_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl04_lblProcessStep">3</span>
                                    </td>
                                    <td>אישור מאחראי המתנדבים</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl04$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl04_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridAlternatingRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl05_lblProcessStep">4</span>
                                    </td>
                                    <td>דיני תעבורה</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl05$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl05_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl06_lblProcessStep">5</span>
                                    </td>
                                    <td>סימולטור</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl06$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl06_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridAlternatingRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl07_lblProcessStep">6</span>
                                    </td>
                                    <td>טסט</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl07$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl07_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl08_lblProcessStep">7</span>
                                    </td>
                                    <td>סיום תהליך</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl08$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl08_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridAlternatingRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl09_lblProcessStep">8</span>
                                    </td>
                                    <td>משתלמי נהיגה - שיחת פתיחה </td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl09$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl09_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl10_lblProcessStep">9</span>
                                    </td>
                                    <td>משתלמי נהיגה - שיחת קצבט 1</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl10$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl10_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridAlternatingRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl11_lblProcessStep">10</span>
                                    </td>
                                    <td>משתלמי נהיגה - סיום משמרות </td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl11$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl11_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl12_lblProcessStep">11</span>
                                    </td>
                                    <td>משתלמי נהיגה -  סיום אבטחות </td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl12$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl12_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridAlternatingRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl13_lblProcessStep">12</span>
                                    </td>
                                    <td>משתלמי נהיגה - שיחת קצבט 2</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl13$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl13_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="reportGridRow" align="center">
                                    <td>
                                        <span id="ctl00_ContentPlaceHolder1_gvProcessView_ctl14_lblProcessStep">13</span>
                                    </td>
                                    <td>משתלמי נהיגה - סיום תהליך הכשרה</td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder1$gvProcessView$ctl14$ddlProcessStepStatus" id="ctl00_ContentPlaceHolder1_gvProcessView_ctl14_ddlProcessStepStatus" disabled="disabled" class="ddlEdit">
                                            <option selected="selected" value=""></option>
                                            <option value="1">לא טופל</option>
                                            <option value="2">בטיפול</option>
                                            <option value="3">בוצע</option>
                                        </select>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="RTLDiv purpleBox lfloat" style="width: 25%;">
                <div class="RTLDiv blueBox" style="width: 94%;">
                    <a href="#" onclick="showPwBox();">עדכון סיסמא</a>
                    <div class="downarrowclass"></div>
                    <br/>
                    <div style="text-align: right; display: none;" id="dvPWBox">
                        <table class="alignTable">
                            <tr>
                                <td style="width: 100px">
                                    <span id="ctl00_ContentPlaceHolder1_Label2">סיסמא נוכחית</span>
                                </td>
                                <td>
                                    <input name="ctl00$ContentPlaceHolder1$tbPrev" type="password" id="ctl00_ContentPlaceHolder1_tbPrev"/>
                                    &nbsp;<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator1" style="color:Red;visibility:hidden;">*</span>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <span id="ctl00_ContentPlaceHolder1_Label3" class="bold">סיסמא חדשה (8 תווים לפחות)</span>
                                    &nbsp;<img src="./images/helpico.png" title="לפחות 8 תווים. חובה אות גדולה באנגלית. חובה אות קטנה באנגלית. חובה סיפרה"/>
                                </td>
                                <td>
                                    <input name="ctl00$ContentPlaceHolder1$tbNew" type="password" id="ctl00_ContentPlaceHolder1_tbNew"/>
                                    &nbsp;<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator2" style="color:Red;visibility:hidden;">*</span>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 31px">
                                    <span id="ctl00_ContentPlaceHolder1_Label4">אישור חדשה</span>
                                </td>
                                <td>
                                    <input name="ctl00$ContentPlaceHolder1$tbNew2" type="password" id="ctl00_ContentPlaceHolder1_tbNew2"/>
                                    &nbsp;<span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator3" style="color:Red;visibility:hidden;">*</span>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        &nbsp;<span id="ctl00_ContentPlaceHolder1_CompareValidator1" style="color:Red;visibility:hidden;">שדה סיסמא חדשה ושדה אישור חדשה אינם זהים</span>
                        <br/>
                        <div class="txtLeft">
                            <input type="submit" name="ctl00$ContentPlaceHolder1$btnPassword" value="שנה" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$btnPassword&quot;, &quot;&quot;, true, &quot;A&quot;, &quot;&quot;, false, false))" id="ctl00_ContentPlaceHolder1_btnPassword"/>
                        </div>
                        <br/>
                    </div>
                </div>
                <hr/>
                <h4>לשינוי הפרטים הבאים פנו למנהל האתר:</h4>
                <span id="ctl00_ContentPlaceHolder1_Label14" class="leftLabel">דרגה:</span>
                <select name="ctl00$ContentPlaceHolder1$ddlRank" id="ctl00_ContentPlaceHolder1_ddlRank" disabled="disabled" class="ddlSmall">
                    <option selected="selected" value="1">אין</option>
                    <option value="13">מב &quot;מ</option>
                    <option value="17">מג &quot;מ</option>
                    <option value="15">מג &quot;ר</option>
                    <option value="19">מגן</option>
                    <option value="12">מז &quot;ב</option>
                    <option value="11">מז &quot;מ</option>
                    <option value="10">מז &quot;ש</option>
                    <option value="9">מזר</option>
                    <option value="5">מת &quot;ב</option>
                    <option value="4">מת &quot;מ</option>
                    <option value="6">מת &quot;ק</option>
                    <option value="3">מת &quot;ש</option>
                    <option value="2">מתן</option>
                    <option value="16">סמ &quot;ג</option>
                    <option value="8">רמ &quot;ב</option>
                    <option value="20">רמ &quot;ג</option>
                    <option value="14">רמ &quot;ז</option>
                    <option value="7">רמ &quot;ת</option>
                    <option value="18">תמ &quot;ג</option>
                </select>
                <br/>
                <br/>
                <span id="ctl00_ContentPlaceHolder1_Label8" class="leftLabel">שיוך לצוות:</span>
                <select name="ctl00$ContentPlaceHolder1$ddlTeams" id="ctl00_ContentPlaceHolder1_ddlTeams" disabled="disabled" class="stretchTB">
                    <option value="10">אבו-גוש</option>
                    <option value="18">אדומים</option>
                    <option value="82">אדם - גבע בנימין</option>
                    <option value="48">אלון שבות</option>
                    <option value="49">אלעזר</option>
                    <option value="26">אפרת</option>
                    <option value="15">אשכול</option>
                    <option value="30">בית אל</option>
                    <option value="3">בית וגן</option>
                    <option value="66">בית חורון</option>
                    <option value="120">בית שמש - וותיקה</option>
                    <option value="83">בית שמש - חיילים\שירות</option>
                    <option value="130">בית שמש - יתד</option>
                    <option value="121">בית שמש - מזלג צור הדסה</option>
                    <option value="41">בית שמש - מטה יהודה</option>
                    <option value="117">בית שמש - רמה א</option>
                    <option value="119">בית שמש - רמה ב קריה</option>
                    <option value="118">בית שמש - רמה ג</option>
                    <option selected="selected" value="134">בית שמש - רמה ד</option>
                    <option value="124">בית שמש לא פעילים</option>
                    <option value="86">בית שמש נוער רמב &quot;ש</option>
                    <option value="123">בית שמש עובדים</option>
                    <option value="25">ביתר עלית</option>
                    <option value="108">בנות/בני שרות</option>
                    <option value="4">גאולה</option>
                    <option value="42">גבעת זאב</option>
                    <option value="5">גילה</option>
                    <option value="6">גנים יובל</option>
                    <option value="67">דולב</option>
                    <option value="7">הנציב</option>
                    <option value="105">הר אדר
</option>
                    <option value="51">הר גילה</option>
                    <option value="47">הר חומה</option>
                    <option value="8">הר נוף</option>
                    <option value="23">חברון</option>
                    <option value="78">חו &quot;ל</option>
                    <option value="84">חיילים\שירות</option>
                    <option value="104">טלזסטון</option>
                    <option value="35">טלמון</option>
                    <option value="27">כוכב השחר</option>
                    <option value="28">כוכבציון</option>
                    <option value="19">כפר אדומים</option>
                    <option value="50">כפר עציון</option>
                    <option value="9">כרם מרדכי</option>
                    <option value="52">כרמי צור</option>
                    <option value="106">לא הוגדר צוות</option>
                    <option value="20">מבשרת</option>
                    <option value="37">מגילות</option>
                    <option value="46">מושבה טלביה</option>
                    <option value="11">מזרח</option>
                    <option value="53">מיצד</option>
                    <option value="79">מנהלה</option>
                    <option value="70">מעלה לבונה</option>
                    <option value="71">מעלה מכמש</option>
                    <option value="54">מעלה עמוס</option>
                    <option value="72">מצפה יריחו</option>
                    <option value="12">מרכז</option>
                    <option value="103">מתמחים מזרח</option>
                    <option value="85">מתנדבי חוץ</option>
                    <option value="55">נווה דניאל</option>
                    <option value="13">נווה יעקב</option>
                    <option value="34">נווה צוף</option>
                    <option value="129">נוער בית שמש  מתבגר</option>
                    <option value="113">נוער בית שמש חמישי</option>
                    <option value="127">נוער בית שמש כיתה ט</option>
                    <option value="109">נוער בית שמש ראשון</option>
                    <option value="112">נוער בית שמש רביעי</option>
                    <option value="115">נוער בית שמש שבת</option>
                    <option value="114">נוער בית שמש שישי</option>
                    <option value="111">נוער בית שמש שלישי</option>
                    <option value="110">נוער בית שמש שני</option>
                    <option value="101">נוער ביתר</option>
                    <option value="100">נוער גבעת זאב</option>
                    <option value="91">נוער חמישי</option>
                    <option value="133">נוער לא פעיל</option>
                    <option value="99">נוער מבשרת</option>
                    <option value="125">נוער מגמות הצלה</option>
                    <option value="116">נוער מזרח </option>
                    <option value="98">נוער מקוח</option>
                    <option value="132">נוער עכ</option>
                    <option value="97">נוער פסגה</option>
                    <option value="87">נוער ראשון</option>
                    <option value="90">נוער רביעי</option>
                    <option value="94">נוער שבת ראשונה</option>
                    <option value="96">נוער שבת שלישית</option>
                    <option value="95">נוער שבת שניה</option>
                    <option value="92">נוער שישי ראשונה</option>
                    <option value="93">נוער שישי שלישית</option>
                    <option value="89">נוער שלישי</option>
                    <option value="88">נוער שני</option>
                    <option value="126">נוער-מגמת כוחות הרפואה</option>
                    <option value="56">נוקדים</option>
                    <option value="68">נריה</option>
                    <option value="33">עטרת</option>
                    <option value="131">עין נקובא</option>
                    <option value="69">עלי</option>
                    <option value="31">עפרה</option>
                    <option value="29">פסגות</option>
                    <option value="1">פסגת זאב</option>
                    <option value="43">קטמון גוננים</option>
                    <option value="57">קידר</option>
                    <option value="22">קריית ארבע</option>
                    <option value="14">רובע</option>
                    <option value="73">רוממה</option>
                    <option value="2">רמות</option>
                    <option value="16">רמת שלמה</option>
                    <option value="17">שאול</option>
                    <option value="32">שילה</option>
                    <option value="58">תקוע</option>
                </select>
                <br/>
                <br/>
                <span id="ctl00_ContentPlaceHolder1_Label7" class="leftLabel">קוד כונן:</span>
                <select name="ctl00$ContentPlaceHolder1$ddlAreas" id="ctl00_ContentPlaceHolder1_ddlAreas" disabled="disabled">
                    <option selected="selected" value="1">ירושלים</option>
                    <option value="2">איילון</option>
                    <option value="3">אשר</option>
                    <option value="4">גלבוע</option>
                    <option value="5">דן</option>
                    <option value="6">ירדן</option>
                    <option value="7">ירקון</option>
                    <option value="8">כרמל</option>
                    <option value="9">לכיש</option>
                    <option value="10">נגב</option>
                    <option value="11">שרון</option>
                    <option value="12">אחר</option>
                </select>
                <input name="ctl00$ContentPlaceHolder1$tbKonanCode" type="text" id="ctl00_ContentPlaceHolder1_tbKonanCode" disabled="disabled" style="width:40px;"/>
                <hr/>
                <div>
                    <table cellspacing="0" rules="all" border="1" id="ctl00_ContentPlaceHolder1_gvMedical" style="border-collapse:collapse;">
                        <tr class="bold blueBox">
                            <th scope="col">הכשרות</th>
                        </tr>
                        <tr class="blueBox">
                            <td>חובש</td>
                        </tr>
                        <tr class="blueBox">
                            <td>חובש משתלם</td>
                        </tr>
                        <tr class="blueBox">
                            <td>60</td>
                        </tr>
                    </table>
                </div>
                <div class="blueBox">
                    <b>שיבוצים עתידיים:</b>
                    <br/>
                    <div>
                        <table cellspacing="0" rules="all" border="1" id="ctl00_ContentPlaceHolder1_gvFutureShifts" style="border-collapse:collapse;">
                            <tr class="reportHeaderRow" style="font-size:Small;">
                                <th scope="col">תאריך</th>
                                <th scope="col">שיבוץ</th>
                                <th scope="col">תפקיד</th>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2026-04-20</td>
                                <td>ירושלים לבן</td>
                                <td>חובש - י-ם מ-17 (2)</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="blueBox">
                    <b>שיבוצים בעבר:</b>
                    <br/>
                    <div>
                        <table cellspacing="0" rules="all" border="1" id="ctl00_ContentPlaceHolder1_gvPastShifts" style="border-collapse:collapse;">
                            <tr class="reportHeaderRow" style="font-size:Small;">
                                <th scope="col">תאריך</th>
                                <th scope="col">שיבוץ</th>
                                <th scope="col">תפקיד</th>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2026-04-16</td>
                                <td>ירושלים לבן</td>
                                <td>חובש - י-ם 20-2 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2026-04-15</td>
                                <td>ירושלים לבן</td>
                                <td>חובש - י-ם מ-18 (2)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2026-04-14</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 18-00 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2026-03-24</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2026-02-26</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 18-00 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2026-02-10</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2026-02-02</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 18-00 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2026-02-01</td>
                                <td>ירושלים לבן</td>
                                <td>חובש - י-ם (1)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2025-12-30</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2025-11-04</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2025-09-04</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2025-07-30</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2025-07-27</td>
                                <td>ירושלים לבן</td>
                                <td>חובש - י-ם 20-2 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2025-07-03</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridRow" style="font-size:Small;">
                                <td>2025-06-08</td>
                                <td>בית שמש</td>
                                <td>חובש - רמה 19-02 (2)</td>
                            </tr>
                            <tr class="reportGridAlternatingRow" style="font-size:Small;">
                                <td>2025-06-05</td>
                                <td>ירושלים לבן</td>
                                <td>חובש - י-ם (1)</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
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
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js" defer></script>
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
                var Page_Validators = new Array(document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator8"),document.getElementById("ctl00_ContentPlaceHolder1_RangeValidator1"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator4"),document.getElementById("ctl00_ContentPlaceHolder1_RegularExpressionValidator1"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator5"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator6"),document.getElementById("ctl00_ContentPlaceHolder1_RangeValidator3"),document.getElementById("ctl00_ContentPlaceHolder1_RangeValidator4"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator9"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator7"),document.getElementById("ctl00_ContentPlaceHolder1_CustomValidator2"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator1"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator2"),document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator3"),document.getElementById("ctl00_ContentPlaceHolder1_CompareValidator1"));
                //]]>
            </script>
            <script type="text/javascript">
                //<![CDATA[
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator8 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator8"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator8");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator8.controltovalidate = "ctl00_ContentPlaceHolder1_tbCell";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator8.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator8.validationGroup = "phone";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator8.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator8.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RangeValidator1 = document.all ? document.all["ctl00_ContentPlaceHolder1_RangeValidator1"] : document.getElementById("ctl00_ContentPlaceHolder1_RangeValidator1");
                ctl00_ContentPlaceHolder1_RangeValidator1.controltovalidate = "ctl00_ContentPlaceHolder1_tbCell";
                ctl00_ContentPlaceHolder1_RangeValidator1.errormessage = "*";
                ctl00_ContentPlaceHolder1_RangeValidator1.validationGroup = "phone";
                ctl00_ContentPlaceHolder1_RangeValidator1.type = "Integer";
                ctl00_ContentPlaceHolder1_RangeValidator1.evaluationfunction = "RangeValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RangeValidator1.maximumvalue = "9999999";
                ctl00_ContentPlaceHolder1_RangeValidator1.minimumvalue = "1111111";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator4 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator4"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator4");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator4.controltovalidate = "ctl00_ContentPlaceHolder1_tbEmail";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator4.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator4.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator4.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator4.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RegularExpressionValidator1 = document.all ? document.all["ctl00_ContentPlaceHolder1_RegularExpressionValidator1"] : document.getElementById("ctl00_ContentPlaceHolder1_RegularExpressionValidator1");
                ctl00_ContentPlaceHolder1_RegularExpressionValidator1.controltovalidate = "ctl00_ContentPlaceHolder1_tbEmail";
                ctl00_ContentPlaceHolder1_RegularExpressionValidator1.errormessage = "לא תקין";
                ctl00_ContentPlaceHolder1_RegularExpressionValidator1.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RegularExpressionValidator1.evaluationfunction = "RegularExpressionValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RegularExpressionValidator1.validationexpression = "\\w+([-+.\']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator5 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator5"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator5");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator5.controltovalidate = "ctl00_ContentPlaceHolder1_tbID";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator5.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator5.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator5.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator5.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator6 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator6"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator6");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator6.controltovalidate = "ctl00_ContentPlaceHolder1_rblSex";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator6.errormessage = "לא הוזן מין";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator6.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator6.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator6.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RangeValidator3 = document.all ? document.all["ctl00_ContentPlaceHolder1_RangeValidator3"] : document.getElementById("ctl00_ContentPlaceHolder1_RangeValidator3");
                ctl00_ContentPlaceHolder1_RangeValidator3.controltovalidate = "ctl00_ContentPlaceHolder1_ddlMonth";
                ctl00_ContentPlaceHolder1_RangeValidator3.errormessage = "*";
                ctl00_ContentPlaceHolder1_RangeValidator3.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RangeValidator3.type = "Integer";
                ctl00_ContentPlaceHolder1_RangeValidator3.evaluationfunction = "RangeValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RangeValidator3.maximumvalue = "12";
                ctl00_ContentPlaceHolder1_RangeValidator3.minimumvalue = "1";
                var ctl00_ContentPlaceHolder1_RangeValidator4 = document.all ? document.all["ctl00_ContentPlaceHolder1_RangeValidator4"] : document.getElementById("ctl00_ContentPlaceHolder1_RangeValidator4");
                ctl00_ContentPlaceHolder1_RangeValidator4.controltovalidate = "ctl00_ContentPlaceHolder1_ddlYear";
                ctl00_ContentPlaceHolder1_RangeValidator4.errormessage = "שנת לידה לא חוקית";
                ctl00_ContentPlaceHolder1_RangeValidator4.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RangeValidator4.type = "Integer";
                ctl00_ContentPlaceHolder1_RangeValidator4.evaluationfunction = "RangeValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RangeValidator4.maximumvalue = "2015";
                ctl00_ContentPlaceHolder1_RangeValidator4.minimumvalue = "1940";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator9 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator9"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator9");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator9.controltovalidate = "ctl00_ContentPlaceHolder1_tbAddress";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator9.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator9.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator9.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator9.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator7 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator7"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator7");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator7.controltovalidate = "ctl00_ContentPlaceHolder1_tbAddressNum";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator7.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator7.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator7.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator7.initialvalue = "";
                var ctl00_ContentPlaceHolder1_CustomValidator2 = document.all ? document.all["ctl00_ContentPlaceHolder1_CustomValidator2"] : document.getElementById("ctl00_ContentPlaceHolder1_CustomValidator2");
                ctl00_ContentPlaceHolder1_CustomValidator2.errormessage = "* יש לאשר את תקנון האתר";
                ctl00_ContentPlaceHolder1_CustomValidator2.validationGroup = "Step1";
                ctl00_ContentPlaceHolder1_CustomValidator2.evaluationfunction = "CustomValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_CustomValidator2.clientvalidationfunction = "ValidateEULA";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator1 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator1"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator1");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator1.controltovalidate = "ctl00_ContentPlaceHolder1_tbPrev";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator1.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator1.validationGroup = "A";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator1.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator1.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator2 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator2"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator2");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator2.controltovalidate = "ctl00_ContentPlaceHolder1_tbNew";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator2.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator2.validationGroup = "A";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator2.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator2.initialvalue = "";
                var ctl00_ContentPlaceHolder1_RequiredFieldValidator3 = document.all ? document.all["ctl00_ContentPlaceHolder1_RequiredFieldValidator3"] : document.getElementById("ctl00_ContentPlaceHolder1_RequiredFieldValidator3");
                ctl00_ContentPlaceHolder1_RequiredFieldValidator3.controltovalidate = "ctl00_ContentPlaceHolder1_tbNew2";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator3.errormessage = "*";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator3.validationGroup = "A";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator3.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_RequiredFieldValidator3.initialvalue = "";
                var ctl00_ContentPlaceHolder1_CompareValidator1 = document.all ? document.all["ctl00_ContentPlaceHolder1_CompareValidator1"] : document.getElementById("ctl00_ContentPlaceHolder1_CompareValidator1");
                ctl00_ContentPlaceHolder1_CompareValidator1.controltovalidate = "ctl00_ContentPlaceHolder1_tbNew2";
                ctl00_ContentPlaceHolder1_CompareValidator1.errormessage = "שדה סיסמא חדשה ושדה אישור חדשה אינם זהים";
                ctl00_ContentPlaceHolder1_CompareValidator1.validationGroup = "A";
                ctl00_ContentPlaceHolder1_CompareValidator1.evaluationfunction = "CompareValidatorEvaluateIsValid";
                ctl00_ContentPlaceHolder1_CompareValidator1.controltocompare = "ctl00_ContentPlaceHolder1_tbNew";
                ctl00_ContentPlaceHolder1_CompareValidator1.controlhookup = "ctl00_ContentPlaceHolder1_tbNew";
                //]]>
            </script>
            <script type="text/javascript">
                //<![CDATA[
                $(hdnMsgsList).val('[{"mId":"345","mTitle":"שאגת ארי בדיקת זמינות חובשים/בוגרים מרחבי","mMsg":"https://\\u0026#102;orms.gle/cTKee6ZttyDEi9gJA"}]');
                $(hdnUnreadMsgs).val(0);
                $(hdnUsersList).val('[{"Name":"יצחק מזרחי","Gold":true,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p8939_20191029203441.jpg"},{"Name":"אביאל קסיה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p13743_20251011184533.jpg"},{"Name":"אביב נורני","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"אביטל קופפר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"אהרון היימן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12135_20230502090435.jpg"},{"Name":"אוריה זגמן","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p6279_20190321001719.jpg"},{"Name":"אלימלך מסלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"אלישבע פריד","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"בניהו שמואלי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"דוב לנדאו","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"דניאל אלטר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"הוד בנאלי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"זאב טלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12740_20240310010445.jpg"},{"Name":"חנוך גרוס","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"חסד דנציגר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"טליה פישר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יחיאל שטרן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p14481_20250828081246.jpg"},{"Name":"יצחק וינר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יצחק ליכטנשטיין","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11411_20220920092130.jpg"},{"Name":"ישי שחר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"לאה מליק","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"מגד אבורמילה","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"מוריה קניוטו","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מיכאלחיים פרומקין","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מיכל משה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"נהוראי לוינזון","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13955_20250119194445.jpg"},{"Name":"נועה תירם","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"ניתאי לוי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"נתי הלוי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11147_20240321095559.jpg"},{"Name":"עידו חן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"רועי אמיר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12658_20250914122411.jpg"},{"Name":"רחלגאולה בוזגלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"רינת סנובל","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"רעות ציפמן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שילת אוחנה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p14671_20251124190648.png"},{"Name":"שירה עוזרי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שמחה שירר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"שמעון הורוויץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p10205_20211106182019.jpg"},{"Name":"שמעון שטיינגרט","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11433_20221212122022.jpg"},{"Name":"תהל שליידר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תמר לוריא","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null}]');
                var Page_ValidationActive = false;
                if (typeof (ValidatorOnLoad) == "function") {
                    ValidatorOnLoad();
                }

                function ValidatorOnSubmit() {
                    if (Page_ValidationActive) {
                        return ValidatorCommonOnSubmit();
                    } else {
                        return true;
                    }
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator8').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator8'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RangeValidator1').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RangeValidator1'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator4').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator4'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RegularExpressionValidator1').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RegularExpressionValidator1'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator5').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator5'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator6').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator6'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RangeValidator3').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RangeValidator3'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RangeValidator4').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RangeValidator4'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator9').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator9'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator7').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator7'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_CustomValidator2').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_CustomValidator2'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator1').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator1'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator2').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator2'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator3').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator3'));
                }

                document.getElementById('ctl00_ContentPlaceHolder1_CompareValidator1').dispose = function() {
                    Array.remove(Page_Validators, document.getElementById('ctl00_ContentPlaceHolder1_CompareValidator1'));
                }
                //]]>
            </script>
        </form>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8c78df7c7c0f484497ecbca7046644da1771523124516" integrity="sha512-8DS7rgIrAmghBFwoOTujcf6D9rXvH8xm8JQ1Ja01h9QX8EzXldiszufYa4IFfKdLUKTTrnSFXLDkUEOTrZQ8Qg==" data-cf-beacon='{"version":"2024.11.0","token":"6cdd2ec92a0f4f5a9b39eeac3526e60b","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
    </body>
</html>
