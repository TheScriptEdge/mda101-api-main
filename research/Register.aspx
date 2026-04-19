

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	רישום משתמש חדש
</title>
    <script src="./js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <link href="./css/main.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#ddlEmail").change(function () { ddlChanged(""); });
            $("#ddlEmail2").change(function () { ddlChanged("2"); });
        })

        var manualEmail = "סיומת אחרת";

        function ddlChanged(elemSuffix) {
            if ($("#ddlEmail" + elemSuffix).val() == manualEmail) {
                $("#ddlEmail" + elemSuffix).hide();
                $("#bldEmail" + elemSuffix).hide();
                $("#spnEmail").text("** הזן ידנית את כתובת האימייל המלאה **");
            }
        }

        function ValidateEULA(sender, args) {
            if (document.getElementById("cbAgreeEULA").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }

    </script>
    <script language="javascript" type="text/javascript">
        nl_link = "https://mda101.org/site_accessibility.html";
        nl_dir = "./js/nl-files/";
        nl_pos = "tr";
    </script>
    <script language="javascript" type="text/javascript" src="./js/nagishli.js?v=2.3" charset="utf-8" defer></script>

</head>
<body>
    <form name="form1" method="post" action="./Register.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
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


<script src="/WebResource.axd?d=x2nkrMJGXkMELz33nwnakLkFUOSfLeet83NpY5lPPQJKVI_u-rx4KP3gq1nDr7vz7uaCabkUu58QE3CoH9YhIZr31Hwny7ghYFCcMAP5Xms1&amp;t=638901881280000000" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
function WebForm_OnSubmit() {
if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
return true;
}
//]]>
</script>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="799CC77D" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="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" />
</div>
        <div class="loginPanel" style="height: 70px;">
            <div class="loginPanel_menubar" style="padding-top: 2px;">
                <div class="lfloat">
                    <h1 class="txtLarge" style="margin-top: 4px;">מערכת מתנדבי מרחב ירושלים - רישום משתמש חדש</h1>
                </div>
                <div class="rfloat">
                    <img src="mdasymbol.gif" style="height: 40px; width: 40px; padding-top: 13px;" alt="מדא"
                        title="מדא" />
                </div>
            </div>
        </div>
        <div class="RTLDiv rfloat">
            <center>
                <table class="alignTable blueBox txtSmall" style="width: 600px;">
                    <tr align="right">
                        <td>
                            <span id="Label1" class="bold">שם פרטי     (בעברית)</span>
                        </td>
                        <td>
                            <input name="tbFname" type="text" id="tbFname" />
                            <span id="RequiredFieldValidator1" style="color:Red;visibility:hidden;">*</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label2" class="bold">שם משפחה (בעברית)</span>
                        </td>
                        <td>
                            <input name="tbLname" type="text" id="tbLname" />
                            <span id="RequiredFieldValidator2" style="color:Red;visibility:hidden;">*</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label9" class="bold">שם משתמש (באנגלית)</span>
                        </td>
                        <td>
                            <input name="tbUser" type="text" id="tbUser" class="LTR" />
                            <span id="RequiredFieldValidator7" style="color:Red;visibility:hidden;">*</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label3" class="bold">כתובת אימייל</span>
                        </td>
                        <td>
                            <div class="LTR">
                                <input name="tbEmail" type="text" id="tbEmail" class="LTR" style="width:100px;" /><b
                                    id="bldEmail">@</b>
                                <select name="ddlEmail" id="ddlEmail" style="width:100px;">
	<option selected="selected" value="בחר סיומת">בחר סיומת</option>
	<option value="012.net.il">012.net.il</option>
	<option value="013.net">013.net</option>
	<option value="017.net.il">017.net.il</option>
	<option value="aol.com">aol.com</option>
	<option value="barak.net.il">barak.net.il</option>
	<option value="bezeqint.net">bezeqint.net</option>
	<option value="dldc.co.il">dldc.co.il</option>
	<option value="gmail.com">gmail.com</option>
	<option value="hotmail.co.uk">hotmail.co.uk</option>
	<option value="hotmail.com">hotmail.com</option>
	<option value="jerusaall.com">jerusaall.com</option>
	<option value="live.com">live.com</option>
	<option value="mda.org.il">mda.org.il</option>
	<option value="nana.co.il">nana.co.il</option>
	<option value="nana10.co.il">nana10.co.il</option>
	<option value="neto.net.il">neto.net.il</option>
	<option value="netvision.net.il">netvision.net.il</option>
	<option value="walla.co.il">walla.co.il</option>
	<option value="walla.com">walla.com</option>
	<option value="windowslive.com">windowslive.com</option>
	<option value="yahoo.com">yahoo.com</option>
	<option value="zahav.net.il">zahav.net.il</option>
	<option value="סיומת אחרת">סיומת אחרת</option>

</select>
                                <span id="RequiredFieldValidator3" style="color:Red;visibility:hidden;">*</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span id="spnEmail" class="xSmall bold" style="color: Purple;">כתוב את ההתחלה ובחר את
                            ההמשך מהרשימה. אם הסיומת לא קיימת ברשימה בחר באפשרות 'סיומת אחרת' והזן ידנית</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label4" class="bold">אישור אימייל</span>
                        </td>
                        <td>
                            <div class="LTR">
                                <input name="tbEmail2" type="text" id="tbEmail2" class="LTR" style="width:100px;" /><b
                                    id="bldEmail2">@</b>
                                <select name="ddlEmail2" id="ddlEmail2" style="width:100px;">
	<option selected="selected" value="012.net.il">012.net.il</option>
	<option value="013.net">013.net</option>
	<option value="017.net.il">017.net.il</option>
	<option value="aol.com">aol.com</option>
	<option value="barak.net.il">barak.net.il</option>
	<option value="bezeqint.net">bezeqint.net</option>
	<option value="dldc.co.il">dldc.co.il</option>
	<option value="gmail.com">gmail.com</option>
	<option value="hotmail.co.uk">hotmail.co.uk</option>
	<option value="hotmail.com">hotmail.com</option>
	<option value="jerusaall.com">jerusaall.com</option>
	<option value="live.com">live.com</option>
	<option value="mda.org.il">mda.org.il</option>
	<option value="nana.co.il">nana.co.il</option>
	<option value="nana10.co.il">nana10.co.il</option>
	<option value="neto.net.il">neto.net.il</option>
	<option value="netvision.net.il">netvision.net.il</option>
	<option value="walla.co.il">walla.co.il</option>
	<option value="walla.com">walla.com</option>
	<option value="windowslive.com">windowslive.com</option>
	<option value="yahoo.com">yahoo.com</option>
	<option value="zahav.net.il">zahav.net.il</option>
	<option value="סיומת אחרת">סיומת אחרת</option>

</select>
                                <span id="RequiredFieldValidator4" style="color:Red;visibility:hidden;">*</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right" class="bold">**וודא כי האימייל תקין, תישלח הודעה לתיבה בכדי לוודא זאת**
                        <span id="CompareValidator1" style="color:Red;visibility:hidden;">כתובת אימייל לא תואמת</span><br />
                            <span id="CompareValidator3" style="color:Red;visibility:hidden;">סיומת אימייל לא תואמת</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label10" class="bold">סלולרי</span>
                        </td>
                        <td>
                            <input name="tbCell" type="text" maxlength="7" id="tbCell" style="width:104px;" />
                            <select name="ddlCellCode" id="ddlCellCode" style="width:65px;">
	<option selected="selected" value="050">050</option>
	<option value="051">051</option>
	<option value="052">052</option>
	<option value="053">053</option>
	<option value="054">054</option>
	<option value="055">055</option>
	<option value="056">056</option>
	<option value="057">057</option>
	<option value="058">058</option>
	<option value="059">059</option>

</select>
                            <span id="RequiredFieldValidator8" style="color:Red;visibility:hidden;">*</span>
                            <span id="RangeValidator1" style="color:Red;visibility:hidden;">*</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label5" class="bold">סיסמא (8 תווים לפחות)</span>&nbsp;<img src="./images/helpico.png" title="לפחות 8 תווים. חובה אות גדולה באנגלית. חובה אות קטנה באנגלית. חובה סיפרה" />
                        </td>
                        <td>
                            <input name="tbPassword" type="password" id="tbPassword" class="LTR" />
                            <span id="rfvPass" style="color:Red;visibility:hidden;">*</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label6" class="bold">אישור סיסמא</span>
                        </td>
                        <td>
                            <input name="tbPassword2" type="password" id="tbPassword2" class="LTR" />
                            <span id="RequiredFieldValidator6" style="color:Red;visibility:hidden;">*</span>
                            <span id="CompareValidator2" style="color:Red;visibility:hidden;">סיסמא לא תואמת</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label7" class="bold">שכונת מגורים*</span>
                        </td>
                        <td>
                            <select name="ddlTeams" id="ddlTeams">
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
	<option value="134">בית שמש - רמה ד</option>
	<option value="124">בית שמש לא פעילים</option>
	<option value="86">בית שמש נוער רמב&quot;ש</option>
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
	<option value="78">חו&quot;ל</option>
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

                        </td>
                    </tr>
                    <tr align="right">
                        <td colspan="2">
                            <span class="xSmall bold">*שים לב כי מדובר בשכונה בה אתה גר. לדוגמה: אל תבחר ב'רוממה' אלא אם אתה גר באמת בשכונה רוממה בירושלים.</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td>
                            <span id="Label12" class="bold">תעודת זהות</span>
                        </td>
                        <td>
                            <input name="tbId" type="text" maxlength="12" id="tbId" class="LTR" />
                            <span id="RequiredFieldValidator9" style="color:Red;visibility:hidden;">*</span>
                        </td>
                    </tr>
                    
                    <tr align="right" style="background: #a3a3ed;">
                        <td>
                            <span id="Label8" class="bold">הכשרות</span>
                        </td>
                        <td>
                            <table id="cblMedical" class="checkList" border="0">
	<tr>
		<td><input id="cblMedical_0" type="checkbox" name="cblMedical$0" /><label for="cblMedical_0">נהג</label></td>
	</tr><tr>
		<td><input id="cblMedical_1" type="checkbox" name="cblMedical$1" /><label for="cblMedical_1">חובש</label></td>
	</tr><tr>
		<td><input id="cblMedical_2" type="checkbox" name="cblMedical$2" /><label for="cblMedical_2">נוער</label></td>
	</tr><tr>
		<td><input id="cblMedical_3" type="checkbox" name="cblMedical$3" /><label for="cblMedical_3">אופנוע</label></td>
	</tr><tr>
		<td><input id="cblMedical_4" type="checkbox" name="cblMedical$4" /><label for="cblMedical_4">חובש בכיר</label></td>
	</tr><tr>
		<td><input id="cblMedical_5" type="checkbox" name="cblMedical$5" /><label for="cblMedical_5">פארמדיק</label></td>
	</tr><tr>
		<td><input id="cblMedical_6" type="checkbox" name="cblMedical$6" /><label for="cblMedical_6">מורשה נטן</label></td>
	</tr><tr>
		<td><input id="cblMedical_7" type="checkbox" name="cblMedical$7" /><label for="cblMedical_7">משתלם נהיגה</label></td>
	</tr><tr>
		<td><input id="cblMedical_8" type="checkbox" name="cblMedical$8" /><label for="cblMedical_8">נהג נטן</label></td>
	</tr><tr>
		<td><input id="cblMedical_9" type="checkbox" name="cblMedical$9" /><label for="cblMedical_9">נהג בימבולנס</label></td>
	</tr><tr>
		<td><input id="cblMedical_10" type="checkbox" name="cblMedical$10" /><label for="cblMedical_10">חובש משתלם</label></td>
	</tr><tr>
		<td><input id="cblMedical_11" type="checkbox" name="cblMedical$11" /><label for="cblMedical_11">סייען מוקד</label></td>
	</tr><tr>
		<td><input id="cblMedical_12" type="checkbox" name="cblMedical$12" /><label for="cblMedical_12">דוגמים</label></td>
	</tr><tr>
		<td><input id="cblMedical_13" type="checkbox" name="cblMedical$13" /><label for="cblMedical_13">אוטובוס</label></td>
	</tr><tr>
		<td><input id="cblMedical_14" type="checkbox" name="cblMedical$14" /><label for="cblMedical_14">פיקנטו</label></td>
	</tr><tr>
		<td><input id="cblMedical_15" type="checkbox" name="cblMedical$15" /><label for="cblMedical_15">4X4</label></td>
	</tr><tr>
		<td><input id="cblMedical_16" type="checkbox" name="cblMedical$16" /><label for="cblMedical_16">טרקטורון</label></td>
	</tr><tr>
		<td><input id="cblMedical_17" type="checkbox" name="cblMedical$17" /><label for="cblMedical_17">רופא</label></td>
	</tr><tr>
		<td><input id="cblMedical_18" type="checkbox" name="cblMedical$18" /><label for="cblMedical_18">מתרים דם בחרום </label></td>
	</tr><tr>
		<td><input id="cblMedical_19" type="checkbox" name="cblMedical$19" /><label for="cblMedical_19">מדריך</label></td>
	</tr><tr>
		<td><input id="cblMedical_20" type="checkbox" name="cblMedical$20" /><label for="cblMedical_20">מיניבוס</label></td>
	</tr><tr>
		<td><input id="cblMedical_21" type="checkbox" name="cblMedical$21" /><label for="cblMedical_21">משתלם פיקנטו</label></td>
	</tr><tr>
		<td><input id="cblMedical_22" type="checkbox" name="cblMedical$22" /><label for="cblMedical_22">מתנדב חול</label></td>
	</tr><tr>
		<td><input id="cblMedical_23" type="checkbox" name="cblMedical$23" /><label for="cblMedical_23">60</label></td>
	</tr><tr>
		<td><input id="cblMedical_24" type="checkbox" name="cblMedical$24" /><label for="cblMedical_24">משתלם פארמדיק</label></td>
	</tr><tr>
		<td><input id="cblMedical_25" type="checkbox" name="cblMedical$25" /><label for="cblMedical_25">נהג ספרינטר</label></td>
	</tr>
</table>
                            <div style="float: left;">
                                <p>
                                    <b>הבהרה:</b><br />
                                    <b>נהג - </b>סמן הכשרה זו רק באם הנך רשאי לנהוג בפועל
                                <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>באמבולנס, במרחב ירושלים</b> (לאחר
                                השתלמויות)!<br />
                                    <b>אופנוע - </b>סמן הכשרה זו רק באם <b>יש ברשותך אופנוע של מד&quot;א</b>
                                </p>
                            </div>
                            <div style="clear: both;">
                            </div>
                        </td>
                    </tr>
                    <tr align="right">
                        <td colspan="2"></td>
                    </tr>
                    <tr align="right">
                        <td colspan="2">
                            <input id="cbAgreeEULA" type="checkbox" name="cbAgreeEULA" /><span>קראתי את <a href="EULA.htm">תקנון האתר</a>, ואני מאשר את תוכנו</span>
                            <span id="CustomValidator2" class="bold" style="color:Red;visibility:hidden;">* יש לאשר את תקנון האתר</span>
                        </td>
                    </tr>
                    <tr align="right">
                        <td colspan="2" align="center">
                            <input type="submit" name="btnRegister" value="הרשם" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;btnRegister&quot;, &quot;&quot;, true, &quot;A&quot;, &quot;&quot;, false, false))" id="btnRegister" style="width:100px;" />
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        
        
        
        <div class="rfloat RTLDiv" style="width: 200px; padding-right: 30px;">
            <p>
                <font color="#FF0000" size="4">לתשומת ליבכם<br />
                    <h3>חשוב! אין להירשם אם הינך חניך בקרוס ועוד לא אושרת רשמית כמתנדב במדא! חשבונך לא יאושר!</h3>
                    כל עוד לא קיבלתם אימייל לתיבת הדואר שלכם שההרשמה בוצעה, <b><i>חשבונכם איננו פעיל</i></b>.<br />
                    <br />
                    שימוש בפרטים שאינם נכונים או שימוש בפרטים מוסתרים לא יאושרו</font>
            </p>
            <p>
                <u><font color="#FF0000" size="5">אנא הקפידו למלא את כל השדות&nbsp; </font></u>
            </p>
        </div>
        <div id="dvRegisterWarn" class="darkenBackgroundAdvanced">
            <br />
            <br />
            <br />
            <div class="errorMsgbox roundCorners RTLDiv">
                <div class="bold errorMsg">
                    הודעה חשובה!
                </div>
                <br />
                <div class="center">
                    הרישום נועד אך ורק למתנדבים <b>שכבר פעילים במד''א</b>.<br />
                    גם אם נאמר לכם אחרת, אין להירשם באתר אם אתם עדיין חניכים בקורס ו/או לא אושרתם רשמית
                כמתנדבים במגן דוד אדום ירושלים.<br />
                    רישום למרות הנחיות אלו יגרום לעיכוב ארוך באפשרות שלכם להתחיל להתנדב אם וכאשר תאושרו
                רשמית להתנדבות!!!!<br />
                </div>
                <input type="button" onclick="$('#dvRegisterWarn').hide();" value="סגור" />
            </div>
        </div>
        

    
<script type="text/javascript">
//<![CDATA[
var Page_Validators =  new Array(document.getElementById("RequiredFieldValidator1"), document.getElementById("RequiredFieldValidator2"), document.getElementById("RequiredFieldValidator7"), document.getElementById("RequiredFieldValidator3"), document.getElementById("RequiredFieldValidator4"), document.getElementById("CompareValidator1"), document.getElementById("CompareValidator3"), document.getElementById("RequiredFieldValidator8"), document.getElementById("RangeValidator1"), document.getElementById("rfvPass"), document.getElementById("RequiredFieldValidator6"), document.getElementById("CompareValidator2"), document.getElementById("RequiredFieldValidator9"), document.getElementById("CustomValidator2"));
//]]>
</script>

<script type="text/javascript">
//<![CDATA[
var RequiredFieldValidator1 = document.all ? document.all["RequiredFieldValidator1"] : document.getElementById("RequiredFieldValidator1");
RequiredFieldValidator1.controltovalidate = "tbFname";
RequiredFieldValidator1.errormessage = "*";
RequiredFieldValidator1.validationGroup = "A";
RequiredFieldValidator1.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator1.initialvalue = "";
var RequiredFieldValidator2 = document.all ? document.all["RequiredFieldValidator2"] : document.getElementById("RequiredFieldValidator2");
RequiredFieldValidator2.controltovalidate = "tbLname";
RequiredFieldValidator2.errormessage = "*";
RequiredFieldValidator2.validationGroup = "A";
RequiredFieldValidator2.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator2.initialvalue = "";
var RequiredFieldValidator7 = document.all ? document.all["RequiredFieldValidator7"] : document.getElementById("RequiredFieldValidator7");
RequiredFieldValidator7.controltovalidate = "tbUser";
RequiredFieldValidator7.errormessage = "*";
RequiredFieldValidator7.validationGroup = "A";
RequiredFieldValidator7.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator7.initialvalue = "";
var RequiredFieldValidator3 = document.all ? document.all["RequiredFieldValidator3"] : document.getElementById("RequiredFieldValidator3");
RequiredFieldValidator3.controltovalidate = "tbEmail";
RequiredFieldValidator3.errormessage = "*";
RequiredFieldValidator3.validationGroup = "A";
RequiredFieldValidator3.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator3.initialvalue = "";
var RequiredFieldValidator4 = document.all ? document.all["RequiredFieldValidator4"] : document.getElementById("RequiredFieldValidator4");
RequiredFieldValidator4.controltovalidate = "tbEmail2";
RequiredFieldValidator4.errormessage = "*";
RequiredFieldValidator4.validationGroup = "A";
RequiredFieldValidator4.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator4.initialvalue = "";
var CompareValidator1 = document.all ? document.all["CompareValidator1"] : document.getElementById("CompareValidator1");
CompareValidator1.controltovalidate = "tbEmail2";
CompareValidator1.errormessage = "כתובת אימייל לא תואמת";
CompareValidator1.validationGroup = "A";
CompareValidator1.evaluationfunction = "CompareValidatorEvaluateIsValid";
CompareValidator1.controltocompare = "tbEmail";
CompareValidator1.controlhookup = "tbEmail";
var CompareValidator3 = document.all ? document.all["CompareValidator3"] : document.getElementById("CompareValidator3");
CompareValidator3.controltovalidate = "ddlEmail2";
CompareValidator3.errormessage = "סיומת אימייל לא תואמת";
CompareValidator3.validationGroup = "A";
CompareValidator3.evaluationfunction = "CompareValidatorEvaluateIsValid";
CompareValidator3.controltocompare = "ddlEmail";
CompareValidator3.controlhookup = "ddlEmail";
var RequiredFieldValidator8 = document.all ? document.all["RequiredFieldValidator8"] : document.getElementById("RequiredFieldValidator8");
RequiredFieldValidator8.controltovalidate = "tbCell";
RequiredFieldValidator8.errormessage = "*";
RequiredFieldValidator8.validationGroup = "A";
RequiredFieldValidator8.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator8.initialvalue = "";
var RangeValidator1 = document.all ? document.all["RangeValidator1"] : document.getElementById("RangeValidator1");
RangeValidator1.controltovalidate = "tbCell";
RangeValidator1.errormessage = "*";
RangeValidator1.validationGroup = "A";
RangeValidator1.type = "Integer";
RangeValidator1.evaluationfunction = "RangeValidatorEvaluateIsValid";
RangeValidator1.maximumvalue = "9999999";
RangeValidator1.minimumvalue = "1111111";
var rfvPass = document.all ? document.all["rfvPass"] : document.getElementById("rfvPass");
rfvPass.controltovalidate = "tbPassword";
rfvPass.errormessage = "*";
rfvPass.validationGroup = "A";
rfvPass.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
rfvPass.initialvalue = "";
var RequiredFieldValidator6 = document.all ? document.all["RequiredFieldValidator6"] : document.getElementById("RequiredFieldValidator6");
RequiredFieldValidator6.controltovalidate = "tbPassword2";
RequiredFieldValidator6.errormessage = "*";
RequiredFieldValidator6.validationGroup = "A";
RequiredFieldValidator6.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator6.initialvalue = "";
var CompareValidator2 = document.all ? document.all["CompareValidator2"] : document.getElementById("CompareValidator2");
CompareValidator2.controltovalidate = "tbPassword2";
CompareValidator2.errormessage = "סיסמא לא תואמת";
CompareValidator2.validationGroup = "A";
CompareValidator2.evaluationfunction = "CompareValidatorEvaluateIsValid";
CompareValidator2.controltocompare = "tbPassword";
CompareValidator2.controlhookup = "tbPassword";
var RequiredFieldValidator9 = document.all ? document.all["RequiredFieldValidator9"] : document.getElementById("RequiredFieldValidator9");
RequiredFieldValidator9.controltovalidate = "tbId";
RequiredFieldValidator9.errormessage = "*";
RequiredFieldValidator9.validationGroup = "A";
RequiredFieldValidator9.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator9.initialvalue = "";
var CustomValidator2 = document.all ? document.all["CustomValidator2"] : document.getElementById("CustomValidator2");
CustomValidator2.errormessage = "* יש לאשר את תקנון האתר";
CustomValidator2.validationGroup = "A";
CustomValidator2.evaluationfunction = "CustomValidatorEvaluateIsValid";
CustomValidator2.clientvalidationfunction = "ValidateEULA";
//]]>
</script>


<script type="text/javascript">
//<![CDATA[

var Page_ValidationActive = false;
if (typeof(ValidatorOnLoad) == "function") {
    ValidatorOnLoad();
}

function ValidatorOnSubmit() {
    if (Page_ValidationActive) {
        return ValidatorCommonOnSubmit();
    }
    else {
        return true;
    }
}
        //]]>
</script>
</form>
    <!-- START Do not modify -->
    <center>
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            try {
                var pageTracker = _gat._getTracker("UA-12938643-1");
                pageTracker._trackPageview();
            } catch (err) { }</script>
        <div id="dataInfor" style="z-index: 105; left: 200px; display: none;" class="footerLogo">
            (C) 2011 - Elad Nahor <a href="http://www.nahor.net">http://www.nahor.net</a><br />
        </div>
    </center>
    <!-- END Do not modify -->
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8c78df7c7c0f484497ecbca7046644da1771523124516" integrity="sha512-8DS7rgIrAmghBFwoOTujcf6D9rXvH8xm8JQ1Ja01h9QX8EzXldiszufYa4IFfKdLUKTTrnSFXLDkUEOTrZQ8Qg==" data-cf-beacon='{"version":"2024.11.0","token":"6cdd2ec92a0f4f5a9b39eeac3526e60b","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}' crossorigin="anonymous"></script>
</body>
</html>
