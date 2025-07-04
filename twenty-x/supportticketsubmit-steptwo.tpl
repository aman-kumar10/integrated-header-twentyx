
<div class="submit-ticket-two-20i">
<form method="post" action="{$smarty.server.PHP_SELF}?step=3" enctype="multipart/form-data" role="form">

<div class="card">
    <div class="card-body extra-padding">
<!--p style="margin: 10px 0;color: #e12323;line-height: 24px;font-weight: 600;font-size: 16px;background: #ffd1a0;padding: 20px;">Offering limited support services owing to Diwali holidays (From 30 Oct To 03 Nov 2024). <b>Happy Diwali!</b> <a href="https://whmcsglobalservices.com/best-discounts-and-promo-codes-for-whmcs-product-services/" target="_blank">Enjoy Sale NOW!!</a></p--> 
        <h1 class="card-title">{lang key="createNewSupportRequest"}</h1>

        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}

        <div class="row">
            <div class="form-group col-md-4">
                <label for="inputName">{lang key='supportticketsclientname'}</label>
                <input type="text" name="name" id="inputName" value="{$name}" class="form-control{if $loggedin} disabled{/if}"{if $loggedin} disabled="disabled"{/if} />
            </div>
            <div class="form-group col-md-5">
                <label for="inputEmail">{lang key='supportticketsclientemail'}</label>t
                <input type="email" name="email" id="inputEmail" value="{$email}" class="form-control{if $loggedin} disabled{/if}"{if $loggedin} disabled="disabled"{/if} />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-10">
                <label for="inputSubject">{lang key='supportticketsticketsubject'}</label>
                <input type="text" name="subject" id="inputSubject" value="{$subject}" class="form-control" />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-3">
                <label for="inputDepartment">{lang key='supportticketsdepartment'}</label>
                <select name="deptid" id="inputDepartment" class="form-control" onchange="refreshCustomFields(this)">
                    {foreach $departments as $department}
                        <option value="{$department.id}"{if $department.id eq $deptid} selected="selected"{/if}>
                            {$department.name}
                        </option>
                    {/foreach}
                </select>
            </div>
            {if $relatedservices}
                <div class="form-group col-md-5">
                    <label for="inputRelatedService">{lang key='relatedservice'}</label>
                    <select name="relatedservice" id="inputRelatedService" class="form-control">
                        <option value="">{lang key='none'}</option>
                        {foreach $relatedservices as $relatedservice}
                            <option value="{$relatedservice.id}" {if $relatedservice.id eq $selectedservice} selected="selected"{/if}>
                                {$relatedservice.name} ({$relatedservice.status})
                            </option>
                        {/foreach}
                    </select>
                </div>
            {/if}
            <div class="form-group col-md-3">
                <label for="inputPriority">{lang key='supportticketspriority'}</label>
                <select name="urgency" id="inputPriority" class="form-control">
                    <option value="High"{if $urgency eq "High"} selected="selected"{/if}>
                        {lang key='supportticketsticketurgencyhigh'}
                    </option>
                    <option value="Medium"{if $urgency eq "Medium" || !$urgency} selected="selected"{/if}>
                        {lang key='supportticketsticketurgencymedium'}
                    </option>
                    <option value="Low"{if $urgency eq "Low"} selected="selected"{/if}>
                        {lang key='supportticketsticketurgencylow'}
                    </option>
                </select>
            </div>
        </div>

            <br/>
            <div class="ips">
                <div class="alert alert-warning" style="padding: 7px 15px; font-size: 0.9em;">
                    <b>Note:</b> Do not enter your confidential information (like admin login/FTP/cPanel/etc) in the message. On next page you will get a link to update your confidential information securly. WGS will not be responsible for security of confidential data provided in the message.
                </div>
            </div>
        <div class="form-group">
            <label for="inputMessage">{lang key='contactmessage'}</label>
            <textarea name="message" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="client_ticket_open">{$message}</textarea>
        </div>

        <div class="form-group">
            <label for="inputAttachments">{lang key='supportticketsticketattachments'}</label>
            <div class="input-group mb-1 attachment-group">
                <div class="custom-file">
                    <label class="custom-file-label text-truncate" for="inputAttachment1" data-default="Choose file">
                        {lang key='chooseFile'}
                    </label>
                    <input type="file" class="custom-file-input" name="attachments[]" id="inputAttachment1">
                </div>
                <div class="input-group-append">
                    <button class="btn btn-default" type="button" id="btnTicketAttachmentsAdd">
                        <i class="fas fa-plus"></i>
                        {lang key='addmore'}
                    </button>
                </div>
            </div>
            <div class="file-upload w-hidden">
                <div class="input-group mb-1 attachment-group">
                    <div class="custom-file">
                        <label class="custom-file-label text-truncate">
                            {lang key='chooseFile'}
                        </label>
                        <input type="file" class="custom-file-input" name="attachments[]">
                    </div>
                </div>
            </div>
            <div id="fileUploadsContainer"></div>
            <div class="text-muted">
                <small>{lang key='supportticketsallowedextensions'}: {$allowedfiletypes}  ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</small>
            </div>
        </div>

        <div id="customFieldsContainer">
            {include file="$template/supportticketsubmit-customfields.tpl"}
        </div>

        <div id="autoAnswerSuggestions" class="w-hidden"></div>

        <div class="text-center margin-bottom">
            {include file="$template/includes/captcha.tpl"}
        </div>

        <p class="text-center">
            <button type="submit" id="openTicketSubmit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">
                {lang key='supportticketsticketsubmit'}
            </button>
            <a href="supporttickets.php" class="btn btn-default">{lang key='cancel'}</a>
        </p>

        
	<div class="custom-card">
        <div class="row">
    	    {if $deptid neq '12'} 
                <div class="col-sm-6">
                    <div class="timing-sec">
                        <div class="cont-inner">
                            <span class="icon"><i class="fa fa-headphones"></i></span>
                            <h4>Sales Team</h4>
                            <address class="contact-us-content_bottom-info-details">
                                <div class="working-hours">
                                    <div class="contact-info-text"><strong class="text-color-neutral-2"><i class="fa fa-clock" aria-hidden="true"> </i></strong>
                                        24*7 (Monday ~ Sunday)<br>
                                    </div>
                                </div>
                            </address>
                        </div>
                        
                    </div>
                </div>
            {/if}       
            <div class="col-sm-6">
                <div class="cont-inner">
                    <span class="icon"><i class="fa fa-headphones"></i></span>
                    <h4>Technical Support Team</h4>
                    <address class="contact-us-content_bottom-info-details">
                        
                        
                        <div class="working-hours">
                
                            <div class="contact-info-text"><strong class="text-color-neutral-2"><i class="fa fa-clock" aria-hidden="true"> </i></strong>{if $deptid eq '12'}10:00 am to 7:00 pm {else}10:00 am to 8:00 pm{/if} IST (Monday ~ Friday)</div>
                        </div>
                    </address>
                </div>
            </div>
        </div>
    </div>
					{if $deptid eq '12'}
						<p><strong>Minimum Response Time: 24 hours</strong></p>
						<p><strong>Current IST Time: {$currenttime}</strong></p>
					{else}
						<p><strong>Minimum Response Time: 8 hours</strong></p>
						<p><strong>Current IST Time (GMT+5:30): {$currenttime}</strong></p>
					{/if}
					<!--p style="margin: 10px 0;color: #e12323;line-height: 24px;font-weight: 600;font-size: 16px;background: #ffd1a0;padding: 20px;">Offering limited support services owing to Diwali holidays (From 30 Oct To 03 Nov 2024). <b>Happy Diwali!</b> <a href="https://whmcsglobalservices.com/best-discounts-and-promo-codes-for-whmcs-product-services/" target="_blank">Enjoy Diwali Sale NOW!!</a></p--> 
                


    </div>
</div>

</form>
</div>
{if $kbsuggestions}
    <script>
        jQuery(document).ready(function() {
            getTicketSuggestions();
        });
    </script>
{/if}
