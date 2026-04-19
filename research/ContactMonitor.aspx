

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><link href="./css/main.css?20240720" rel="stylesheet" type="text/css" /><link href="./css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
    <script src="./js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="./js/ddsmoothmenu.js" type="text/javascript"></script>

    <script type="text/javascript">
        ddsmoothmenu.init({
            mainmenuid: "topMenu", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        });
    </script>
    <!-- bottomBar -->
    <link type="text/css" href="./css/fBar.css" rel="stylesheet" />
    <script type="text/javascript" src="./js/fBar.js"></script>
    <script type="text/javascript" src="./js/jquery.hoverbox.js"></script>
    <!-- QTip -->
    <script type="text/javascript" src="./js/jquery.qtip.min.js"></script>
    <script src="./js/jquery-ui-1.11.0/jquery-ui.min.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="./js/jquery-ui-1.11.0/jquery-ui.theme.min.css" /><link type="text/css" rel="stylesheet" href="./css/qtip.css" />

    <script type="text/javascript">

        function alertOnclick() {
            hideUnreadQtip = 1;
            $('#alertpanel').qtip('hide').qtip('disable');
            $("#bb-alerts-ul").animate({ scrollTop: 0 }, 1);
        }

        function showUnreadMessagesTooltip() {
            $('#alertpanel')
                .qtip(
                    {
                        content:
				        {
				            title: {
				                text: "&nbsp;",
				                button: 'X'
				            },
				            text: "ישנן הודעות 'קרא וחתום' שלא אישרת את קריאתן<BR/>על כל הודעה לחץ על הלינק של 'קראתי' בסוף ההודעה כדי לאשר את קריאתה"
				        },
                        position: {
                            my: 'bottom center', // Use the corner...
                            at: 'top center' // ...and opposite corner
                        },
                        show: {
                            when: false, // Don't specify a show event
                            ready: true // Show the tooltip when ready
                        },
                        hide: false, // Don't specify a hide event
                        style: 'qtip-red qtip-rounded'

                    }).click(alertOnclick); // qTip

            $('#alertpanel a').click(alertOnclick);
        }

        $(document).ready(function () {
            loadBar();
            handleBarUpdate();

            try {
                // Before ajax
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(onBeforeSubmit);

                // Before posting/navigating from page
                $(window).bind('beforeunload', function () {
                    onBeforeSubmit();
                });
            }
            catch (err) {
            }

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
            $("#iframeQuickMsg").load(function () { hideQuickMsgLoading(); });
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
    <title>
	מערכת מתנדבי מרחב ירושלים - מעקב פניות
</title>
    <script language="javascript" type="text/javascript">
        function hideErrorMsg() {
            document.getElementById("pnlError").style.display = 'none';
        }

        function hideNewRemarkMsg() {
            document.getElementById("pnlAddRemark").style.display = 'none';
        }

    </script>
</head>
<body class="siteBody">
    <form name="aspnetForm" method="post" action="./ContactMonitor.aspx" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="xztlU525rN/PIUr3jRMW+SyRLe09WS+CdmsNDvO59kCtQs8tGzuOV5OdSuu8jbXC4AkNlp6L0Z5FUYIjG68yoCkqhEFJbKXk0SsAerQtsKzmOdVN1ibfPBCEFytYyY3cegu89KqK8acDq5Nj/ECBVXbadmwwI2FxeskEQw1bPBBHsp0bNWLYUx+3uyW7SFMw/lXQ+Npq3YtBu0amOxoXQ4aDtuzK0h5OQQEsqRcp3ueWU+6QzibbF0Pr6leILsNcVMwAd5KGR/ZJvQWCKnYn368r1ZT948gaZOnbUrHQStNZGchO0MvU9Hf+qq6Tb4W1NQuEsq6TWg6cVJJBkoq5hCNvS8dEIwUH0mxrv+Ne9cp9i55KCvQ9LqPqKkzJ9GHzz0Qdj4q+YoRm7KvF8gxWIykqHLJe/CyBYEmGyFl6O2U=" />
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

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="73F14868" />
	<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="" />
	<input type="hidden" name="__PREVIOUSPAGE" id="__PREVIOUSPAGE" value="4UYhl_dR2lO3N9MxJXnpdTGIxTTYyPucO8SZb2FRZQ01wrnw_p7qPsNzVGZYbradyMVRO53Jfo9HFN7U-1V_mZZMHhIjE0ysLNdPg3tt-ro1" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="ZSyCdWJVtqCGpRveiWmsBGPkdNl73HddEgD+HIq4clE2lbES+99uepXKFeDkPX4DhUyJtCyTPsFa7JngEKZ+PlMjqOFxRPDMWfgfqO9V/PcJBPOBUqNbD1IuaVJ4ZOGRNsQEXCdHiMuuZJKC63I8Y0E3pmKRYGL2RzGO+f/mCBR584gy7cSrMIMAdr5NI60uimo+zsZ9vLiQjAlNq2bpkpabOernOeABUZWgIBZsR2moodUF1H+OgE6Cpt2lszFwmNciN8yfGc4Fmv6EedA6o5n903mN8hyhicLH2bAHGF8JK/FgwBbw+v8lIa3hyftAHJ+DczofLwun3G3dnaouXQ==" />
</div>
        <script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'aspnetForm', ['tctl00$updpanelMessages',''], [], [], 90, 'ctl00');
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
            function onBeforeSubmit() {
                //$(hdnUsersList).val('');
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
                        $.each(obj, function (idx, data) {

                            total = idx + 1;

                            iSrc = "./images/user.png";
                            iText = "מתנדב";
                            if (!!data.Gold || !!data.sGold) {
                                iSrc = "./images/usergold.png";
                                iText = "מנהל";
                            }
                            else if (!!data.Worker) {
                                iSrc = "./images/usergray.png";
                                iText = "עובד";
                            }
                            else if (!!data.Noar) {
                                iSrc = "./images/userred.png";
                                iText = "נוער";
                            }

                            iText = "<b>" + data.Name + "</b><br/>" + iText;
                            iImg = "";

                            if (data.ImgId) {
                                iText += "<br/><img src='./users/" + data.ImgId + "' style='width:128px;height:128px;'/>";
                                iImg = "<img src='./users/" + data.ImgId + "' style='width:20px;height:20px;'/>"
                            }
                            else {
                                iText += "<br/><img src='./users/noImg.jpg' style='width:128px;height:128px;'/>";
                            }

                            $(onlineul).append('<li title="' + iText + '"><a href="#" onclick="quickMessage(\'' + escape(data.Name) + '\');"><img src="' + iSrc + '" alt="' + iText + '" />' + iImg + data.Name + '</a></li>');
                        });
                    }
                    $(onlineNum).html(total);
                    $('#chatpanel .subpanel li').hoverbox();
                }
                catch (err) { }
            }

            function loadMsgs() {
                try {
                    try {
                        var obj = jQuery.parseJSON($(hdnMsgsList).val());
                    }
                    catch (e) { }
                    var total = 0;

                    if (!!$(alertsul)) {
                        $(alertsul).empty();
                        $(alertsul).addClass("invisible");
                        if (!!obj) {
                            $.each(obj, function (idx, data) {
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
                    }
                    catch (e) { }

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
                    }
                    else {
                        $(alertsNum).hide();
                    }
                }
                catch (err) { }
            }


            function handleMsg(msg) {
                try {
                    clearInterval(msgsShowInt);
                }
                catch (e) { }
                $('#usrMsg_' + msg).parent().hide();
                document.getElementById(hdnUserMsgsRemove).value = msg;
                $(alertsNum).text($(alertsNum).text() - 1);
                if ($(alertsNum).text() <= 0) {
                    $(alertsNum).hide();

                    try {
                        clearInterval(msgsBlinkInt);
                    }
                    catch (e) { }
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
                if (elem.bgFadeInt) window.clearInterval(elem.bgFadeInt);
                var actStep = 0;

                elem.bgFadeInt = window.setInterval(
            function () {

                elem.style.backgroundColor = "rgb(" +
                    easeInOut(startRGB[0], endRGB[0], steps, actStep, powr) + "," +
                    easeInOut(startRGB[1], endRGB[1], steps, actStep, powr) + "," +
                    easeInOut(startRGB[2], endRGB[2], steps, actStep, powr) + ")";
                actStep++;

                if (actStep > steps) {
                    elem.style.backgroundColor = finalColor;
                    window.clearInterval(elem.bgFadeInt);
                }
            }
            , intervals)
            }
            // BGFade - End
        </script>
        <div class="menuPanel">
            <div class="menuPanel_menubar">
                <div class="rfloat txtXSmall center" style="padding: 5px 30px 0 30px;">
                    רזולוציה מומלצת לאתר זה: 1280*1024
                </div>
                <div class="rfloat bold center" style="padding: 0 30px 0 30px;">
                    שלום
                <span id="ctl00_lblName">אלישבע פריד</span>
                </div>
                <div class="lfloat ddsmoothmenu" id="topMenu">
                    <ul>
                        <li><a href="./Welcome.aspx">
                            <img src="../images/homeMenu.png" onmouseover="this.src='../images/homeMenuHover.png';"
                                onmouseout="this.src='../images/homeMenu.png';" /></a> </li>
                        <li><a href="./MessagesFolder.aspx" id='liChatAmount'>
                            <img src="../images/messagesMenu.png" onmouseover="this.src='../images/messagesMenuHover.png';"
                                onmouseout="this.src='../images/messagesMenu.png';" />
                            <span class="notificationCountMsg lfloat roundCorners" id="bb-unread-num" style="display: none;">0</span></a> </li>
                        <li><a style="color: #0000FF" id="aShibutzim">שיבוצים</a>
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
                        <li><a style="color: #0000FF" id="aContact">פניות</a>
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
        או <a href="/cdn-cgi/l/email-protection#482c293e212c082c242c2b662b27662124"><span class="__cf_email__" data-cfemail="a4c0c5d2cdc0e4c0c8c0c78ac7cb8acdc8">[email&#160;protected]</span></a> <b>שימו לב:</b> בבעיות בנושא האתר יש לפתוח פניה <b>(המספר הינו לתמיכה טכנית בלבד. ש לשלוח וואטסאפ ולא להתקשר. לכל נושא אחר נא התקשרו למשרד מתנדבים.)</b>]
        </div>
        <div class="clearFloat">
            &nbsp;
        </div>
        
        
    <div class="RTLDiv center">
        <h2>
            מעקב פניות למשרד מתנדבים</h2>
        <div style="text-align: right;">
            מתנדב יקר!
            <br />
            אם אינך מסופק מאופן הטיפול בפנייתך, באפשרותך <b>להוסיף תגובה לפניה</b> או לפנות ישירות לאחראי
            המתנדבים / יו"ר וועד הסניף.<a href="./Officials.aspx" style="color: Blue;"> לפרטים לחץ
                כאן.</a>
        </div>
        <br />
    </div>
    <div>

</div>
    <br />
    <br />
    
    

        <!-- Quick Message Panel -->
        <div class="darkenBackgroundAdvanced invisible" id="dvQuickMsg">
            <br />
            <br />
            <br />
            <div class="roundCorners center">
                <div style="background: #dadada; width: 600px; height: 420px;" class="center">
                    <iframe src="" id="iframeQuickMsg" frameborder="0" style="width: 600px; height: 420px; z-index: 999;"></iframe>
                    <a onclick="quickMessageHide();" style="position: relative; bottom: 45px;">
                        <img src="../images/closeIcon.png" onmouseover="this.src='../images/closeIconHover.png';"
                            onmouseout="this.src='../images/closeIcon.png';" /></a><img id="quickMsgLoadDiv"
                                src="/images/loading.gif" style="position: relative; bottom: 45px;" />
                </div>
            </div>
        </div>
        <div class="bottomPanelFooter">
        </div>
        <!-- Bottom Bar -->
        <div id="footpanel" class="noPrint">
            <ul id="mainpanel">
                <li><a href="./Welcome.aspx" class="home"><small>עמוד ראשי</small></a></li>
                
                <li><a href="./Contact.aspx" class="contactButton"><small>פניות למשרד מתנדבים</small></a></li>
                <li></li>
                <li><a href="./UpdateDetails.aspx" class="updateDetailsButton"><small>עדכון פרטים</small></a></li>
                <li></li>
                <li></li>
                <li><a href="./Shibutz.aspx" class="shibutzButton"><small>שיבוצים</small></a></li>
                <li><a href="./Avtahot.aspx" class="avtahotButton"><small>אבטחות</small></a></li>
                <li><a href="./Courses.aspx" class="coursesButton"><small>השתלמויות</small></a></li>
                
                <li><a href="./TestsResults.aspx" class="testsButton"><small>תוצאות מבחנים</small></a></li>
                <li id="alertpanel"><a href="#" class="alerts"><span class="notificationCount lfloat"
                    id="bb-alerts-num" style="display: none;">0</span>הודעות ועדכונים</a>
                    <div class="subpanel">
                        <h3>
                            <span>&ndash; </span>הודעות ועדכונים</h3>
                        <div id="alertSubPanelUnread" class="invisible unreadSubpanel center">
                        </div>
                        <ul id="bb-alerts-ul">
                            <li class="view"><a href="#">אין הודעות חדשות</a></li>
                        </ul>
                    </div>
                </li>
                <li id="chatpanel"><a href="#" class="chat">מחוברים (<strong id="bb-online-num">0</strong>)</a>
                    <div class="subpanel">
                        <h3>
                            <span>&ndash; </span>מי מחובר</h3>
                        <ul id="bb-online-ul">
                        </ul>
                    </div>
                </li>
                <li id="mailButton"><span class="notificationCountMsg lfloat roundCorners" id="mailButton-unread-num"
                    style="display: none;">0</span><a href="./MessagesFolder.aspx" class="mailButton"><small>תיבת
                    דואר</small></a></li>
                <li><a href="./KraHatom.aspx" class="kraHatomButton"><small>היסטוריית קרא וחתום</small></a></li>
                <li><a href="./Officials.aspx" class="officialsButton"><small>בעלי תפקידים</small></a></li>
                <li><a href="./Forms.aspx" class="formsButton"><small>טפסים שימושיים</small></a></li>
                <li><a href="./Faq.aspx" class="helpButton"><small>שאלות נפוצות</small></a></li>
            </ul>
        </div>
        <div id="ctl00_updpanelMessages">
	
                <input type="hidden" name="ctl00$hdnMasterUserMsgsRemove" id="hdnMasterUserMsgsRemove" />
                <input type="hidden" name="ctl00$hdnMasterUsersReload" id="hdnMasterUsersReload" />
                <input type="hidden" id="hdnMasterUsersList" />
                <input type="hidden" id="hdnMsgsList" />
                <input type="hidden" id="hdnUnreadMsgs" />
            
</div>
        <div id="bottomPanelFooter" class="clearFloat">
            &nbsp;
        </div>
        <!-- START Do not modify -->
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js" defer></script><script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));

            try {
                var pageTracker = _gat._getTracker("UA-12938643-1");
                pageTracker._trackPageview();
            } catch (err) { }
        </script>
        <div id="dataInfor" style="z-index: 105; left: 200px; display: none;" class="footerLogo">
            (C) 2012 - Elad Nahor <a href="http://www.nahor.net">http://www.nahor.net</a><br />
        </div>
        <!-- END Do not modify -->
    

<script type="text/javascript">
//<![CDATA[
$(hdnMsgsList).val('[{"mId":"345","mTitle":"שאגת ארי בדיקת זמינות חובשים/בוגרים מרחבי","mMsg":"https://\\u0026#102;orms.gle/cTKee6ZttyDEi9gJA"}]');$(hdnUnreadMsgs).val(0);$(hdnUsersList).val('[{"Name":"יצחק מזרחי","Gold":true,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p8939_20191029203441.jpg"},{"Name":"אביאל קסיה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p13743_20251011184533.jpg"},{"Name":"אביב נורני","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"אביטל קופפר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"אהרון היימן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12135_20230502090435.jpg"},{"Name":"אוריה זגמן","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p6279_20190321001719.jpg"},{"Name":"אלימלך מסלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"אלישבע פריד","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"בניהו שמואלי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"דוב לנדאו","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"הוד בנאלי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"זאב טלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12740_20240310010445.jpg"},{"Name":"חנה דשבסקי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"חנוך גרוס","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"חסד דנציגר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"טליה פישר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יחיאל שטרן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p14481_20250828081246.jpg"},{"Name":"יצחק וינר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יצחק ליכטנשטיין","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11411_20220920092130.jpg"},{"Name":"ישי שחר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"לאה מליק","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"מגד אבורמילה","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"מוריה קניוטו","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מיכאלחיים פרומקין","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מיכל משה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"נאור סקר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p552_20230505143807.jpg"},{"Name":"נהוראי לוינזון","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13955_20250119194445.jpg"},{"Name":"נועה תירם","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"נתי הלוי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11147_20240321095559.jpg"},{"Name":"עידו חן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"רועי אמיר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12658_20250914122411.jpg"},{"Name":"רחלגאולה בוזגלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"רינת סנובל","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"רעות ציפמן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שילת אוחנה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p14671_20251124190648.png"},{"Name":"שירה עוזרי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שמחה שירר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"שמעון הורוויץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p10205_20211106182019.jpg"},{"Name":"שמעון שטיינגרט","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11433_20221212122022.jpg"},{"Name":"תהל שליידר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תמר לוריא","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null}]');//]]>
</script>
</form>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8c78df7c7c0f484497ecbca7046644da1771523124516" integrity="sha512-8DS7rgIrAmghBFwoOTujcf6D9rXvH8xm8JQ1Ja01h9QX8EzXldiszufYa4IFfKdLUKTTrnSFXLDkUEOTrZQ8Qg==" data-cf-beacon='{"version":"2024.11.0","token":"6cdd2ec92a0f4f5a9b39eeac3526e60b","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
</body>
</html>
