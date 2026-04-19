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
        <title>מערכת מתנדבי מרחב ירושלים - אבטחות
</title>
        <script src="./js/comboAutocomplete.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            var TypeNameSingle = 'אבטחה';
            var TypeNamePlural = 'אבטחות';

            var hdnACXInfoId = 'ctl00_ctl00_ContentPlaceHolder1_hdnACXInfoId';
            var hdnACXRemove = 'ctl00_ctl00_ContentPlaceHolder1_hdnACXRemove';
            var hdnACXAdd = 'ctl00_ctl00_ContentPlaceHolder1_hdnACXAdd';
            var hfCancelAdminBox = 'ctl00_ctl00_ContentPlaceHolder1_hfCancelAdminBox';
            var hfAdmClick = 'ctl00_ctl00_ContentPlaceHolder1_hfAdmClick';
            var ACXInfo = 'ctl00_ctl00_ContentPlaceHolder1_ACXInfo';
            var ACXRptInfo = 'ctl00_ctl00_ContentPlaceHolder1_ACXRptInfo';
            var btnAdmShibutz = 'ctl00_ctl00_ContentPlaceHolder1_btnAdmShibutz';
            var lblAdmErr = 'ctl00_ctl00_ContentPlaceHolder1_lblAdmErr';
            var lblErr = 'ctl00_ctl00_ContentPlaceHolder1_lblError';
            var idx = 0;

            function showACXInfo(ACXId) {
                document.getElementById(hdnACXInfoId).value = ACXId;
                document.getElementById('ACXPopup').style.display = '';
                __doPostBack(hdnACXInfoId, '');
            }

            function clearACXInfo() {
                try {
                    document.getElementById(ACXInfo).innerHTML = '<b>טוען נתונים, נא להמתין... <img src="/images/loading.gif" /></b>';
                } catch (e) {}
                try {
                    document.getElementById(ACXRptInfo).innerHTML = '<b>טוען נתונים, נא להמתין... <img src="/images/loading.gif" /></b>';
                } catch (e) {}
                try {
                    document.getElementById(lblAdmErr).innerHTML = '';
                } catch (e) {}
                try {
                    document.getElementById(lblErr).innerHTML = '';
                } catch (e) {}

            }

            function hideACXInfo() {
                document.getElementById('ACXPopup').style.display = 'none';
                clearACXInfo();
            }

            function setErrMsg(str) {
                document.getElementById(lblErr).innerHTML = str;
            }

            function hideAdminBox() {
                //document.getElementById("pnlAdminShibutz").style.display = "none";
                document.getElementById('shibutzLoadDiv').style.display = '';
                document.getElementById(hfCancelAdminBox).value = ++idx;
                __doPostBack(hfCancelAdminBox, '');
            }

            function removeClick(cId) {
                var result = confirm("רוצה לבטל שיבוץ ל" + TypeNameSingle + " זו?");
                if (result) {
                    document.getElementById(hdnACXRemove).value = cId;
                    __doPostBack(hdnACXRemove, '');
                    clearACXInfo();
                }
            }

            function cannotRemoveWarning() {
                alert("שים לב! לא ניתן לרדת מ" + TypeNameSingle + " החל מיום לפני המועד שלה\nאם אינך יכול להגיע, חובה עליך להתקשר ולדווח טלפונית למשרד מתנדבים, אחמ''ש. על נהגים לדווח בנוסף לאחראי נהגים.\nאי הודעה טלפונית תחשב כאי הגעה למשמרת אליה נרשמת!!");
            }

            function isLockedWarning() {
                alert("שים לב! לא ניתן לרדת מ" + TypeNameSingle + " מכיוון שהיא נעולה\nאם אינך יכול להגיע, חובה עליך להתקשר ולדווח טלפונית למשרד מתנדבים, אחמ''ש. על נהגים לדווח בנוסף לאחראי נהגים.\nאי הודעה טלפונית תחשב כאי הגעה למשמרת אליה נרשמת!!");
            }

            function removeIsLockedWarningClick(cId) {
                var result = confirm("הנך מנסה לבטל שיבוץ ל" + TypeNameSingle + " שנעולה.\nשים לב כי יש לך הרשאות לבצע פעולה זו אך היא נרשמת במערכת כפעולה חריגה.\nאין לבצע אותה בלי ליידע את כל הגורמים הרלוונטים שכן שינוי כזה עלול לפגוע במבצעיות!!\nהאם לבטל שיבוץ ל" + TypeNameSingle + " זו?");
                if (result) {
                    document.getElementById(hdnACXRemove).value = cId;
                    __doPostBack(hdnACXRemove, '');
                    clearACXInfo();
                }
            }

            function removeWarnClick(cId) {
                var result = confirm("הנך מנסה לבטל שיבוץ ל" + TypeNameSingle + " שהמועד שלה הוא היום או מחר.\nשים לב כי יש לך הרשאות לבצע פעולה זו אך היא נרשמת במערכת כפעולה חריגה.\nאין לבצע אותה בלי ליידע את כל הגורמים הרלוונטים שכן שינוי כזה עלול לפגוע במבצעיות!!\nהאם לבטל שיבוץ ל" + TypeNameSingle + " זו?");
                if (result) {
                    document.getElementById(hdnACXRemove).value = cId;
                    __doPostBack(hdnACXRemove, '');
                    clearACXInfo();
                }
            }

            function showLoading() {
                document.getElementById('loadDiv').style.display = '';
            }

            function btnAdmShibutz_ClientClick() {
                document.getElementById(btnAdmShibutz).value = "המתן...";
                document.getElementById('shibutzLoadDiv').style.display = '';

                //document.getElementById(hfAdmClick).value = 1;
                //__doPostBack(hfAdmClick, '');

            }

            function addClick(cId) {
                var result = confirm("רוצה להשתבץ ל" + TypeNameSingle + " זו?");
                if (result) {
                    document.getElementById(hdnACXAdd).value = cId;
                    __doPostBack(hdnACXAdd, '');
                    clearACXInfo();
                }
            }

            function getReport() {
                __doPostBack('__Page', "lbReportToExcel");
            }
        </script>
        <!-- Users Autocomplete JS -->
        <script language="javascript" type="text/javascript">
            var usersCombo = "#ddlUsers";
            var usersFake = "#ddlAddFake";
            var fakeName = "#txtBoxFakeName";

            $(function() {
                $(usersCombo).combobox();
            });
        </script>
        <!-- End Users Autocomplete JS -->
        <script language="javascript" type="text/javascript">
            nl_link = "https://mda101.org/site_accessibility.html";
            nl_dir = "./js/nl-files/";
            nl_pos = "tr";
        </script>
        <script language="javascript" type="text/javascript" src="./js/nagishli.js?v=2.3" charset="utf-8" defer></script>
    </head>
    <body class="siteBody">
        <form name="aspnetForm" method="post" action="./Avtahot.aspx" id="aspnetForm">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value=""/>
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value=""/>
                <input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value=""/>
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="udXo2b3nlAlUkpP6sRNbkP0+acrMBEaFqwnxomEms96zhR4lavbirVMrImBW1SPnwm7ClndNbTKh5OU3H719QfgbLoptG8NgnvzUsjaGDffy0pwBLiqsfZJCOGQd3IjU3jCJkSqfQ4/5HPVQc8iviWA9JuOEbXhVWfmG2Y7mX33+zfmYRMiCxsuWo4z+S7Sad3lUSEJxXdflUHiWJra+5ZErng9QSeFDpHMNKtXPpWXVr1Kkjbi4RQf/OD0E9I7Hf5lgkjHLCZ8jPlVM9OJAdzcx8IMu6u+EpwZZnBW8z059I6cCvV+zkO95rEeOx4QTAzeBK0xXyySdAECs9WwvAsXno/lknsRGuRCxbfuAFwBn/W/WRi6jSDJDbocYp+POQbYLXZ6iQueAhBYaRaarypKGb4fI4BpPjtSOObIxrjgHV8iDrw0fqSW9gXbYcIBnFT/YRfWRm/76sKUdBgvNpWMCguBmJWwFuvtr9ghDDtMkNlcE70Cm1XBqImQXZb1SjPHPSlkQrYt3ofXQQ/cZX/8FnKqnC9a3kGz7cAp7JkfQ6XVF5CyErhoS2WgujQIh1WIuR2L4Ai8j7+n9UXDdUuuIQD6lKGPL3u7feNDJjo0odeM7sq2PnDPS91xT83oNr+OaHDT0ffp26Mqg7mkZrqItPULU2WBlX5P94VsA/LRKFS52kAqefLfhq/T/y0wXBNiWoigotWZA/VNJ1g5h8K4g00Co/0JGaU6LMVfH5jhZRWOecXRiYcEUcsmhcNpgLQRYL5pIbPHGCOf0+881AjWOgh5VHvvFoBNkC25UrUyZxa3UPgUq1zRCKU1nhFJNj/sR4uUjIoDwtKt5W41KDKJs3+Rb+sq6sY8wHgHPInEGgbpJOMtVwrj/SdLh3VwUt1aHlBhIcR1iy/1BR775SSnnLHrZ6540Ni3WFapRvPl8bscWmLFSKH0KqlO5rHa1WLl9TbEm6OPyA+81SfCAE158I0j3zcg3zJtSagN3FG2nl7d+jEXJnQMHqVzMHsITMbRFyOfDx97v4Ov7muq2NH0KSFpKGfVeQQh875I7cUd0DR3FNs/Vb/yDcUykansp30Hf0W6NNoZZwGWreBAw0dq974Lsortnh86NY6gZxAd1CNb3qRh2u3kHe7P7VqgC"/>
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
                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="30566DD6"/>
                <input type="hidden" name="__PREVIOUSPAGE" id="__PREVIOUSPAGE" value="Zt1ogp9-onG8FCUUNw2gw-rJ3tyo5pXCwL2_Hm8v_bU5gQ841bx5ahT4nm16FyHimrO0Y4BSmNS0aLJiYfM3ZA2"/>
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="LseVWTaSw18X2Qvn9+vaS1aUpcFN7lOj7T6Z7U6wRyKVDysgAUjj99R//CAjq498uolobw4R7MBDeEDSePVdtxKS4hVoEt2pjheABWU1sFoAC6vDEtZtIdZC3VzWQzwnwJP3gDFzKOOeQMZbaQB0tftgqwLl5CeDDAZxWiB27geW2gr5p5HVKCb+B9oOToHDFhPMCsJ7piMShizrNOeE/RQXZfsqgNEl6pJhK+ENkUJN892UIP4jWMYvstgu6lEKZA8fBS8qUmBg9maAKsIRwq19Y2Sy1CViRQRzXFAYEpPwl2u1fMoaqagcE0LqBaodSdkdhriX/P59VT5gdnW97rqnfh5nDIYhnLzyUU7Wjz2MxTJ1T+a+omYdMVp2pqJYzVwFkNeXKkwdSWfXgxKPgTVR0zXCb10avdJE2n9TKBDh5Kv59lEi1PSkVyGOhqW2wbamSk+yUbXr49KXpFR7RofD5zBuiO/nCvIIfbVXvZTG5XbN7o2CO+yJPtxkLHnCPDAqGbbVDWcQm0LDutGJ7cvcrpNbufh+Wu9THinxqfbEkPwoIKFrptKrvp8ageiYOgycLECpiic6LZU7+D34iw=="/>
            </div>
            <script type="text/javascript">
                //<![CDATA[
                Sys.WebForms.PageRequestManager._initialize('ctl00$ctl00$ScriptManager1', 'aspnetForm', ['fctl00$ctl00$ContentPlaceHolder1$up1', '', 'tctl00$ctl00$updpanelMessages', ''], [], [], 90, 'ctl00$ctl00');
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
                <span id="ctl00_ctl00_lblName">אלישבע פריד</span>
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
                                        <a id="ctl00_ctl00_btnShibutz" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$btnShibutz&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Shibutz.aspx&quot;, false, true))">שיבוץ</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_ctl00_btnAvtahot" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$btnAvtahot&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Avtahot.aspx&quot;, false, true))">אבטחות</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_ctl00_btnCourses" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$btnCourses&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Courses.aspx&quot;, false, true))">השתלמויות</a>
                                    </li>
                                    <li id="ctl00_ctl00_libtnDriverLearnerShift">
                                        <a id="ctl00_ctl00_btnDriverLearnerShift" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$btnDriverLearnerShift&quot;, &quot;&quot;, false, &quot;&quot;, &quot;DriverLearnerShift.aspx&quot;, false, true))">השתלמות נהיגה</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_ctl00_btnTrainingQuestionnaires" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$btnTrainingQuestionnaires&quot;, &quot;&quot;, false, &quot;&quot;, &quot;TrainingQuestionnaires.aspx&quot;, false, true))">הכשרות מקצועיות</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a style="color: #0000FF" id="aContact">פניות</a>
                                <ul>
                                    <li>
                                        <a id="ctl00_ctl00_lbContact" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$lbContact&quot;, &quot;&quot;, false, &quot;&quot;, &quot;Contact.aspx&quot;, false, true))">פניות למשרד מתנדבים</a>
                                    </li>
                                    <li>
                                        <a id="ctl00_ctl00_lbContactMonitor" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$lbContactMonitor&quot;, &quot;&quot;, false, &quot;&quot;, &quot;ContactMonitor.aspx&quot;, false, true))">מעקב אחר פניות</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a id="ctl00_ctl00_btnUpdate" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ctl00$btnUpdate&quot;, &quot;&quot;, false, &quot;&quot;, &quot;UpdateDetails.aspx&quot;, false, true))">עדכון פרטים</a>
                            </li>
                            <li>
                                <a id="ctl00_ctl00_btnDisconnect" href="javascript:__doPostBack(&#39;ctl00$ctl00$btnDisconnect&#39;,&#39;&#39;)">יציאה</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="txtSmall center RTLDiv topDavid">
                [אתר זה בחסות : דוד דהן – טכנאי תקשורת ומחשבים – מכירה –שדרוג – ותחזוקה – 0522-895877
        או 
                <a href="/cdn-cgi/l/email-protection#adc9ccdbc4c9edc9c1c9ce83cec283c4c1">
                    <span class="__cf_email__" data-cfemail="741015021d1034101810175a171b5a1d18">[email &#160;protected]</span>
                </a>
                <b>שימו לב:</b>
                בבעיות בנושא האתר יש לפתוח פניה <b>(המספר הינו לתמיכה טכנית בלבד. ש לשלוח וואטסאפ ולא להתקשר. לכל נושא אחר נא התקשרו למשרד מתנדבים.)</b>
                ]
        
            </div>
            <div class="clearFloat">&nbsp;</div>
            <div class="RTLDiv">
                <h1 class="center noPrint">
                    <span id="ctl00_ctl00_ContentPlaceHolder1_lblTitle">שיבוץ לאבטחות</span>
                </h1>
                <div class="blueBox noPrint">
                    <span class="bold" onchange="showLoading();">
                        <input id="ctl00_ctl00_ContentPlaceHolder1_rbUpcoming" type="radio" name="ctl00$ctl00$ContentPlaceHolder1$FilterGroup" value="rbUpcoming" checked="checked"/>
                        <label for="ctl00_ctl00_ContentPlaceHolder1_rbUpcoming">כל האבטחות הקרובות</label>
                    </span>
                    <br/>
                    <span class="bold" onchange="showLoading();">
                        <input id="ctl00_ctl00_ContentPlaceHolder1_rbSearchACX" type="radio" name="ctl00$ctl00$ContentPlaceHolder1$FilterGroup" value="rbSearchACX" onclick="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ctl00$ContentPlaceHolder1$rbSearchACX\&#39;,\&#39;\&#39;)&#39;, 0)"/>
                        <label for="ctl00_ctl00_ContentPlaceHolder1_rbSearchACX">חיפוש אבטחה:</label>
                    </span>
                    &nbsp;<input name="ctl00$ctl00$ContentPlaceHolder1$tbSearchACX" type="text" id="ctl00_ctl00_ContentPlaceHolder1_tbSearchACX" disabled="disabled"/>
                    &nbsp;<input type="submit" name="ctl00$ctl00$ContentPlaceHolder1$btnSearchACXs" value="חפש" id="ctl00_ctl00_ContentPlaceHolder1_btnSearchACXs"/>
                    <br/>
                    <span class="bold" onchange="showLoading();">
                        <input id="ctl00_ctl00_ContentPlaceHolder1_rbVacentACXs" type="radio" name="ctl00$ctl00$ContentPlaceHolder1$FilterGroup" value="rbVacentACXs" onclick="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ctl00$ContentPlaceHolder1$rbVacentACXs\&#39;,\&#39;\&#39;)&#39;, 0)"/>
                        <label for="ctl00_ctl00_ContentPlaceHolder1_rbVacentACXs">הצג רק אבטחות פנויות</label>
                    </span>
                    <br/>
                    <span onchange="showLoading();" style="color:Red;">
                        <input id="ctl00_ctl00_ContentPlaceHolder1_cbSearchHideBloodBank" type="checkbox" name="ctl00$ctl00$ContentPlaceHolder1$cbSearchHideBloodBank" checked="checked" onclick="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ctl00$ContentPlaceHolder1$cbSearchHideBloodBank\&#39;,\&#39;\&#39;)&#39;, 0)"/>
                        <label for="ctl00_ctl00_ContentPlaceHolder1_cbSearchHideBloodBank">לא להציג אבטחות להתרמות בנק הדם</label>
                    </span>
                    <br/>
                    <span onchange="showLoading();" style="color:Red;font-size:Large;">
                        <input id="ctl00_ctl00_ContentPlaceHolder1_cbSearchHideHumanitarian" type="checkbox" name="ctl00$ctl00$ContentPlaceHolder1$cbSearchHideHumanitarian" checked="checked" onclick="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ctl00$ContentPlaceHolder1$cbSearchHideHumanitarian\&#39;,\&#39;\&#39;)&#39;, 0)"/>
                        <label for="ctl00_ctl00_ContentPlaceHolder1_cbSearchHideHumanitarian">לא להציג אבטחות הומניטריות</label>
                    </span>
                    <br/>
                    <img id="loadDiv" style="display: none;" src="/images/loading.gif"/>
                </div>
                <span id="ctl00_ctl00_ContentPlaceHolder1_lblMoreInfo" style="font-size: small;">(לחץ על אבטחה לקבלת עוד פרטים)</span>
                <div id="ctl00_ctl00_ContentPlaceHolder1_ACXsList" class="noPrint">
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24080);">
                        <div class='bold ACXTitle' style='width:320px;'>חזרה ערב יום הזיכרון - הכותל המערבי </div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            19/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            15:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            2<span class='xSmall'>/2</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/3</span>
                            <b>נוער:</b>
                            5<span class='xSmall'>/6</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24045);">
                        <div class='bold ACXTitle' style='width:320px;'>התרמת דם - אפרת</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            19/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            15:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            1<span class='xSmall'>/3</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/6</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>הגעה עצמאית</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24042);">
                        <div class='bold ACXTitle' style='width:320px;'>כניסת קהל טקס משואות - הר הרצל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            19/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            20:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23887);">
                        <div class='bold ACXTitle' style='width:320px;'>חזרה גנרלית טקס המשואות - הר הרצל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            19/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24068);">
                        <div class='bold ACXTitle' style='width:320px;'>ביתר מול חיפה - טדי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            19/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/7</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/10</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/20</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24079);">
                        <div class='bold ACXTitle' style='width:320px;'>צילום תוכנית פטריוטים - צלע ההר 44, מודיעין</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            13:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            15:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            7<span class='xSmall'>/7</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23956);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - הכותל המערבי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            15:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24035);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - גבעת זאב</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23941);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - אלון שבות</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23942);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - קרית ארבע</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23943);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - כפר עציון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            20:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24056);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - בית הלוחם</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23944);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - דניאל ינובסקי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:20
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23945);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - נופי פרת</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23946);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - טלמון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23947);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - דולב</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23948);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - יצחק טוניק</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23949);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - תקוע</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23665);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - החלמית 5</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(24021);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - מתנס גינות העיר עמק רפאים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24064);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - כפר אדומים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24061);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - הר הרצל ברחבת האוניה 462</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24085);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - אנדרטת הר הדר</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            20:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24076);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - בר כוכבא 15מתנס</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23954);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - צור הדסה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23951);">
                        <div class='bold ACXTitle' style='width:320px;'>טקס יום הזיכרון - ככר ספרא</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24086);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - יד אבשלום הר הזיתים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24091);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - הרכס מעלה אדומים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            20/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23873);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - הר הרצל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            05:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            14:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/15</span>
                            <b>חובש:</b>
                            9<span class='xSmall'>/25</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/30</span>
                            <b>אופנוע:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23958);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - קרית ענבים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            06:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            12:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23959);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - כפר עציון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            07:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            13:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23961);">
                        <div class='bold ACXTitle' style='width:320px;'>טקס יום הזיכרון - ככר ספרא</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            07:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            10:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23962);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - הר זיתים עליון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            08:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            12:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23963);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - הר זיתים תחתון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            08:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            12:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23964);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - יד לבנים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            08:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            11:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23965);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - עלי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            12:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23966);">
                        <div class='bold ACXTitle' style='width:320px;'>יום הזיכרון - דולב</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            12:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23952);">
                        <div class='bold ACXTitle' style='width:320px;'>טקס המשואות - הר הרצל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24062);">
                        <div class='bold ACXTitle' style='width:320px;'>רצים לזכרם - הר הדר</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            18:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            3<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24038);">
                        <div class='bold ACXTitle' style='width:320px;'>כניסת קהל טקס משואות - הר הרצל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            20:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23955);">
                        <div class='bold ACXTitle' style='width:320px;'>תפילה שירה בציבור - פארק טדי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            00:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23967);">
                        <div class='bold ACXTitle' style='width:320px;'>חגיגות עצמאות - בית שמש נחל שורק</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            01:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23968);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - אלון שבות</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23969);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - כרמי צור</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24090);">
                        <div class='bold ACXTitle' style='width:320px;'>תפילה לערב יום העצמאות - יהודה הנשיא תיכון דנמרק</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24078);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - יחזקאל סרנה 3 מתנס גבעת מרדכי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23970);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - יצחק טוניק</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            00:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23971);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - אלעזר</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23972);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - כפר עציון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            20:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23973);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - ינובסקי טיילת ארמון הנציב</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23974);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - נחושה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(24013);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - פארק מרכזי בנחושה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24063);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - פארק דניה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23975);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - נווה דניאל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:15
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23977);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - טלמון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23978);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - בית חורון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23979);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - נווה צוף</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXFullBox" onClick="showACXInfo(23980);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - דולב</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>האבטחה מלאה</b>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23981);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - גבע בנימין</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23982);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - כוכב השחר</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23983);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - כוכב יעקב</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23984);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מעלה לבונה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23985);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - אחיה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23986);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - שילה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23987);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - עטרת</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23988);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - קידה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23989);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מכמש</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23990);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - שבות רחל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23991);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מצפה דני</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23992);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - גבעת הראל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23993);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - אלון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            3<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23994);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - נופי פרת</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23995);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - כפר אדומים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23996);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מערת המכפלה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23997);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - צור הדסה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            00:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23998);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - תקוע</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            00:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            3<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23999);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - נוקדים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24071);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מתנס מיתרים ברחוב הרב מימון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            00:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24036);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - בית זית</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:40
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24058);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום הזיכרון - בית זית</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:45
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24067);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - כפר אלדד</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:45
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24048);">
                        <div class='bold ACXTitle' style='width:320px;'>צפי במות ערב עצמאות - זמרים נועה, עידן, עדן..</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            04:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            10<span class='xSmall'>/10</span>
                            <b>חובש:</b>
                            40<span class='xSmall'>/40</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צפי במות - לשאות מול אוריה אוחיון</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24049);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - רזיאל נאור 6</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24072);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מתנס אפרת בדוד המלך</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24073);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - מתנס בר יוחאי 52</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24075);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - נווה אילן הרעות 1</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24084);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - הר הדר</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24088);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - ככר יהלום מעלה אדומים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24089);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - צמח השדה מעלה אדומים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24060);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב יום העצמאות - עלי הכלנית</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24057);">
                        <div class='bold ACXTitle' style='width:320px;'>מסיבת עצמאות - דוד המלך 13 (האוניברסיטה העברית)</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            21/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            21:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            05:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24003);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - קרית ארבע</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            08:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            14:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24087);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - מעלה אדומים</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            08:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            17:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24005);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - כפר עציון</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            13:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24006);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - עין יעל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            14:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'>צוות ישובי</span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24007);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - הרב הרצוג</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            14:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24008);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - שחל</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            14:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24009);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג יום העצמאות - דוד המלך</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            09:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            14:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24010);">
                        <div class='bold ACXTitle' style='width:320px;'>מצד החיים - כותל לככפר ספרא</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            11:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24070);">
                        <div class='bold ACXTitle' style='width:320px;'>ארוע שוטטות עצמאות - ממילא\שער יפו\מגדל דוד</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            14:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24074);">
                        <div class='bold ACXTitle' style='width:320px;'>הפנינג עצמאות - מצפה שלם</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            15:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            21:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23778);">
                        <div class='bold ACXTitle' style='width:320px;'>מסיבת טכנו עצמאות - פארק טדי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            22/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            0<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            0<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24083);">
                        <div class='bold ACXTitle' style='width:320px;'>משחק בוגרים הפועל - ספורטק</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            23/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            16:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            20:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                            <b>נוער:</b>
                            1<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24081);">
                        <div class='bold ACXTitle' style='width:320px;'>מירוץ עלי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            23/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            19:15
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            2<span class='xSmall'>/2</span>
                            <b>נוער:</b>
                            2<span class='xSmall'>/2</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24065);">
                        <div class='bold ACXTitle' style='width:320px;'>נוער ביתר - בייט</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            24/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            07:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            17:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24066);">
                        <div class='bold ACXTitle' style='width:320px;'>נוער נורדיה - הר חומה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            24/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            07:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            12:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            1<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24082);">
                        <div class='bold ACXTitle' style='width:320px;'>משחק הפועל ירושלים - טדי</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            26/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            17:30
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            3<span class='xSmall'>/3</span>
                            <b>נוער:</b>
                            3<span class='xSmall'>/6</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24039);">
                        <div class='bold ACXTitle' style='width:320px;'>אירוע מגדלור - לילה מואר, הספריה הלאומית</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            30/04/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24077);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב לג בעומר, שמואל הנביא 19</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            04/05/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            00:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>חובש:</b>
                            3<span class='xSmall'>/3</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(24092);">
                        <div class='bold ACXTitle' style='width:320px;'>ערב לג בעומר - מתנס מיתרים רחוב יחזקאל סרנה</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            04/05/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            19:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            23:30
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            4<span class='xSmall'>/4</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                    <div class="RTLDiv ACXBox" onClick="showACXInfo(23671);">
                        <div class='bold ACXTitle' style='width:320px;'>טקס יקיר ירושלים - מגדל דוד</div>
                        <span class='ACXText'>
                            <b>תאריך:&nbsp;</b>
                            13/05/2026 &nbsp;<span class='bold'>שעת התחלה:&nbsp;</span>
                            18:00
                        </span>
                        <br/>
                        <span class='ACXText'>
                            <b>סיום משוער:&nbsp;</b>
                            22:00
                        </span>
                        <br/>
                        <span class='avText'>
                            <b>חוסרים:&nbsp;</b>
                            <b>נהג:</b>
                            1<span class='xSmall'>/1</span>
                            <b>חובש:</b>
                            0<span class='xSmall'>/1</span>
                        </span>
                        <br/>
                        <span width='99%' class='remarks'></span>
                    </div>
                </div>
                <div id="ACXPopup" class="darkBlackBackground RTLDiv" style="display: none; overflow: auto;">
                    <br/>
                    <div id="ctl00_ctl00_ContentPlaceHolder1_up1">
                        <div id="ctl00_ctl00_ContentPlaceHolder1_ACXInfo" class="ACXPopup">
                            <b>
                                טוען נתונים, נא להמתין...
                            <img src="/images/loading.gif" alt="Loading..."/>
                            </b>
                        </div>
                        <div class="center">
                            <input type="button" value="סגור" class="bold center" onclick="hideACXInfo();"/>
                        </div>
                        <br/>
                        <br/>
                        <br/>
                        <input type="hidden" name="ctl00$ctl00$ContentPlaceHolder1$hdnACXInfoId" id="ctl00_ctl00_ContentPlaceHolder1_hdnACXInfoId"/>
                        <input type="hidden" name="ctl00$ctl00$ContentPlaceHolder1$hdnACXRemove" id="ctl00_ctl00_ContentPlaceHolder1_hdnACXRemove"/>
                        <input type="hidden" name="ctl00$ctl00$ContentPlaceHolder1$hdnACXAdd" id="ctl00_ctl00_ContentPlaceHolder1_hdnACXAdd"/>
                        <input type="hidden" name="ctl00$ctl00$ContentPlaceHolder1$hdnACXReportId" id="ctl00_ctl00_ContentPlaceHolder1_hdnACXReportId"/>
                        <input type="hidden" name="ctl00$ctl00$ContentPlaceHolder1$hfAdmClick" id="ctl00_ctl00_ContentPlaceHolder1_hfAdmClick"/>
                    </div>
                </div>
            </div>
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js" defer></script>
            <script language="javascript" type="text/javascript">
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_endRequest(function() {
                    // re-bind your jQuery events here (after UpdatePanel returns)
                    $(usersCombo).combobox();
                });
            </script>
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
            <div id="ctl00_ctl00_updpanelMessages">
                <input type="hidden" name="ctl00$ctl00$hdnMasterUserMsgsRemove" id="hdnMasterUserMsgsRemove"/>
                <input type="hidden" name="ctl00$ctl00$hdnMasterUsersReload" id="hdnMasterUsersReload"/>
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
                $(hdnMsgsList).val('[{"mId":"345","mTitle":"שאגת ארי בדיקת זמינות חובשים/בוגרים מרחבי","mMsg":"https://\\u0026#102;orms.gle/cTKee6ZttyDEi9gJA"}]');
                $(hdnUnreadMsgs).val(0);
                $(hdnUsersList).val('[{"Name":"יצחק מזרחי","Gold":true,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p8939_20191029203441.jpg"},{"Name":"אביאל קסיה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p13743_20251011184533.jpg"},{"Name":"אביטל קופפר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"אהרון היימן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12135_20230502090435.jpg"},{"Name":"אוריה זגמן","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":"p6279_20190321001719.jpg"},{"Name":"אלימלך מסלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"אליסף פינץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"אלישבע פריד","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"בניהו שמואלי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"דוב לנדאו","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"הוד בנאלי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"זאב טלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12740_20240310010445.jpg"},{"Name":"חנה דשבסקי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"חנוך גרוס","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"חסד דנציגר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"טליה פישר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יוסי פנט","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"יחיאל שטרן","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p14481_20250828081246.jpg"},{"Name":"יצחק וינר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"יצחק ליכטנשטיין","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11411_20220920092130.jpg"},{"Name":"ישי שחר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"לאה מליק","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"מגד אבורמילה","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"מוריה קניוטו","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"מיכל משה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"נאור סקר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p552_20230505143807.jpg"},{"Name":"נהוראי לוינזון","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13955_20250119194445.jpg"},{"Name":"נועה תירם","Gold":false,"sGold":0,"Noar":0,"Worker":true,"ImgId":null},{"Name":"נתי הלוי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p11147_20240321095559.jpg"},{"Name":"נתנאל הלר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12812_20240203194131.jpg"},{"Name":"עידו חן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":""},{"Name":"רועי אמיר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p12658_20250914122411.jpg"},{"Name":"רחלגאולה בוזגלו","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":null},{"Name":"רעות ציפמן","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שילת אוחנה","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":"p14671_20251124190648.png"},{"Name":"שירה עוזרי","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"שמחה שירר","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":""},{"Name":"שמעון הורוויץ","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p10205_20211106182019.jpg"},{"Name":"תהל שליידר","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תמר לוריא","Gold":false,"sGold":0,"Noar":1,"Worker":false,"ImgId":null},{"Name":"תפארת מורי","Gold":false,"sGold":0,"Noar":0,"Worker":false,"ImgId":"p13283_20240723184611.jpg"}]');
                //]]>
            </script>
        </form>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8c78df7c7c0f484497ecbca7046644da1771523124516" integrity="sha512-8DS7rgIrAmghBFwoOTujcf6D9rXvH8xm8JQ1Ja01h9QX8EzXldiszufYa4IFfKdLUKTTrnSFXLDkUEOTrZQ8Qg==" data-cf-beacon='{"version":"2024.11.0","token":"6cdd2ec92a0f4f5a9b39eeac3526e60b","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
    </body>
</html>
