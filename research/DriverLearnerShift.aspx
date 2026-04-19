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
        <title>מערכת מתנדבי מרחב ירושלים - השתלמות נהיגה
</title>
        <script language="javascript" type="text/javascript" src="./js/scroller.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/scroller.css"/>
        <style type="text/css">
            div#dvScroller ul li {
                color: blue;
                padding: 5px;
                font-size: small;
                font-weight: normal;
                margin-bottom: 5px;
                border-bottom: 3px dotted black;
            }

            div#dvScroller {
                width: 95%;
                margin-bottom: 3px;
                height: 100px;
                direction: rtl;
                text-align: right;
                border: 0px;
                overflow: hidden;
            }
        </style>
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
        <script language="javascript" type="text/javascript">

            function showLoading() {
                document.getElementById('loadDiv').style.display = '';
            }

            function hideLoading() {
                document.getElementById('loadDiv').style.display = 'none';
            }

            function btnNewAv_ClientClick() {
                if (Page_ClientValidate('K')) {
                    showLoading();
                }
            }

            function hideErrorMsg() {
                document.getElementById("pnlError").style.display = 'none';
            }

            $(document).ready(function() {
                $(".txt300").on("keypress", function(e) {
                    if ($(this).val().length >= 300) {
                        $(this).val($(this).val().toString().slice(0, 300));
                        e.preventDefault();
                    }
                });
            });

            $(document).ready(function() {
                $(".txt300").on("paste", function(e) {
                    let paste = (event.clipboardData || window.clipboardData).getData("text");
                    if ($(this).val().length + paste.length >= 300) {
                        let newStr = $(this).val().toString() + paste;
                        $(this).val(newStr.slice(0, 300));
                        e.preventDefault();
                    }
                });
            });
        </script>
    </head>
    <body class="siteBody">
        <form name="aspnetForm" method="post" action="./DriverLearnerShift.aspx" id="aspnetForm">
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
                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="6F300D9A"/>
                <input type="hidden" name="__PREVIOUSPAGE" id="__PREVIOUSPAGE" value="Q_M9RT_ZoBBQaAdlZ6K1YGLEiBcUjI1TvR1LlubTlgkhuJyKg9x6gbNcGJaav5EkRQZshiMmkkHt9u0QEkU9Tyzq3sfO7ZUeAvV2mjdWHJM1"/>
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="40wgxFHcSR/rmL8I5q9hjt2b1AJOc4fbsVy9pa/yUyqhzVKyoIyh/NDzGb5r9DugsFdoYd5RIrD7hicc/fgRYMQ+hWwYiCK5tGK+oqFW+RgeAigi6xWIZ7TL1AFhKZP6Ywd6aE/J0RDfoXFrWR29BxCrdOYVsgsYZEGsvPOjs9ds33TX6QGxv1t49YL6N2HnQYzMLg7Vxobmbi7WoynKrVn8SPwcJ2ZlWvrzRjucN8V6ViPmrHpLSYBYG3ANtvekjsgHquXVMsC1hNBLM0nVHkifRfjiIZPyGl4K8PHmBj50F0sApdKJUafqdxGOi3B81+/kHUjxmr+rHo9obUZmTUMgDaQ/4DCDzTJkdRx0MoU0uYRbHliwD23MRHbX6mQG"/>
            </div>
            <script type="text/javascript">
                //<![CDATA[
                Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'aspnetForm', ['tctl00$ContentPlaceHolder1$up1', '', 'tctl00$updpanelMessages', ''], [], [], 90, 'ctl00');
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
                <a href="/cdn-cgi/l/email-protection#0c686d7a65684c6860686f226f63226560">
                    <span class="__cf_email__" data-cfemail="4d292c3b24290d2921292e632e22632421">[email &#160;protected]</span>
                </a>
                <b>שימו לב:</b>
                בבעיות בנושא האתר יש לפתוח פניה <b>(המספר הינו לתמיכה טכנית בלבד. ש לשלוח וואטסאפ ולא להתקשר. לכל נושא אחר נא התקשרו למשרד מתנדבים.)</b>
                ]
        
            </div>
            <div class="clearFloat">&nbsp;</div>
            <div class="RTLDiv">
                <div id="ctl00_ContentPlaceHolder1_up1">
                    <div id="ctl00_ContentPlaceHolder1_dvOrange" class="orangeBox lfloat RTLDiv" style="width: 30%;">
                        <span class="bold">הודעות:</span>
                        <hr/>
                        <div id="dvScroller" class="scroller" onmouseover="scroller.stopscroll();" onmouseout="scroller.scrollmsg(1);">
                            <ul id="ctl00_ContentPlaceHolder1_ulScrollerData"></ul>
                        </div>
                        <span class="bold">קבצים להורדה:</span>
                        <hr/>
                        <a href="../TrainingFiles/%d7%94%d7%a9%d7%aa%d7%91%d7%a6%d7%95%d7%aa%20%d7%9c%d7%9e%d7%a9%d7%9e%d7%a8%d7%aa%20%d7%94%d7%a2%d7%91%d7%a8%d7%95%d7%aa.pdf">השתבצות למשמרת העברות</a>
                        <br/>
                        <a href="../TrainingFiles/%d7%93%d7%a3%20%d7%94%d7%9b%d7%a9%d7%a8%d7%94%20%d7%a8%d7%a6%20%20%d7%93%d7%a3%20%d7%9c%d7%97%d7%a0%d7%99%d7%9a%20%20%d7%99%d7%a0%d7%95%d7%90%d7%a8%2025.pdf">דף הכשרה רצ  דף לחניך  ינואר 25</a>
                        <br/>
                        <a href="../TrainingFiles/%d7%a9%d7%99%d7%97%d7%aa%20%d7%a4%d7%aa%d7%99%d7%97%d7%94%20%d7%90%d7%9e%d7%91%d7%95%d7%9c%d7%a0%d7%a1%20%20%d7%9e%d7%a9%d7%aa%d7%9c%d7%9e%d7%99%d7%9d%20%d7%99%d7%a0%d7%95%d7%90%d7%a8%2025.pdf">שיחת פתיחה אמבולנס  משתלמים ינואר 25</a>
                        <br/>
                        <a href="../TrainingFiles/%d7%a9%d7%99%d7%97%d7%aa%20%d7%a4%d7%aa%d7%99%d7%97%d7%94%20%20%d7%9e%d7%a9%d7%aa%d7%9c%d7%9e%d7%99%20%d7%a0%d7%94%d7%99%d7%92%d7%94%20-%20%d7%a8%d7%aa%d7%9e%20%d7%99%d7%a0%d7%95%d7%90%d7%a8%2025.pdf">שיחת פתיחה  משתלמי נהיגה - רתמ ינואר 25</a>
                        <br/>
                        <a href="../TrainingFiles/%d7%aa%d7%94%d7%9c%d7%99%d7%9a%20%d7%94%d7%9b%d7%a9%d7%a8%d7%aa%20%d7%a0%d7%94%d7%92%20%d7%95%d7%a8%d7%a6%20%d7%a8%d7%aa%d7%9e.pdf">תהליך הכשרת נהג ורצ רתמ</a>
                        <br/>
                        <a href="../TrainingFiles/%d7%a2%d7%a7%d7%a8%d7%95%d7%a0%d7%95%d7%aa%20%d7%91%d7%a1%d7%99%d7%a1%20%d7%9c%d7%9e%d7%a9%d7%aa%d7%9c%d7%9d%20%d7%a0%d7%94%d7%99%d7%92%d7%94.pdf">עקרונות בסיס למשתלם נהיגה</a>
                        <br/>
                        <br/>
                        <span class="bold">חיפוש נהגים חונכים:</span>
                        <hr/>
                        <span>שם: </span>
                        <input name="ctl00$ContentPlaceHolder1$txtBoxName" type="text" id="ctl00_ContentPlaceHolder1_txtBoxName"/>
                        &nbsp;&nbsp;<input type="submit" name="ctl00$ContentPlaceHolder1$buttonGetDriverTrainers" value="חפש" id="ctl00_ContentPlaceHolder1_buttonGetDriverTrainers"/>
                        <br/>
                        <br/>
                        <center></center>
                    </div>
                    <div class="blueBox" style="float: right;"></div>
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
                $(hdnMsgsList).val('[{"mId":"345","mTitle":"שאגת ארי בדיקת זמינות חובשים/בוגרים מרחבי","mMsg":"https://\\u0026#102;orms.gle/cTKee6ZttyDEi9gJA"}]');
                $(hdnUnreadMsgs).val(0);
                $(hdnUsersList).val('[{"Name":"יצחק מזרחי","Gold":true,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p8939_20191029203441.jpg"},{"Name":"אביאל קסיה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p13743_20251011184533.jpg"},{"Name":"אביטל קופפר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"אהרון היימן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12135_20230502090435.jpg"},{"Name":"אוריה זגמן","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p6279_20190321001719.jpg"},{"Name":"אלימלך מסלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"אליסף פינץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"אלישבע פריד","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"בניהו שמואלי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"דוב לנדאו","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"הוד בנאלי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"זאב טלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12740_20240310010445.jpg"},{"Name":"חנה דשבסקי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"חנוך גרוס","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"חסד דנציגר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"טליה פישר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יוסי פנט","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"יחיאל שטרן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p14481_20250828081246.jpg"},{"Name":"יצחק וינר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יצחק ליכטנשטיין","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11411_20220920092130.jpg"},{"Name":"ישי שחר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"לאה מליק","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"מגד אבורמילה","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"מוריה קניוטו","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מיכל משה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"נאור סקר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p552_20230505143807.jpg"},{"Name":"נהוראי לוינזון","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13955_20250119194445.jpg"},{"Name":"נועה תירם","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"נתי הלוי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11147_20240321095559.jpg"},{"Name":"נתנאל הלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12812_20240203194131.jpg"},{"Name":"עידו חן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"רועי אמיר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12658_20250914122411.jpg"},{"Name":"רחלגאולה בוזגלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"רעות ציפמן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שילת אוחנה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p14671_20251124190648.png"},{"Name":"שירה עוזרי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שמחה שירר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"שמעון הורוויץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p10205_20211106182019.jpg"},{"Name":"תהל שליידר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תמר לוריא","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null}]');
                //]]>
            </script>
        </form>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8c78df7c7c0f484497ecbca7046644da1771523124516" integrity="sha512-8DS7rgIrAmghBFwoOTujcf6D9rXvH8xm8JQ1Ja01h9QX8EzXldiszufYa4IFfKdLUKTTrnSFXLDkUEOTrZQ8Qg==" data-cf-beacon='{"version":"2024.11.0","token":"6cdd2ec92a0f4f5a9b39eeac3526e60b","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
    </body>
</html>
