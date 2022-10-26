/*
    -------------------------------------------------------------------------
    JavaScript Form Validator (gen_validatorv4.js)
    Version 4.0
    Copyright (C) 2003-2011 JavaScript-Coder.com. All rights reserved.
    You can freely use this script in your Web pages.
    You may adapt this script for your own needs, provided these opening credit
    lines are kept intact.
        
    The Form validation script is distributed free from JavaScript-Coder.com
    For updates, please visit:
    http://www.javascript-coder.com/html-form/javascript-form-validation.phtml

    Questions & comments please send to form.val (at) javascript-coder.com
    -------------------------------------------------------------------------  
*/

function Validator(frmname)
{
	 
    this.validate_on_killfocus = false;
    this.formobj = document.forms[frmname];
    if (!this.formobj)
    {
    	 
        alert("Error: couldnot get Form object " + frmname);
        
    }
    if (this.formobj.onsubmit)
    {
    	 
    	 
        this.formobj.old_onsubmit = this.formobj.onsubmit;
        this.formobj.onsubmit = null;
        return;
    }
    else
    {
    	 
        this.formobj.old_onsubmit = null;
        
    }
    this.formobj._sfm_form_name = frmname;

    this.formobj.onsubmit = form_submit_handler;
    this.addValidation = add_validation;

    this.formobj.addnlvalidations = new Array();
    this.addAddnlValidationFunction = add_addnl_vfunction;
    this.formobj.runAddnlValidations = run_addnl_validations;
    this.setAddnlValidationFunction = set_addnl_vfunction;// for backward
															// compatibility


    this.clearAllValidations = clear_all_validations;
    this.focus_disable_validations = false;

    document.error_disp_handler = new sfm_ErrorDisplayHandler();

    this.EnableOnPageErrorDisplay = validator_enable_OPED;
    this.EnableOnPageErrorDisplaySingleBox = validator_enable_OPED_SB;

    this.show_errors_together = false;
    this.EnableMsgsTogether = sfm_enable_show_msgs_together;
    document.set_focus_onerror = true;
    this.EnableFocusOnError = sfm_validator_enable_focus;

    this.formobj.error_display_loc = 'right';
    this.SetMessageDisplayPos = sfm_validator_message_disp_pos;

    this.formobj.DisableValidations = sfm_disable_validations;
    this.formobj.validatorobj = this;
    
}


function sfm_validator_enable_focus(enable)
{
    document.set_focus_onerror = enable;
}

function add_addnl_vfunction()
{
    var proc =
    {
    };
    proc.func = arguments[0];
    proc.arguments = [];

    for (var i = 1; i < arguments.length; i++)
    {
        proc.arguments.push(arguments[i]);
    }
    this.formobj.addnlvalidations.push(proc);
}

function set_addnl_vfunction(functionname)
{
    if(functionname.constructor == String)
    {
        alert("Pass the function name like this: validator.setAddnlValidationFunction(DoCustomValidation)\n "+
            "rather than passing the function name as string");
        return;
    }
    this.addAddnlValidationFunction(functionname);
}


function run_addnl_validations()
{
    var ret = true;
    for (var f = 0; f < this.addnlvalidations.length; f++)
    {
        var proc = this.addnlvalidations[f];
        var args = proc.arguments || [];
        if (!proc.func.apply(null, args))
        {
            ret = false;
        }
    }
    return ret;
}

function sfm_set_focus(objInput)
{
    if (document.set_focus_onerror)
    {
        if (!objInput.disabled && objInput.type != 'hidden')
        {
            objInput.focus();
        }
    }
}

function sfm_disable_validations()
{
	 
    if (this.old_onsubmit)
    {
    	 
        this.onsubmit = this.old_onsubmit;
    }
    else
    {
    	 
        this.onsubmit = null;
    }
}

function sfm_enable_show_msgs_together()
{
    this.show_errors_together = true;
    this.formobj.show_errors_together = true;
}

function sfm_validator_message_disp_pos(pos)
{
    this.formobj.error_display_loc = pos;
}

function clear_all_validations()
{
    for (var itr = 0; itr < this.formobj.elements.length; itr++)
    {
        this.formobj.elements[itr].validationset = null;
    }
}

function form_submit_handler()
{
    var bRet = true;
    document.error_disp_handler.clear_msgs();
    for (var itr = 0; itr < this.elements.length; itr++)
    {
        if (this.elements[itr].validationset && !this.elements[itr].validationset.validate())
        {
            bRet = false;
        }
        if (!bRet && !this.show_errors_together)
        {
            break;
        }
    }

    if (this.show_errors_together || bRet && !this.show_errors_together)
    {
        if (!this.runAddnlValidations())
        {
            bRet = false;
        }
    }
    if (!bRet)
    {
        document.error_disp_handler.FinalShowMsg();
        return false;
    }
    return true;
}

function add_validation(itemname, descriptor, errstr)
{
	 
    var condition = null;
    if (arguments.length > 3)
    {
        condition = arguments[3];
    }
    if (!this.formobj)
    {
        alert("Error: The form object is not set properly");
        return;
    } // if
    var itemobj = this.formobj[itemname];

    if (itemobj.length && isNaN(itemobj.selectedIndex))
    // for radio button; don't do for 'select' item
    {
        itemobj = itemobj[0];
    }
    if (!itemobj)
    {
        alert("Error: Couldnot get the input object named: " + itemname);
        return;
    }
    if (true == this.validate_on_killfocus)
    {
        itemobj.onblur = handle_item_on_killfocus;
    }
    if (!itemobj.validationset)
    {
        itemobj.validationset = new ValidationSet(itemobj, this.show_errors_together);
    }
    itemobj.validationset.add(descriptor, errstr, condition);
    itemobj.validatorobj = this;
}

function handle_item_on_killfocus()
{
    if (this.validatorobj.focus_disable_validations == true)
    {
        /*
		 * To avoid repeated looping message boxes
		 */
        this.validatorobj.focus_disable_validations = false;
        return false;
    }

    if (null != this.validationset)
    {
        document.error_disp_handler.clear_msgs();
        if (false == this.validationset.validate())
        {
            document.error_disp_handler.FinalShowMsg();
            return false;
        }
    }
}

function validator_enable_OPED()
{
    document.error_disp_handler.EnableOnPageDisplay(false);
}

function validator_enable_OPED_SB()
{
    document.error_disp_handler.EnableOnPageDisplay(true);
}

function sfm_ErrorDisplayHandler()
{
    this.msgdisplay = new AlertMsgDisplayer();
    this.EnableOnPageDisplay = edh_EnableOnPageDisplay;
    this.ShowMsg = edh_ShowMsg;
    this.FinalShowMsg = edh_FinalShowMsg;
    this.all_msgs = new Array();
    this.clear_msgs = edh_clear_msgs;
}

function edh_clear_msgs()
{
    this.msgdisplay.clearmsg(this.all_msgs);
    this.all_msgs = new Array();
}

function edh_FinalShowMsg()
{
    if (this.all_msgs.length == 0)
    {
        return;
    }
    this.msgdisplay.showmsg(this.all_msgs);
}

function edh_EnableOnPageDisplay(single_box)
{
    if (true == single_box)
    {
        this.msgdisplay = new SingleBoxErrorDisplay();
    }
    else
    {
        this.msgdisplay = new DivMsgDisplayer();
    }
}

function edh_ShowMsg(msg, input_element)
{
    var objmsg = new Array();
    objmsg["input_element"] = input_element;
    objmsg["msg"] = msg;
    this.all_msgs.push(objmsg);
}

function AlertMsgDisplayer()
{
    this.showmsg = alert_showmsg;
    this.clearmsg = alert_clearmsg;
}

function alert_clearmsg(msgs)
{

}

function alert_showmsg(msgs)
{
    var whole_msg = "";
    var first_elmnt = null;
    for (var m = 0; m < msgs.length; m++)
    {
        if (null == first_elmnt)
        {
            first_elmnt = msgs[m]["input_element"];
        }
        whole_msg += msgs[m]["msg"] + "\n";
    }

    alert(whole_msg);

    if (null != first_elmnt)
    {
        sfm_set_focus(first_elmnt);
    }
}

function sfm_show_error_msg(msg, input_elmt)
{
    document.error_disp_handler.ShowMsg(msg, input_elmt);
}

function SingleBoxErrorDisplay()
{
    this.showmsg = sb_div_showmsg;
    this.clearmsg = sb_div_clearmsg;
}

function sb_div_clearmsg(msgs)
{
    var divname = form_error_div_name(msgs);
    sfm_show_div_msg(divname, "");
}

function sb_div_showmsg(msgs)
{
    var whole_msg = "<div class='err' style='width:700px;border:solid 1px #800000;'><ul  class='TickList'>\n";
    for (var m = 0; m < msgs.length; m++)
    {
        whole_msg += "<li>" + msgs[m]["msg"] + "</li>\n";
    }
    whole_msg += "</ul></div>";
    var divname = form_error_div_name(msgs);
    var anc_name = divname + "_loc";
    whole_msg = "<table border='0' ><tr><td><a name='" + anc_name + "' >" + whole_msg;

    sfm_show_div_msg(divname, whole_msg);

    window.location.hash = anc_name;
}

function form_error_div_name(msgs)
{
    var input_element = null;

    for (var m in msgs)
    {
        input_element = msgs[m]["input_element"];
        if (input_element)
        {
            break;
        }
    }

    var divname = "";
    if (input_element)
    {
        divname = input_element.form._sfm_form_name + "_errorloc";
    }

    return divname;
}

function sfm_show_div_msg(divname,msgstring)
{
   if(divname.length<=0) return false;

   if(document.layers)
   {
      divlayer = document.layers[divname];
        if(!divlayer){return;}
      divlayer.document.open();
      divlayer.document.write(msgstring);
      divlayer.document.close();
   }
   else
   if(document.all)
   {
      divlayer = document.all[divname];
        if(!divlayer){return;}
      divlayer.innerHTML=msgstring;
   }
   else
   if(document.getElementById)
   {
      divlayer = document.getElementById(divname);
        if(!divlayer){return;}
      divlayer.innerHTML =msgstring;
   }
   divlayer.style.visibility="visible";   
   return false;
}

function DivMsgDisplayer()
{
    this.showmsg = div_showmsg;
    this.clearmsg = div_clearmsg;
}

function div_clearmsg(msgs)
{
    for (var m in msgs)
    {
        var divname = element_div_name(msgs[m]["input_element"]);
        show_div_msg(divname, "");
    }
}

function element_div_name(input_element)
{
    var divname = input_element.form._sfm_form_name + "_" + input_element.name + "_errorloc";

    divname = divname.replace(/[\[\]]/gi, "");

    return divname;
}

function div_showmsg(msgs)
{
    var whole_msg;
    var first_elmnt = null;
    for (var m in msgs)
    {
        if (null == first_elmnt)
        {
            first_elmnt = msgs[m]["input_element"];
        }
        var divname = element_div_name(msgs[m]["input_element"]);
        show_div_msg(divname, msgs[m]["msg"]);
    }
    if (null != first_elmnt)
    {
        sfm_set_focus(first_elmnt);
    }
}

function show_div_msg(divname, msgstring)
{
    if (divname.length <= 0) return false;

    if (document.layers)
    {
        divlayer = document.layers[divname];
        if (!divlayer)
        {
            return;
        }
        divlayer.document.open();
        divlayer.document.write(msgstring);
        divlayer.document.close();
    }
    else if (document.all)
    {
        divlayer = document.all[divname];
        if (!divlayer)
        {
            return;
        }
        divlayer.innerHTML = msgstring;
    }
    else if (document.getElementById)
    {
        divlayer = document.getElementById(divname);
        if (!divlayer)
        {
            return;
        }
        divlayer.innerHTML = msgstring;
    }
    divlayer.style.visibility = "visible";
}

function ValidationDesc(inputitem, desc, error, condition)
{
    this.desc = desc;
    this.error = error;
    this.itemobj = inputitem;
    this.condition = condition;
    this.validate = vdesc_validate;
}

function vdesc_validate()
{
  
    if (this.condition != null)
    {
    	 
        if (!eval(this.condition))
        {
        	  
            return true;
        }
    }
   
    if (!validateInput(this.desc, this.itemobj, this.error))
    {
    	 
        this.itemobj.validatorobj.focus_disable_validations = true;
        sfm_set_focus(this.itemobj);
        return false;
    }
    
    return true;
}

function ValidationSet(inputitem, msgs_together)
{
    this.vSet = new Array();
    this.add = add_validationdesc;
    this.validate = vset_validate;
    this.itemobj = inputitem;
    this.msgs_together = msgs_together;
}

function add_validationdesc(desc, error, condition)
{
    this.vSet[this.vSet.length] =
    new ValidationDesc(this.itemobj, desc, error, condition);
}

function vset_validate()
{
    var bRet = true;
    for (var itr = 0; itr < this.vSet.length; itr++)
    {
        bRet = bRet && this.vSet[itr].validate();
        if (!bRet && !this.msgs_together)
        {
            break;
        }
    }
    return bRet;
}

/*
 * checks the validity of an email address entered returns true or false
 */
function validateEmail(email)
{
    var splitted = email.match("^(.+)@(.+)$");
    if (splitted == null) return false;
    if (splitted[1] != null)
    {
        var regexp_user = /^\"?[\w-_\.]*\"?$/;
        if (splitted[1].match(regexp_user) == null) return false;
    }
    if (splitted[2] != null)
    {
        var regexp_domain = /^[\w-\.]*\.[A-Za-z]{2,4}$/;
        if (splitted[2].match(regexp_domain) == null)
        {
            var regexp_ip = /^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
            if (splitted[2].match(regexp_ip) == null) return false;
        } // if
        return true;
    }
    return false;
}

function TestComparison(objValue, strCompareElement, strvalidator, strError)
{
    var bRet = true;
    var objCompare = null;
    if (!objValue.form)
    {
        sfm_show_error_msg("Error: No Form object!", objValue);
        return false
    }
    objCompare = objValue.form.elements[strCompareElement];
    if (!objCompare)
    {
        sfm_show_error_msg("Error: Element with name" + strCompareElement + " not found !", objValue);
        return false;
    }

    var objval_value = objValue.value;
    var objcomp_value = objCompare.value;

    if (strvalidator != "eqelmnt" && strvalidator != "neelmnt")
    {
        objval_value = objval_value.replace(/\,/g, "");
        objcomp_value = objcomp_value.replace(/\,/g, "");

        if (isNaN(objval_value))
        {
            sfm_show_error_msg(objValue.name + ": Should be a number ", objValue);
            return false;
        } // if
        if (isNaN(objcomp_value))
        {
            sfm_show_error_msg(objCompare.name + ": Should be a number ", objCompare);
            return false;
        } // if
    } // if
    var cmpstr = "";
    switch (strvalidator)
    {
    case "eqelmnt":
        {
            if (objval_value != objcomp_value)
            {
                cmpstr = " should be equal to ";
                bRet = false;
            } // if
            break;
        } // case
    case "ltelmnt":
        {
            if (eval(objval_value) >= eval(objcomp_value))
            {
                cmpstr = " should be less than ";
                bRet = false;
            }
            break;
        } // case
    case "leelmnt":
        {
            if (eval(objval_value) > eval(objcomp_value))
            {
                cmpstr = " should be less than or equal to";
                bRet = false;
            }
            break;
        } // case
    case "gtelmnt":
        {
            if (eval(objval_value) <= eval(objcomp_value))
            {
                cmpstr = " should be greater than";
                bRet = false;
            }
            break;
        } // case
    case "geelmnt":
        {
            if (eval(objval_value) < eval(objcomp_value))
            {
                cmpstr = " should be greater than or equal to";
                bRet = false;
            }
            break;
        } // case
    case "neelmnt":
        {
            if (objval_value.length > 0 && objcomp_value.length > 0 && objval_value == objcomp_value)
            {
                cmpstr = " should be different from ";
                bRet = false;
            } // if
            break;
        }
    } // switch
    if (bRet == false)
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + cmpstr + objCompare.name;
        } // if
        sfm_show_error_msg(strError, objValue);
    } // if
    return bRet;
}

function TestSelMin(objValue, strMinSel, strError)
{
    var bret = true;
    var objcheck = objValue.form.elements[objValue.name];
    var chkcount = 0;
    if (objcheck.length)
    {
        for (var c = 0; c < objcheck.length; c++)
        {
            if (objcheck[c].checked == "1")
            {
                chkcount++;
            } // if
        } // for
    }
    else
    {
        chkcount = (objcheck.checked == "1") ? 1 : 0;
    }
    var minsel = eval(strMinSel);
    if (chkcount < minsel)
    {
        if (!strError || strError.length == 0)
        {
            strError = "Please Select atleast" + minsel + " check boxes for" + objValue.name;
        } // if
        sfm_show_error_msg(strError, objValue);
        bret = false;
    }
    return bret;
}

function TestSelMax(objValue, strMaxSel, strError)
{
    var bret = true;
    var objcheck = objValue.form.elements[objValue.name];
    var chkcount = 0;
    if (objcheck.length)
    {
        for (var c = 0; c < objcheck.length; c++)
        {
            if (objcheck[c].checked == "1")
            {
                chkcount++;
            } // if
        } // for
    }
    else
    {
        chkcount = (objcheck.checked == "1") ? 1 : 0;
    }
    var maxsel = eval(strMaxSel);
    if (chkcount > maxsel)
    {
        if (!strError || strError.length == 0)
        {
            strError = "Please Select atmost " + maxsel + " check boxes for" + objValue.name;
        } // if
        sfm_show_error_msg(strError, objValue);
        bret = false;
    }
    return bret;
}

function IsCheckSelected(objValue, chkValue)
{
    var selected = false;
    var objcheck = objValue.form.elements[objValue.name];
    if (objcheck.length)
    {
        var idxchk = -1;
        for (var c = 0; c < objcheck.length; c++)
        {
            if (objcheck[c].value == chkValue)
            {
                idxchk = c;
                break;
            } // if
        } // for
        if (idxchk >= 0)
        {
            if (objcheck[idxchk].checked == "1")
            {
                selected = true;
            }
        } // if
    }
    else
    {
        if (objValue.checked == "1")
        {
            selected = true;
        } // if
    } // else
    return selected;
}

function TestDontSelectChk(objValue, chkValue, strError)
{
    var pass = true;
    pass = IsCheckSelected(objValue, chkValue) ? false : true;

    if (pass == false)
    {
        if (!strError || strError.length == 0)
        {
            strError = "Can't Proceed as you selected " + objValue.name;
        } // if
        sfm_show_error_msg(strError, objValue);

    }
    return pass;
}

function TestShouldSelectChk(objValue, chkValue, strError)
{
    var pass = true;

    pass = IsCheckSelected(objValue, chkValue) ? true : false;

    if (pass == false)
    {
        if (!strError || strError.length == 0)
        {
            strError = "You should select" + objValue.name;
        } // if
        sfm_show_error_msg(strError, objValue);

    }
    return pass;
}

function TestRequiredInput(objValue, strError)
{
	
    var ret = true;
    if (VWZ_IsEmpty(objValue.value))
    {
        ret = false;
    } // if
    else if (objValue.getcal && !objValue.getcal())
    {
        ret = false;
    }
 
   

    if (!ret)
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + " : Required Field";
        } // if
        sfm_show_error_msg(strError, objValue);
    }
    return ret;
}

function TestZero(objValue, strError){
	var txtVal =objValue.value;
	 
 
		 if(objValue.value <=0 ){
	    	 
		    	ret = false;
		    }
      
	    if (!ret)
	    {
	        if (!strError || strError.length == 0)
	        {
	            strError = objValue.name + " : Required Field";
	        } // if
	        sfm_show_error_msg(strError, objValue);
	    }
	    return ret;
}

function TestFileExtension(objValue, cmdvalue, strError)
{
    var ret = false;
    var found = false;

    if (objValue.value.length <= 0)
    { // The 'required' validation is not done here
        return true;
    }

    var extns = cmdvalue.split(";");
    for (var i = 0; i < extns.length; i++)
    {
        ext = objValue.value.substr(objValue.value.length - extns[i].length, extns[i].length);
        ext = ext.toLowerCase();
        if (ext == extns[i])
        {
            found = true;
            break;
        }
    }
    if (!found)
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + " allowed file extensions are: " + cmdvalue;
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    }
    else
    {
        ret = true;
    }
    return ret;
}

function TestMaxLen(objValue, strMaxLen, strError)
{
    var ret = true;
    if (eval(objValue.value.length) > eval(strMaxLen))
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + " : " + strMaxLen + " characters maximum ";
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}

function TestMinLen(objValue, strMinLen, strError)
{
    var ret = true;
    if (eval(objValue.value.length) < eval(strMinLen) && eval(objValue.value.length) > 0)
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + " : " + strMinLen + " characters minimum  ";
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}

function TestInputType(objValue, strRegExp, strError, strDefaultError)
{
    var ret = true;

    var charpos = objValue.value.search(strRegExp);
    if (objValue.value.length > 0 && charpos >= 0)
    {
        if (!strError || strError.length == 0)
        {
            strError = strDefaultError;
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}

function TestEmail(objValue, strError)
{
    var ret = true;
    if (objValue.value.length > 0 && !validateEmail(objValue.value))
    {
        if (!strError || strError.length == 0)
        {
            strError = "Email Address is not valid (For Eg., name@domine.com)";
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}
function mobileNoZero(objValue, strError)
{
	 
    var ret = true;
    if (objValue.value <= 0 && objValue.value != "")
    {        
        sfm_show_error_msg(strError, objValue);
        ret = false;
    }  
    return ret;
}




function TestDate(objValue, strError)
{
    var ret = true;
    var re_date = /^\s*(\d{1,2})\/(\d{1,2})\/(\d{2,4})\s*$/;
 
		
	if (!re_date.exec(objValue.value) && objValue.value != '')
    { 
		strError = "Invalid date: '" + objValue.value + "'.\nAccepted format is mm/dd/yyyy.";                                                 
		sfm_show_error_msg(strError, objValue);
		 ret = false;
    }        
        
       
 
    return ret;
}


function TestLessThan(objValue, strLessThan, strError)
{
    var ret = true;
    var obj_value = objValue.value.replace(/\,/g, "");
    strLessThan = strLessThan.replace(/\,/g, "");

    if (isNaN(obj_value))
    {
        sfm_show_error_msg(objValue.name + ": Should be a number ", objValue);
        ret = false;
    } // if
    else if (eval(obj_value) >= eval(strLessThan))
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + " : value should be less than " + strLessThan;
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}

function TestGreaterThan(objValue, strGreaterThan, strError)
{
    var ret = true;
    var obj_value = objValue.value.replace(/\,/g, "");
    strGreaterThan = strGreaterThan.replace(/\,/g, "");

    if (isNaN(obj_value))
    {
        sfm_show_error_msg(objValue.name + ": Should be a number ", objValue);
        ret = false;
    } // if
    else if (eval(obj_value) <= eval(strGreaterThan))
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + " : value should be greater than " + strGreaterThan;
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}

function TestRegExp(objValue, strRegExp, strError)
{
    var ret = true;
    if (objValue.value.length > 0 && !objValue.value.match(strRegExp))
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + ": Invalid characters found ";
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    } // if
    return ret;
}

function TestDontSelect(objValue, dont_sel_value, strError)
{
    var ret = true;
    if (objValue.value == null)
    {
        sfm_show_error_msg("Error: dontselect command for non-select Item", objValue);
        ret = false;
    }
    else if (objValue.value == dont_sel_value)
    {
        if (!strError || strError.length == 0)
        {
            strError = objValue.name + ": Please Select one option ";
        } // if
        sfm_show_error_msg(strError, objValue);
        ret = false;
    }
    return ret;
}

function TestSelectOneRadio(objValue, strError)
{
    var objradio = objValue.form.elements[objValue.name];
    var one_selected = false;
    for (var r = 0; r < objradio.length; r++)
    {
        if (objradio[r].checked == "1")
        {
            one_selected = true;
            break;
        }
    }
    if (false == one_selected)
    {
        if (!strError || strError.length == 0)
        {
            strError = "Please select one option from " + objValue.name;
        }
        sfm_show_error_msg(strError, objValue);
    }
    return one_selected;
}

function TestSelectRadio(objValue, cmdvalue, strError, testselect)
{
    var objradio = objValue.form.elements[objValue.name];
    var selected = false;

    for (var r = 0; r < objradio.length; r++)
    {
        if (objradio[r].value == cmdvalue && objradio[r].checked == "1")
        {
            selected = true;
            break;
        }
    }
    if (testselect == true && false == selected || testselect == false && true == selected)
    {
        sfm_show_error_msg(strError, objValue);
        return false;
    }
    return true;
}


// * Checks each field in a form
 
function compPass(){
 
	  var frm = document.forms["emppasschange"];
	   
	  if(frm.txtNewPwd.value != frm.txtNewPwdConf.value){
	    sfm_show_error_msg('The Confirm Password and New password does not match!',frm.txtNewPwdConf);
	    return false;
	  }else{
	    return true;
	  }
	}

function compGodPass(){
	 
	  var frm = document.forms["addempfrm"];
	   
	  if(frm.txtUserPassword.value != frm.txtConfUserPassword.value){
	    sfm_show_error_msg('The Confirm Password and New password does not match!',frm.txtUserPassword);
	    return false;
	  }else{
	    return true;
	  }
	}

function compEmail(){
	 
	  var frm = document.forms["chgEmailFrm"];
	   
	  if(frm.txtEmpEmailID.value != frm.txtEmpReEmailID.value){
	    sfm_show_error_msg('Email IDs does not match!',frm.txtEmpReEmailID);
	    return false;
	  }else{
	    return true;
	  }
	}

function searchPageClient(){
	 var frm = document.forms["mngclient"];
	 
	 var clientID =  frm.txtClientID.value;
	 var firstName = frm.txtFirstName.value;
	 var lastName =  frm.txtLastName.value;
	 var mobileNO = frm.txtMobileNo.value;
	 var panNO = frm.txtPanNo.value;
	 var tinNO = frm.txtTinNo.value; 
	 
	 var elems = document.getElementsByTagName("input"); 
	 var counter = 0;
     for(var i=0; i< elems.length; i++) 
     { 
    	
    	 if(elems[i].type == "text" && elems[i].value == ""){     	
    		 counter = counter+1;  	 
    	 }
     }
     if(counter = 0 && counter > 1){
    	 sfm_show_error_msg('Please enter only one Selection criteria!',frm.txtClientID);
     }
     alert(counter);
	
}

function compPassProdSet(){
	 
	  var frm = document.forms["editProdSetFrm"];
	   
	  if(frm.txtConfMailPassword.value != frm.txtMailPassword.value){
	    
	    return false;
	  }else{
	    return true;
	  }
	}
function addClientDateChk(){
	 var frm = document.forms["addcltmgmtfrm"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth();
	 
     var selecteddate = frm.txtDateOfBirth.value;
	 var splitDate = selecteddate.split("/");
	 var selday = splitDate[0];
	 var selMon = splitDate[1]-1;
	 var selyear = splitDate[2];
 
  
  
  var currDate = new Date(today.getFullYear(), month, today.getDate()); 
  var selDate = new Date(selyear, selMon, selday);
  
	  if(selDate > currDate){ 
	    sfm_show_error_msg('Date of Birth should not be greater than Todays date',frm.txtDateOfBirth);
	    return false;
	  }else{
	    return true;
	  }	
		  
 }
function addIncDateChk(){
	 var frm = document.forms["addcaseinfofrm"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth();
	 
    var selecteddate = frm.txtPaymentdate.value;
	 var splitDate = selecteddate.split("/");
	 var selday = splitDate[0];
	 var selMon = splitDate[1]-1;
	 var selyear = splitDate[2];

 
 
 var currDate = new Date(today.getFullYear(), month, today.getDate()); 
 var selDate = new Date(selyear, selMon, selday);
 
	  if(selDate > currDate){ 
	    sfm_show_error_msg('Payment Date should not be greater than Todays date',frm.txtPaymentdate);
	    return false;
	  }else{
	    return true;
	  }	
		  
}
 


function selFromDate(){
	 
	var frm = document.forms["searchJudgments"]; 
	var txtfromDate = frm.txtfromDate.value;
	var txttoDate = frm.txttoDate.value;
	
	 
	if(txtfromDate != ""){
		if(txttoDate == ""){
			sfm_show_error_msg('Please enter To Date',frm.txttoDate);
			return false;
		}else{
			return true;
		}		
	}else {
		return true;
	}
	
}

function yearValidationEmp(){
	var frm = document.forms["addempfrm"]; 
	var fromDate = frm.txtDateofBirth.value;
	var todate = frm.txtDateofJoining.value;	
	 

	var strFromDate   = fromDate;
	var strToDate     = todate; 
	if (!(checkIsGreaterDate(strFromDate,strToDate)))
	{		 
		sfm_show_error_msg('Date of Joining cannot be earlier than Date of Birth',frm.txtDateofJoining);		 
		return false;
	}else{
		return true;
	}
	
	
}

 
 
function yearValidationFamDate(){
 	var frm = document.forms["addfaminfo"]; 
	var fromDate = frm.txtDateofBirth.value;    /* Date of Birth */
	var todate = frm.txtMarriageDate.value;	    /* Marriage Date here */

	 
	if(fromDate != "" && todate != ""){
		 
		var strFromDate   = fromDate;
		var strToDate     = todate; 
		if (!(checkIsGreaterDate(strFromDate,strToDate)))
		{		 
			sfm_show_error_msg('Date of Marriage cannot be earlier than Date of Birth',frm.txtDateofBirth);		 
			return false;
		}else{
			return true;
		}
	}



	if(fromDate != "" && todate == ""){
		 
		var strFromDate   = fromDate; 
		 var today = new Date();	 
		 var month =  today.getMonth();
		 
	   
		 var splitDate = strFromDate.split("/");
		 var selday = splitDate[0];
		 var selMon = splitDate[1]-1;
		 var selyear = splitDate[2];



			var currDate = new Date(today.getFullYear(), month, today.getDate()); 
			var selDate = new Date(selyear, selMon, selday);

		  if(selDate > currDate){ 
		    sfm_show_error_msg('Date of Birth cannot be greater than current date',frm.txtDateofBirth);
		    return false;
		  }else{
		    return true;
		  }	 
	}
	
	if(fromDate == "" && todate != ""){
		var strToDate   = todate; 
		 var today = new Date();	 
		 var month =  today.getMonth();
		 
	   
		 var splitDate = strFromDate.split("/");
		 var selday = splitDate[0];
		 var selMon = splitDate[1]-1;
		 var selyear = splitDate[2];



			var currDate = new Date(today.getFullYear(), month, today.getDate()); 
			var selDate = new Date(selyear, selMon, selday);

		  if(selDate > currDate){ 
		    sfm_show_error_msg('Marriage date cannot be greater than current date',frm.txtDateofBirth);
		    return false;
		  }else{
		    return true;
		  }	 
	}
	
	
	if(fromDate == "" && todate == ""){
		 
		    return true;
		 
	}
	

}
	function chkOtherField(){
		 var frm = document.forms["addfaminfo"]; 
		var relType = frm.txtRelationType.value;
		var other = frm.txtOther.value;
		 
		if(relType == "OTHERS" && other == ''){
			sfm_show_error_msg('Please enter value in other',frm.txtOther);
		    return false;
		}else{
			return true;
		}
	}

 
function yearValidationEmpEdit(){
	var frm = document.forms["editempfrm"]; 
	var fromDate = frm.txtDateofBirth.value;
	var todate = frm.txtDateofJoining.value;	
	 

	var strFromDate   = fromDate;
	var strToDate     = todate; 
	if (!(checkIsGreaterDate(strFromDate,strToDate)))
	{		 
		sfm_show_error_msg('Date of Joining cannot be earlier than Date of Birth',frm.txtDateofJoining);		 
		return false;
	}
	
}

function toDateValidationExpDet(){
	 var frm = document.forms["mngexpdet"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth();
	 
   var selecteddate = frm.txtToDate.value;
	 var splitDate = selecteddate.split("/");
	 var selday = splitDate[0];
	 var selMon = splitDate[1]-1;
	 var selyear = splitDate[2];



var currDate = new Date(today.getFullYear(), month, today.getDate()); 
var selDate = new Date(selyear, selMon, selday);

	  if(selDate > currDate){ 
	    sfm_show_error_msg('To Date should not be greater than Todays date',frm.txtToDate);
	    return false;
	  }else{
	    return true;
	  }	
		  
}

function toDateValidationReminder(){
	 var frm = document.forms["addreminder"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth();
	 
  var selecteddate = frm.txtReminderDate.value;
	 var splitDate = selecteddate.split("/");
	 var selday = splitDate[0];
	 var selMon = splitDate[1]-1;
	 var selyear = splitDate[2];



var currDate = new Date(today.getFullYear(), month, today.getDate()); 
var selDate = new Date(selyear, selMon, selday);

	  if(selDate < currDate){ 
	    sfm_show_error_msg('Reminder Date should not be less than Todays date',frm.txtReminderDate);
	    return false;
	  }else{
	    return true;
	  }	
		  
}
function yearValidationExpDet(){
	
	var frm = document.forms["mngexpdet"]; 
	var fromDate = frm.txtFromDate.value;
	var todate = frm.txtToDate.value;	
	var one_day=1000*60*60*24;
	var numofdays; 

	var strFromDate   = fromDate;
	var strToDate     = todate; 
	if (!(checkIsGreaterDate(strFromDate,strToDate)))
	{		 
		sfm_show_error_msg('From Date should not be greater than To Date',frm.txtToDate);		 
		return false;
	}

	fromyear = strFromDate.substring(6,10);
	frommonth = strFromDate.substring(3,5)-1;
	fromday = strFromDate.substring(0,2);

	toyear = strToDate.substring(6,10);
	tomonth = strToDate.substring(3,5)-1;
	today = strToDate.substring(0,2); 

	var intFromDate = new Date(fromyear,frommonth,fromday);
	var intToDate = new Date(toyear,tomonth,today);
	numofdays = Math.ceil((intToDate.getTime()-intFromDate.getTime())/(one_day));
	if (numofdays > 365){
		sfm_show_error_msg('Date range cannot be more than one year',frm.txtToDate);
		 return false;
	}else{
		 return true;
	}
	
}
	
function yearValidationJudgment(){
	
	var frm = document.forms["searchJudgments"]; 
	
	/*var today = new Date();	 
	 var month =  today.getMonth();
	 var currDate = new Date(today.getFullYear(), month, today.getDate()); 
	
	 
  var selectedFromdate = frm.txtfromDate.value;
	 var splitFromDate = selectedFromdate.split("/");
	 var selFromday = splitFromDate[1];
	 var selFromMon = splitFromDate[0];
	 var selFromyear = splitFromDate[2];

	 var selectedTodate = frm.txttoDate.value;
	 var splitToDate = selectedTodate.split("/");
	 var selToday = splitToDate[1];
	 var selToMon = splitToDate[0];
	 var selToyear = splitToDate[2];

	
	var selFromDate = new Date(selFromyear, selFromMon, selFromday);
	var selToDate = new Date(selToyear, selToMon, selToday);
	 alert(selToday+"--"+selToMon+"--"+selToyear);
	alert(selToDate +"====="+currDate);
	  if(selFromDate > currDate){ 
	    sfm_show_error_msg('From Date should not be greater than Todays date',frm.txtfromDate);
	    return false;
	  } 
	
	  if(selToDate > currDate){ 
		    sfm_show_error_msg('To Date should not be greater than Todays date',frm.txttoDate);
		    return false;
		  } 
   
	*/
	
	
	var fromDate = frm.txtfromDate.value;
	var todate = frm.txttoDate.value;
	 
	var one_day=1000*60*60*24;
	var numofdays; 

	var strFromDate   = fromDate;
	var strToDate     = todate; 
	
	 
	fromyear = strFromDate.substring(6,10);
	frommonth = strFromDate.substring(3,5)-1;
	fromday = strFromDate.substring(0,2);

	toyear = strToDate.substring(6,10);
	tomonth = strToDate.substring(3,5)-1;
	today = strToDate.substring(0,2); 

	var intFromDate = new Date(fromyear,frommonth,fromday);
	var intToDate = new Date(toyear,tomonth,today);
	numofdays = Math.ceil((intToDate.getTime()-intFromDate.getTime())/(one_day));
	
	
	if(strFromDate != "" && strToDate != ""){
	
		if (!(checkIsGreaterDate(strFromDate,strToDate)))
		{		 
			sfm_show_error_msg('From Date should not be greater than To Date',frm.txtfromDate);		 
			return false;
		}
    } 

	if(strFromDate != "" && strToDate == ""){	
		 		 
		sfm_show_error_msg('Please enter To Date',frm.txtfromDate);		 
		return false;
		 
	}

	if(strFromDate == "" && strToDate != ""){	
 		 
		sfm_show_error_msg('Please enter From Date',frm.txtfromDate);		 
		return false;
		 
	}

    
	if (numofdays > 365){
		sfm_show_error_msg('Date range cannot be more than one year',frm.txttoDate);
		 return false;
	} else{
		 return true;
	}
	
	
	
	
		
	
}	

 

function searchJudgment(){
	
	var frm = document.forms["searchJudgments"]; 
	
	 
	var txtsupCourt = frm.supCourt.value;
	var txthighCourt = frm.highCourt.value;
	var txtotherCourt = frm.otherCourt.value;
	var txtjudgmntKeyWord = frm.judgmntKeyWord.value;
	 
		if(txtsupCourt == "" && txthighCourt == "" && txtotherCourt == ""  && txtjudgmntKeyWord == ""){
			 
			sfm_show_error_msg('Please select any search Criteria below',frm.judgmntKeyWord);
			 return false;
		}else if(txtjudgmntKeyWord != ""){
			return true;
			 
		}else{
			 
			 return true;
		} 
		
		
}
	
 

function checkIsGreaterDate(date1,date2)
{
	 
	dt1=getDateObject(date1,"/"); 
	dt2=getDateObject(date2,"/"); 

	if(dt1>dt2){
		return false;
	}else{		
		return true;
	}
}

function getDateObject(dateString,dateSeperator) 
{ 	
	var curValue	=	dateString; 
	var sepChar		=	dateSeperator; 
	var curPos		=	0; 
	var cDate,cMonth,cYear; 	
/*curPos	=	dateString.indexOf(sepChar); 
	alert("curPos : "+curPos);
	cDate	=	dateString.substring(0,curPos); 
	alert("cDate : "+cDate);
	//extract month portion 
	endPos	=	dateString.indexOf(sepChar,curPos+1); 
	alert("endPos : "+endPos);
	cMonth=dateString.substring(curPos+1,endPos); 
	alert("cMonth : "+cMonth);
	//extract year portion 
	curPos	=	endPos; 
	cMonth	=	curPos+5; 
	alert("cMonth : "+cMonth);
	cYear	=	curValue.substring(curPos+1,endPos);
	alert("cYear : "+cYear);*/
	
	cYear = dateString.substring(6,10);
	cMonth = dateString.substring(3,5)-1;
	cDate = dateString.substring(0,2); 
	//Create Date Object 
	dtObject	=	new Date(cYear,cMonth,cDate); 
 
	return dtObject; 
}
function selToDate(){
	 
	var frm = document.forms["searchJudgments"]; 
	var txtfromDate = frm.txtfromDate.value;
	var txttoDate = frm.txttoDate.value;
	
	 
	if(txttoDate != ""){
		if(txtfromDate == ""){
			sfm_show_error_msg('Please enter From Date',frm.txtfromDate);
			return false;
		}else{
			return true;
		}		
	}else {
		return true;
	}
	
}


function editOppCheck(){
	 
	 var frm = document.forms["editOppDet"]; 
	 var oppcnt = frm.txtCounter.value;

	   var ret = 0;
	   var strRegExp = "[^A-Za-z\\s]";
	   var numRegExp = "[^0-9\\s]";
	   var straddrRegExp = "[\\,]";  
	 if(oppcnt>0){		
		 for(var i= 1;i<=oppcnt ;i++){
			 
			 var oppPartyName = 'oppPartyName'+i;
			 var oppPartyOrgName = 'oppPartyOrgName'+i;
			 var oppPartyLawyerName = 'oppPartyLawyerName'+i;
			 
			 var oppPartEmailId = 'oppPartEmailId'+i;
			 var oppPartyOrgEmailId = 'oppPartyOrgEmailId'+i;
			 var oppPartyLawyerEmailId = 'oppPartyLawyerEmailId'+i;
			 
			 
			 var oppPartMobileNo = 'oppPartyMobNo'+i;
			 var oppPartyOrgMobileNo = 'oppPartyOrgMobNo'+i;
			 var oppPartyLawyerMobileNo = 'oppPartyLawyerMobNo'+i;
			 
			 
			 var oppPartyTelNo = 'oppPartyTelNo'+i;
			 var oppPartyOrgTelNo = 'oppPartyOrgTelNo'+i;
			 var oppPartyOrgTelNo = 'oppPartyLawyerTelNo'+i;
			 
			 var oppPartyAddress = 'oppPartyAddress'+i;
			 var oppPartyOrgAddress = 'oppPartyOrgAddress'+i;
			 var oppPartyLawyerAddress = 'oppPartyLawyerAddress'+i;
			  
			 
			 if((document.getElementById(oppPartyName).value == "") && (document.getElementById(oppPartyOrgName).value == "") && (document.getElementById(oppPartyLawyerName).value == "") ){
				 sfm_show_error_msg('Enter  Opponent Name(Opponent/Organization/Lawyer)',frm.txtCounter);
				 ret = 1;
			 }else{
				 ret = 0;
			 }
			 
			 
			    var addrpos1 =document.getElementById(oppPartyAddress).value.search(straddrRegExp);
			    if (document.getElementById(oppPartyAddress).value.length > 0 && addrpos1 >= 0)
			    {
			        strError = 'Opposite Party Address should not contain comma(,).' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var addrpos2 =document.getElementById(oppPartyOrgAddress).value.search(straddrRegExp);
			    if (document.getElementById(oppPartyOrgAddress).value.length > 0 && addrpos2 >= 0)
			    {
			        strError = 'Opposite Party Org Address should not contain comma(,).' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var addrpos3 =document.getElementById(oppPartyLawyerAddress).value.search(straddrRegExp);
			    if (document.getElementById(oppPartyLawyerAddress).value.length > 0 && addrpos3 >= 0)
			    {
			        strError = 'Opposite Party Lawyer Address should not contain comma(,).' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			 
			 
			 
			 
			    var charpos1 =document.getElementById(oppPartyName).value.search(strRegExp);
			    if (document.getElementById(oppPartyName).value.length > 0 && charpos1 >= 0)
			    {
			        strError = 'Opposite Party name can contain only letters' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var charpos2 =document.getElementById(oppPartyOrgName).value.search(strRegExp);
			    if (document.getElementById(oppPartyOrgName).value.length > 0 && charpos2 >= 0)
			    {
			        strError = 'Opposite Party Org name can contain only letters' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var charpos3 =document.getElementById(oppPartyLawyerName).value.search(strRegExp);
			    if (document.getElementById(oppPartyLawyerName).value.length > 0 && charpos3 >= 0)
			    {
			        strError = 'Opposite Party Lawyer name can contain only letters' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			     
			    
			    var numpos1 =document.getElementById(oppPartMobileNo).value.search(numRegExp);
			    if (document.getElementById(oppPartMobileNo).value.length > 0 && numpos1 >= 0)
			    {
			        strError = 'Opposite Party Mobile No can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var numpos2 =document.getElementById(oppPartyOrgMobileNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyOrgMobileNo).value.length > 0 && numpos2 >= 0)
			    {
			        strError = 'Opposite Party Org Mobile No can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var numpos3 =document.getElementById(oppPartyLawyerMobileNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyLawyerMobileNo).value.length > 0 && numpos3 >= 0)
			    {
			        strError = 'Opposite Party Lawyer Mobile No can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    
			    if (document.getElementById(oppPartMobileNo).value.length < 10 && document.getElementById(oppPartMobileNo).value.length  > 0)
			    {
			        strError = 'Opposite Party Mobile No should contain a minimum of 10 digit' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			   
			    if (document.getElementById(oppPartyOrgMobileNo).value.length < 10 && document.getElementById(oppPartyOrgMobileNo).value.length > 0)
			    {
			        strError = 'Opposite Party Org Mobile No should contain a minimum of 10 digit' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			   
			    if (document.getElementById(oppPartyLawyerMobileNo).value.length < 10 && document.getElementById(oppPartyLawyerMobileNo).value.length > 0)
			    {
			        strError = 'Opposite Party Lawyer Mobile No should contain a minimum of 10 digit' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			     
			    
			    var telnumpos1 =document.getElementById(oppPartyTelNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyTelNo).value.length > 0 && telnumpos1 >= 0)
			    {
			        strError = 'Opposite Party Tel No can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var telnumpos2 =document.getElementById(oppPartyOrgTelNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyOrgTelNo).value.length > 0 && telnumpos1 >= 0)
			    {
			        strError = 'Opposite Party Org Tel No can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var telnumpos3 =document.getElementById(oppPartyOrgTelNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyOrgTelNo).value.length > 0 && telnumpos1 >= 0)
			    {
			        strError = 'Opposite Party Lawyer Tel No can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }   
			    
			 
			 if (document.getElementById(oppPartEmailId).value.length > 0 && !validateEmail(document.getElementById(oppPartEmailId).value))
			    { 
				   strError = 'Opp Party Email Address is not valid';				        
			        sfm_show_error_msg(strError, frm.txtCounter);
			        ret = 1;
			    } 
			    if (document.getElementById(oppPartyOrgEmailId).value.length > 0 && !validateEmail(document.getElementById(oppPartyOrgEmailId).value))
			    { 
			    	strError = 'Opp Party Org Email Address is not valid';				        
			        sfm_show_error_msg(strError, frm.txtCounter);
			        ret = 1;
			    } 
			    if (document.getElementById(oppPartyLawyerEmailId).value.length > 0 && !validateEmail(document.getElementById(oppPartyLawyerEmailId).value))
			    {
			    	strError = 'Opp Party Lawyer Email Address is not valid';			         
			        sfm_show_error_msg(strError, frm.txtCounter);
			        ret = 1;
			    } 		 
			    
			    
			    
		 }
		 
		 if(ret == 1){
			return false; 
		 }else{
			 
			 return true; 
		 }
		 
		 
	 }else{
		 
		 return true;
	 }
	  
	 
		  
}
function addOppCheck(){
	 
	 var frm = document.forms["addcaseinfofrm"]; 
	 var oppcnt = frm.txtCounter.value;
 
	   var ret = 0;
	   var strRegExp = "[^A-Za-z\\s]";
	   var numRegExp = "[^0-9\\s]";
	   var straddrRegExp = "[\\,]";  
	 if(oppcnt>0){		
		 for(var i= 1;i<=oppcnt ;i++){
			 
			 var oppPartyName = 'oppPartyName'+i;
			 var oppPartyOrgName = 'oppPartyOrgName'+i;
			 var oppPartyLawyerName = 'oppPartyLawyerName'+i;
			 
			 var oppPartEmailId = 'oppPartEmailId'+i;
			 var oppPartyOrgEmailId = 'oppPartyOrgEmailId'+i;
			 var oppPartyLawyerEmailId = 'oppPartyLawyerEmailId'+i;
			 
			 
			 var oppPartMobileNo = 'oppPartyMobNo'+i;
			 var oppPartyOrgMobileNo = 'oppPartyOrgMobNo'+i;
			 var oppPartyLawyerMobileNo = 'oppPartyLawyerMobNo'+i;
			 
			 
			 var oppPartyTelNo = 'oppPartyTelNo'+i;
			 var oppPartyOrgTelNo = 'oppPartyOrgTelNo'+i;
			 var oppPartyOrgTelNo = 'oppPartyLawyerTelNo'+i;
			 
			 var oppPartyAddress = 'oppPartyAddress'+i;
			 var oppPartyOrgAddress = 'oppPartyOrgAddress'+i;
			 var oppPartyLawyerAddress = 'oppPartyLawyerAddress'+i;
			  
			 
			 if((document.getElementById(oppPartyName).value == "") && (document.getElementById(oppPartyOrgName).value == "") && (document.getElementById(oppPartyLawyerName).value == "") ){
				 sfm_show_error_msg('Enter #'+i+' Opponent Name(Opponent/Organization/Lawyer)',frm.txtCounter);
				 ret = 1;
			 }else{
				 ret = 0;
			 }
			 
			 
			    var addrpos1 =document.getElementById(oppPartyAddress).value.search(straddrRegExp);
			    if (document.getElementById(oppPartyAddress).value.length > 0 && addrpos1 >= 0)
			    {
			        strError = 'Opposite Party Address #'+i+' should not contain comma(,).' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var addrpos2 =document.getElementById(oppPartyOrgAddress).value.search(straddrRegExp);
			    if (document.getElementById(oppPartyOrgAddress).value.length > 0 && addrpos2 >= 0)
			    {
			        strError = 'Opposite Party Org Address #'+i+' should not contain comma(,).' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var addrpos3 =document.getElementById(oppPartyLawyerAddress).value.search(straddrRegExp);
			    if (document.getElementById(oppPartyLawyerAddress).value.length > 0 && addrpos3 >= 0)
			    {
			        strError = 'Opposite Party Lawyer Address #'+i+' should not contain comma(,).' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			 
			 
			 
			 
			    var charpos1 =document.getElementById(oppPartyName).value.search(strRegExp);
			    if (document.getElementById(oppPartyName).value.length > 0 && charpos1 >= 0)
			    {
			        strError = 'Opposite Party name #'+i+' can contain only letters' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var charpos2 =document.getElementById(oppPartyOrgName).value.search(strRegExp);
			    if (document.getElementById(oppPartyOrgName).value.length > 0 && charpos2 >= 0)
			    {
			        strError = 'Opposite Party Org name #'+i+' can contain only letters' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var charpos3 =document.getElementById(oppPartyLawyerName).value.search(strRegExp);
			    if (document.getElementById(oppPartyLawyerName).value.length > 0 && charpos3 >= 0)
			    {
			        strError = 'Opposite Party Lawyer name #'+i+' can contain only letters' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			     
			    
			    var numpos1 =document.getElementById(oppPartMobileNo).value.search(numRegExp);
			    if (document.getElementById(oppPartMobileNo).value.length > 0 && numpos1 >= 0)
			    {
			        strError = 'Opposite Party Mobile No #'+i+' can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var numpos2 =document.getElementById(oppPartyOrgMobileNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyOrgMobileNo).value.length > 0 && numpos2 >= 0)
			    {
			        strError = 'Opposite Party Org Mobile No #'+i+' can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var numpos3 =document.getElementById(oppPartyLawyerMobileNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyLawyerMobileNo).value.length > 0 && numpos3 >= 0)
			    {
			        strError = 'Opposite Party Lawyer Mobile No #'+i+' can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    
			    if (document.getElementById(oppPartMobileNo).value.length < 10 && document.getElementById(oppPartMobileNo).value.length  > 0)
			    {
			        strError = 'Opposite Party Mobile No #'+i+' should contain a minimum of 10 digit' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			   
			    if (document.getElementById(oppPartyOrgMobileNo).value.length < 10 && document.getElementById(oppPartyOrgMobileNo).value.length > 0)
			    {
			        strError = 'Opposite Party Org Mobile No #'+i+' should contain a minimum of 10 digit' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			   
			    if (document.getElementById(oppPartyLawyerMobileNo).value.length < 10 && document.getElementById(oppPartyLawyerMobileNo).value.length > 0)
			    {
			        strError = 'Opposite Party Lawyer Mobile No #'+i+' should contain a minimum of 10 digit' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			     
			    
			    var telnumpos1 =document.getElementById(oppPartyTelNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyTelNo).value.length > 0 && telnumpos1 >= 0)
			    {
			        strError = 'Opposite Party Tel No #'+i+' can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var telnumpos2 =document.getElementById(oppPartyOrgTelNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyOrgTelNo).value.length > 0 && telnumpos1 >= 0)
			    {
			        strError = 'Opposite Party Org Tel No #'+i+' can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }  
			    
			    var telnumpos3 =document.getElementById(oppPartyOrgTelNo).value.search(numRegExp);
			    if (document.getElementById(oppPartyOrgTelNo).value.length > 0 && telnumpos1 >= 0)
			    {
			        strError = 'Opposite Party Lawyer Tel No #'+i+' can contain only numbers' ;		         
			        sfm_show_error_msg(strError,frm.txtCounter);
			        ret = 1;
			    }   
			    
			 
			 if (document.getElementById(oppPartEmailId).value.length > 0 && !validateEmail(document.getElementById(oppPartEmailId).value))
			    { 
				   strError = 'Opp Party Email Address #'+i+' is not valid';				        
			        sfm_show_error_msg(strError, frm.txtCounter);
			        ret = 1;
			    } 
			    if (document.getElementById(oppPartyOrgEmailId).value.length > 0 && !validateEmail(document.getElementById(oppPartyOrgEmailId).value))
			    { 
			    	strError = 'Opp Party Org Email Address #'+i+' is not valid';				        
			        sfm_show_error_msg(strError, frm.txtCounter);
			        ret = 1;
			    } 
			    if (document.getElementById(oppPartyLawyerEmailId).value.length > 0 && !validateEmail(document.getElementById(oppPartyLawyerEmailId).value))
			    {
			    	strError = 'Opp Party Lawyer Email Address #'+i+' is not valid';			         
			        sfm_show_error_msg(strError, frm.txtCounter);
			        ret = 1;
			    } 		 
			    
			    
			    
		 }
		 
		 if(ret == 1){
			return false; 
		 }else{
			 
			 return true; 
		 }
		 
		 
	 }else{
		 
		 return true;
	 }
	  
	 
		  
}



function casTypeSel(){
	var frm = document.forms["addcaseinfofrm"]; 
	var casetype = frm.txtCaseType.value;
	var casesubtype = frm.txtCaseSubType.value;	 
	
	if(casetype == "CRIMINAL" && casesubtype!="CRIMINAL"){
		sfm_show_error_msg('Case Sub Type should be CRIMINAL for Case Type CRIMINAL',frm.txtCaseSubType);
	    return false;
	}else if(casetype == "CIVIL" && casesubtype=="CRIMINAL"){		 
		sfm_show_error_msg('Case Sub Type should not be '+casesubtype+' for Case Type CIVIL',frm.txtCaseSubType);
	    return false;
	}else{
		return true;
	}
}

function caseSubTypeSel(){
	
	var frm = document.forms["addcaseinfofrm"]; 
	
	var casetype = frm.txtCaseType.value;
	var casesubtype = frm.txtCaseSubType.value;	 
	 
	
	var	SuitType     = frm.txtSuitType.value;
	var	OsNo         = frm.txtOsNo.value;
	var	AppealType   = frm.txtAppealType.value;
	var	AppealSuitNo = frm.txtAppealSuitNo.value;
	var	PetitionType = frm.txtPetitionType.value;
	var	ExPetNo      = frm.txtExPetNo.value;
	var	ExecutionType= frm.txtExecutionType.value;
	var	ExAppNo      = frm.txtExAppNo.value;
	var	CriminalType = frm.txtCriminalType.value;
	var	CRMPNo       = frm.txtCRMPNo.value;
	 	 
	switch(casesubtype)
	{
	case "APPEAL":
		 
	   if((AppealType != "" && AppealSuitNo != "") || (ExecutionType != "" && ExAppNo != "")){
		   return true;
	   }else{
		   sfm_show_error_msg('Please select a valid Appeal Type/Appeal Suit No or Execution Type/Execution Appeal No',frm.txtAppealType);
		   return false;
	   }
	  break;
	case "EXECUTION":
		 
		if((ExAppNo != "" && ExecutionType != "") || (PetitionType != "" && ExPetNo != "")){
			   return true;
		   }else{
			   sfm_show_error_msg('Please select a valid Execution Type/Execution Appeal No or Petition Type/Execution Petition No',frm.txtAppealType);
			   return false;
		   }
	   
	  break;
	case "PETITION":
		 
		if(PetitionType == "" || ExPetNo == ""){
			   sfm_show_error_msg('Please select a valid Petition Type/Execution Petition No',frm.txtAppealType);
			   return false;
		   }else{
			   return true;
		   }
		  
		  break;
	case "SUIT":
		 
		if((SuitType != "" && OsNo != "") || (AppealType != "" && AppealSuitNo != "")){
			   return true;
		   }else{
			   sfm_show_error_msg('Please select a valid Suit Type/Original Suit No or Appeal Type/Appeal Suit No',frm.txtAppealType);
			   return false;
		   }
		  break;
	case "CRIMINAL":
		 
		if(CriminalType == "" || CRMPNo == ""){
			   sfm_show_error_msg('Please select a valid Criminal Type/CR.M.P No',frm.txtAppealType);
			   return false;
		   }else{
			   return true;
		   }
		  break;
	default:
	 
			return true;
		 
	}
	
	
	
}

function editClientDateChk(){
	 var frm = document.forms["editclientinfo"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth() + 1;
	 
    var selecteddate = frm.txtDateOfBirth.value;
	 var splitDate = selecteddate.split("/");
	 var selday = splitDate[1];
	 var selMon = splitDate[0];
	 var selyear = splitDate[2];

 
 
 var currDate = new Date(today.getFullYear(), month, today.getDate()); 
 var selDate = new Date(selyear, selMon, selday);
 
	  if(selDate > currDate){ 
	    sfm_show_error_msg('Date of Birth should not be greater than Todays date',frm.txtDateOfBirth);
	    return false;
	  }else{
	    return true;
	  }	
		  
     }
function addEmpDateChk(){
	 var frm = document.forms["addempfrm"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth();
	 
   var selecteddate = frm.txtDateofBirth.value;
	 var splitDate = selecteddate.split("/");
	  
	 var selday = splitDate[0];
	 var selMon = splitDate[1]-1;
	 var selyear = splitDate[2];



var currDate = new Date(today.getFullYear(), month, today.getDate()); 
var selDate = new Date(selyear, selMon, selday);
 	  if(selDate > currDate){ 
	    sfm_show_error_msg('Date of Birth should not be greater than Todays date',frm.txtDateofBirth);
	    return false;
	  }else{
	    return true;
	  }	
		  
    }

function secAns1Check(){
	 var frm = document.forms["addempfrm"]; 
	  var secAns1 = frm.txtAnswer1.value;
	  var secAns11 = frm.txtAnswer11.value;
	  if(secAns1 != "" && secAns11 != ""){
	  if(secAns1 != secAns11){ 
		    sfm_show_error_msg('Security Answers 1 are not Matching',frm.txtAnswer1);
		    return false;
		  }else{
		    return true;
		  }	
	  }
	  
}

function secAns2Check(){
	 var frm = document.forms["addempfrm"]; 
	  var secAns2 = frm.txtAnswer2.value;
	  var secAns22 = frm.txtAnswer22.value;
	  if(secAns2 != "" && secAns22 != ""){
	  if(secAns2 != secAns22){ 
		    sfm_show_error_msg('Security Answers 2 are not Matching',frm.txtAnswer2);
		    return false;
		  }else{
		    return true;
		  }	
	  }
}


function updSecAns1Check(){
	 var frm = document.forms["chgSecQueFrm"]; 
	  var secAns1 = frm.txtAnswer1.value;
	  var secAns11 = frm.txtAnswer11.value;
	  if(secAns1 != "" && secAns11 != ""){
	  if(secAns1 != secAns11){ 
		    sfm_show_error_msg('Security Answers 1 are not Matching',frm.txtAnswer1);
		    return false;
		  }else{
		    return true;
		  }	
	  }
	  
}

function updSecAns2Check(){
	 var frm = document.forms["chgSecQueFrm"]; 
	  var secAns2 = frm.txtAnswer2.value;
	  var secAns22 = frm.txtAnswer22.value;
	  if(secAns2 != "" && secAns22 != ""){
	  if(secAns2 != secAns22){ 
		    sfm_show_error_msg('Security Answers 2 are not Matching',frm.txtAnswer2);
		    return false;
		  }else{
		    return true;
		  }	
	  }
}


function editEmpDateChk(){
	 var frm = document.forms["editempfrm"]; 
	 
	 var today = new Date();	 
	 var month =  today.getMonth();
	 
     var selecteddate = frm.txtDateofBirth.value;
	 var splitDate = selecteddate.split("/");
	 var selday = splitDate[1];
	 var selMon = splitDate[0]-1;
	 var selyear = splitDate[2];



var currDate = new Date(today.getFullYear(), month, today.getDate()); 
var selDate = new Date(selyear, selMon, selday);

	  if(selDate > currDate){ 
	    sfm_show_error_msg('Date of Birth should not be greater than Todays date',frm.txtDateofBirth);
	    return false;
	  }else{
	    return true;
	  }	
		  
   }


function validateInput(strValidateStr, objValue, strError)
{

    var ret = true;
    var epos = strValidateStr.search("=");
    var command = "";
    var cmdvalue = "";
    if (epos >= 0)
    {
        command = strValidateStr.substring(0, epos);
        cmdvalue = strValidateStr.substr(epos + 1);
    }
    else
    {
        command = strValidateStr;
    }

    switch (command)
    {
   
    case "req":
    case "required":
        {
            ret = TestRequiredInput(objValue, strError)
            break;
        }
    case "zero":
    case "zerocheck":
        {
            ret = TestZero(objValue, strError)
            break;
        }    
        
    case "maxlength":
    case "maxlen":
        {
            ret = TestMaxLen(objValue, cmdvalue, strError)
            break;
        }
    case "minlength":
    case "minlen":
        {
            ret = TestMinLen(objValue, cmdvalue, strError)
            break;
        }
    case "alnum":
    case "alphanumeric":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9]", strError, objValue.name + ": Only alpha-numeric characters allowed ");
            break;
        }
    case "alnum_s":
    case "alphanumeric_space":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9\\s]", strError, objValue.name + ": Only alpha-numeric characters and space allowed ");
            break;
        }
        
    case "num_s":
    case "numeric_space":
        {
            ret = TestInputType(objValue, "[^0-9]", strError, objValue.name + ": Only numeric characters and space allowed ");
            break;
        }     
        
        
        
    case "num":
    case "numeric":
    case "dec": 
    case "decimal": 
        {
           // if (objValue.value.length > 0 &&
			// !objValue.value.match(/^[\-\+]?[\d\,]*\.?[\d]*$/))
    	if (objValue.value.length > 0 && !objValue.value.match(/^[\+]?[\d\,]*\.?[\d]*$/))
            {
                sfm_show_error_msg(strError, objValue);
                ret = false;
            } // if
            break;
        }
        
     
    case "amount": 
        {
           // if (objValue.value.length > 0 &&
			// !objValue.value.match(/^[\-\+]?[\d\,]*\.?[\d]*$/))
    	if (( objValue.value.length > 0 && !objValue.value.match(/^[]?[\d]*\.?[\d]*$/)))
            {
                sfm_show_error_msg(strError, objValue);
                ret = false;
            } // if
            break;
        }
        
    case "amountZero": 
    {
    	if(objValue.value != ""){
			if(objValue.value <= 0){
				 sfm_show_error_msg(strError, objValue);
		         ret = false;
			}
    	}
		 break;
    }
        
    case "alphabetic":
    case "alpha":
        {
            ret = TestInputType(objValue, "[^A-Za-z]", strError, objValue.name + ": Only alphabetic characters allowed ");
            break;
        }
    case "alphabetic_space":
    case "alpha_s":
        {
            ret = TestInputType(objValue, "[^A-Za-z\\s\\'\\-]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }
        
    case "alpha_space":
    case "alpha_sp":	
	    {
	        ret = TestInputType(objValue, "[^A-Za-z]", strError, objValue.name + ": Only alphabetic characters allowed ");
	        break;
	    }
    case "alphabetic_address":
    case "alpha_addr":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9\\s\\-\\&\\,\\.\\#\\/\\;\\:]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }     
        
    case "alphabetic_book":
    case "alpha_book":
    {
        ret = TestInputType(objValue, "[^A-Za-z0-9\\s\\-\\_\\/]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
        break;
    }     
    
    	
    	
    case "alpha_courtdet":
    case "alpha_court":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9\\s\\-\\&]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }     
    case "alpha_casetype":
    case "alpha_case":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9\\s\\-\\&\\/]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }        
        
    case "alpha_tinno":
    case "alpha_tin":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9\\s\\/\\-]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }     
              
        
    case "alphabetic_Numeric":
    case "alpha_num":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }
    case "alpha_username":
    case "alpha_use":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9_.\\s]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }      
    case "alpha_PANnumber":
    case "alpha_PANnum":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }      
    case "mobilezero":
    case "mobzero":
        {
    	 ret =  mobileNoZero(objValue, strError);
         break;
        }      
      
        
          
        
    case "pass_alpha_number":
    case "pass_alpha_num":
        {
            ret = TestInputType(objValue, "[^A-Za-z0-9_]", strError, objValue.name + ": Only alphabetic characters and space allowed ");
            break;
        }       
    
    case "email":
        {
            ret = TestEmail(objValue, strError);
            break;
        }
    case "date":
    	{
      
    	  ret = TestDate(objValue, strError);
    	break;
    	}
    	
    	
        
    case "lt":
    case "lessthan":
        {
            ret = TestLessThan(objValue, cmdvalue, strError);
            break;
        }
    case "gt":
    case "greaterthan":
        {
            ret = TestGreaterThan(objValue, cmdvalue, strError);
            break;
        }
    case "regexp":
        {
            ret = TestRegExp(objValue, cmdvalue, strError);
            break;
        }
    case "dontselect":
        {
            ret = TestDontSelect(objValue, cmdvalue, strError)
            break;
        }
    case "dontselectchk":
        {
            ret = TestDontSelectChk(objValue, cmdvalue, strError)
            break;
        }
    case "shouldselchk":
        {
            ret = TestShouldSelectChk(objValue, cmdvalue, strError)
            break;
        }
    case "selmin":
        {
            ret = TestSelMin(objValue, cmdvalue, strError);
            break;
        }
    case "selmax":
        {
            ret = TestSelMax(objValue, cmdvalue, strError);
            break;
        }
    case "selone_radio":
    case "selone":
        {
            ret = TestSelectOneRadio(objValue, strError);
            break;
        }
    case "dontselectradio":
        {
            ret = TestSelectRadio(objValue, cmdvalue, strError, false);
            break;
        }
    case "selectradio":
        {
            ret = TestSelectRadio(objValue, cmdvalue, strError, true);
            break;
        }
        // Comparisons
    case "eqelmnt":
    case "ltelmnt":
    case "leelmnt":
    case "gtelmnt":
    case "geelmnt":
    case "neelmnt":
        {
            return TestComparison(objValue, cmdvalue, command, strError);
            break;
        }
    case "req_file":
        {
            ret = TestRequiredInput(objValue, strError);
            break;
        }
    case "file_extn":
        {
            ret = TestFileExtension(objValue, cmdvalue, strError);
            break;
        }

    } // switch
    return ret;
}

function VWZ_IsListItemSelected(listname, value)
{
    for (var i = 0; i < listname.options.length; i++)
    {
        if (listname.options[i].selected == true && listname.options[i].value == value)
        {
            return true;
        }
    }
    return false;
}

function VWZ_IsChecked(objcheck, value)
{
    if (objcheck.length)
    {
        for (var c = 0; c < objcheck.length; c++)
        {
            if (objcheck[c].checked == "1" && objcheck[c].value == value)
            {
                return true;
            }
        }
    }
    else
    {
        if (objcheck.checked == "1")
        {
            return true;
        }
    }
    return false;
}

function sfm_str_trim(strIn)
{
 
    return strIn.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}

function VWZ_IsEmpty(value)
{
    value = sfm_str_trim(value);
    return (value.length) == 0 ? true : false;
}
/*
 * Copyright (C) 2003-2011 JavaScript-Coder.com . All rights reserved.
 */