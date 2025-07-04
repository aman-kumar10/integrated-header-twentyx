<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$companyname} - {$pagetitle}</title>

    <link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet">
    <link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">
    <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="{assetPath file='invoice.min.css'}?v={$versionHash}" rel="stylesheet">
    <script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>

</head>
<style>
    .invoice-status {
        float: right;
        font-size: 24px;
    }

    span.paid {
        float: right;
        font-size: 18px;
    }

    .invoice {
        height: 50px;
        width: 131px;
    }

    .h3,
    h3 {
        font-size: 16px;
    }

    hr {
        margin-top: 5px;
        margin-bottom: 20px;
        border: 0;
        border-top: 1px solid #eee;
    }

    thead {
        background: #efefef;
    }
    .addding-partial-payment
    {
    margin-bottom:15px;
    }
</style>

<body>
    <div class="container-fluid invoice-container">

        {if $invalidInvoiceIdRequested}

        {include file="$template/includes/panel.tpl" type="danger" headerTitle="{lang key='error'}" bodyContent="{lang
        key='invoiceserror'}" bodyTextCenter=true}

        {else}

        <div class="row invoice-header">
            <div class="invoice-col">
                <div class="invoice">
                    {if $logo}
                    <p><img src="{$logo}" title="{$companyname}" /></p>
                    {else}
                    <h2>{$companyname}</h2>
                    {/if}
                </div>
            </div>
            <div class="col-12 col-sm-6 invoice-col text-center">

                <div class="invoice-status">
                    {if $status eq "Draft"}
                    <span class="draft">{lang key='invoicesdraft'}</span>
                    {elseif $status eq "Unpaid"}
                    <span class="unpaid">{lang key='invoicesunpaid'}</span>
                    {elseif $status eq "Paid"}
                    <span class="paid">{lang key='invoicespaid'}</span>
                    {elseif $status eq "Refunded"}
                    <span class="refunded">{lang key='invoicesrefunded'}</span>
                    {elseif $status eq "Cancelled"}
                    <span class="cancelled">{lang key='invoicescancelled'}</span>
                    {elseif $status eq "Collections"}
                    <span class="collections">{lang key='invoicescollections'}</span>
                    {elseif $status eq "Payment Pending"}
                    <span class="paid">{lang key='invoicesPaymentPending'}</span>
                    {/if}
                    <div class="head">
                        <h3>{$pagetitle}</h3>
                    </div>
                    {if $partialOn eq "on" && $editdelete eq "off"}
                    <div class="addding-partial-payment">
                        <a class="btn btn-success create_invoice invoice-partaily" data-toggle="modal"
                            data-target="#{$modalId}" data-invoiceId="{$invoiceId}">Partial Payment</a>
                    </div>
                    {elseif $editdelete eq "on"}
                    <div class="head">
                        <h3>Partial Payment</h3>
                    </div>
                    <div class="addding-partial-payment">
                        <a class="btn btn-success create_invoice invoice-partaily" data-toggle="modal"
                            data-target="#{$modalId}" data-invoiceId="{$invoiceId}">Edit</a>
                        <a class="btn btn-danger invoice_delete" id="delete_partial_pament"
                            data-invoiceId="{$invoiceId}">Delete</a>
                    </div>
                    {/if}
                </div>
                {if $status eq "Unpaid" || $status eq "Draft"}
                <div class="small-text">
                    {lang key='invoicesdatedue'}: {$datedue}
                </div>
                <div class="payment-btn-container d-print-none" align="center">
                    {$paymentbutton}
                </div>
                {/if}
            </div>
        </div>
        <hr>
        {if $paymentSuccessAwaitingNotification}
        {include file="$template/includes/panel.tpl" type="success" headerTitle="{lang key='success'}"
        bodyContent="{lang key='invoicePaymentSuccessAwaitingNotify'}" bodyTextCenter=true}
        {elseif $paymentSuccess}
        {include file="$template/includes/panel.tpl" type="success" headerTitle="{lang key='success'}"
        bodyContent="{lang key='invoicepaymentsuccessconfirmation'}" bodyTextCenter=true}
        {elseif $paymentInititated}
        {include file="$template/includes/panel.tpl" type="info" headerTitle="{lang key='success'}" bodyContent="{lang
        key='invoicePaymentInitiated'}" bodyTextCenter=true}
        {elseif $pendingReview}
        {include file="$template/includes/panel.tpl" type="info" headerTitle="{lang key='success'}" bodyContent="{lang
        key='invoicepaymentpendingreview'}" bodyTextCenter=true}
        {elseif $paymentFailed}
        {include file="$template/includes/panel.tpl" type="danger" headerTitle="{lang key='error'}" bodyContent="{lang
        key='invoicepaymentfailedconfirmation'}" bodyTextCenter=true}
        {elseif $offlineReview}
        {include file="$template/includes/panel.tpl" type="info" headerTitle="{lang key='success'}" bodyContent="{lang
        key='invoiceofflinepaid'}" bodyTextCenter=true}
        {/if}


        <div class="row">

            <div class="invoice-col">
                <strong>{$LANG.invoicespayto}</strong>
                <address class="small-text">
                    {$payto}
                    {if $taxCode}<br />{$taxIdLabel}: {$taxCode}{/if}
                </address>



            </div>
            {if $gstdetails->qr_code }
            <div class="invoice-col right">

                <img src="{$gstdetails->qr_code}" alt="" width="160" height="160">
            </div>
            {/if }
        </div>

        <div class="row">
            <div class="col-md-12">


                <strong>{$LANG.invoicesinvoicedto}</strong>
                <address class="small-text">
                    {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
                    {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                    {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                    {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                    {$clientsdetails.country}
                    {if $clientsdetails.tax_id}
                    <br />{$taxIdLabel}: {$clientsdetails.tax_id}
                    {/if}
                    {if $customfields}
                    <br /><br />
                    {foreach from=$customfields item=customfield}
                    {$customfield.fieldname}: {$customfield.value}<br />
                    {/foreach}
                    {/if}
                    <br>
                    {if $gstdetails->ack_no }

                    Ack No :{$gstdetails->ack_no }
                    {/if}
                    <br>
                    {if $gstdetail }

                    Ack Date :{$gstdetail }
                    {/if}
                    <br>

                    {if $gstdetails->irn}
                    IRN No :{$gstdetails->irn }
                    {/if}
                </address>
            </div>
        </div>

        <div class="row">
            <div class="invoice-col col-md-6">
                <strong>{$LANG.invoicesdatecreated}</strong><br>
                <span class="small-text">
                    {$date}<br><br>
                </span>
            </div>
            <div class="invoice-col col-md-6 right">
                <strong>{$LANG.paymentmethod}</strong><br>
                <span class="small-text" data-role="paymethod-info">
                    {if $status eq "Unpaid" && $allowchangegateway}
                    <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}" class="form-inline">
                        {$gatewaydropdown}
                    </form>
                    {else}
                    {$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}
                    {/if}
                </span>
                <br /><br />
            </div>

        </div>

        <br />

        {if $manualapplycredit}
        <div class="card bg-success">
            <div class="card-header">
                <h3 class="card-title"><strong>{lang key='invoiceaddcreditapply'}</strong></h3>
            </div>
            <div class="card-body">
                <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
                    <input type="hidden" name="applycredit" value="true" />
                    {lang key='invoiceaddcreditdesc1'} <strong>{$totalcredit}</strong>. {lang
                    key='invoiceaddcreditdesc2'}. {lang key='invoiceaddcreditamount'}:
                    <div class="row">
                        <div class="col-8 offset-2 col-sm-4 offset-sm-4">
                            <div class="input-group">
                                <input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-success" id="btnInvoiceAddCreditApply">
                                        {lang key='invoiceaddcreditapply'}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        {/if}

        {if $notes}
        {include file="$template/includes/panel.tpl" type="info" headerTitle="{lang key='invoicesnotes'}"
        bodyContent=$notes}
        {/if}

        <div class="card bg-default">
            <div class="card-header">
                <h3 class="card-title mb-0 font-size-24"><strong>{lang key='invoicelineitems'}</strong></h3>
            </div>
            {if $gst_addon AND !$old_vat}
            <div class="table-responsive">
                <table class="table table-sm table-bordered" style="overflow: hidden;">
                    <thead>
                        <tr>
                        <tr>
                            <th colspan="7" class="background-gray" width="25%">{$LANG.invoicesdescription}</th>
                            <th class="background-gray" width="9%">Item type</th>
                            <th class="background-gray" width="6%">SAC Code</th>
                            <th class="background-gray" width="19%">Total</th>
                        </tr>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$invoiceitems key=num item=item}
                        <tr>
                            <td colspan="7">{$item.description}{if $item.taxed eq "true"} *{/if}</td>
                            <td>
                                {if $item.description|lower|strstr:'website design'}
                                Website Design
                                {elseif $item.description|lower|strstr:'web development'}
                                Web Development
                                {elseif $item.description|lower|strstr:'seo'}
                                SEO
                                {elseif $item.description|lower|strstr:'amc'}
                                AMC
                                {else}
                                {$item.type}
                                {/if}
                            </td>
                            <td>
                                {if $item.description|lower|strstr:'website design' OR
                                $item.description|lower|strstr:'web development' OR $item.description|lower|strstr:'seo'
                                OR $item.description|lower|strstr:'amc'}
                                998314
                                {elseif $item.type eq 'Hosting'}
                                998315
                                {elseif substr_count($item.type, 'Domain') OR substr_count($item.type, 'Addon')}
                                998319
                                {else}
                                {* 998313*}
                                {/if}
                            </td>
                            <td>{$item.amount}</td>
                        </tr>
                        {/foreach}
                        {* {foreach $invoiceitems as $item}
                        <tr>
                            <td>{$item.description}{if $item.taxed eq "true"} *{/if}</td>
                            <td class="text-center">{$item.amount}</td>
                        </tr>
                        {/foreach}*}
                        <tr style="font-weight:bold;">
                            <td class="background-gray" colspan="7" align="right">{$LANG.invoicessubtotal}</td>
                            <td class="background-gray" colspan="2"></td>
                            <td class="background-gray">{$subtotal}</td>
                        </tr>
                        <tr>
                            <td colspan="7" align="right" style="vertical-align: middle;"><strong>GST</strong></td>
                            <td colspan="2">

                                <table class="table table-bordered margin0 borderTopLeftRight0">
                                    <tbody>
                                        <tr>
                                            <th class="background-gray" width="33.3%">CGST{if $taxrate AND $taxlabel1 eq
                                                'CGST'}&nbsp;({$taxrate}%){else}&nbsp{/if}</th>
                                            <th class="background-gray" width="33.3%">SGST{if $taxrate2 AND $taxlabel2
                                                eq 'SGST'}&nbsp;({$taxrate2}%){else}&nbsp{/if}</th>
                                            <th class="background-gray" width="33.3%">IGST{if $taxrate AND $taxlabel1 eq
                                                'IGST'}&nbsp;({$taxrate}%){else}&nbsp{/if}</th>
                                        </tr>
                                        <tr>
                                            <td width="33.3%">{if $taxrate AND $taxlabel1 eq 'CGST'}
                                                {$tax}{else}&nbsp;{/if}</td>
                                            <td width="33.3%">{if $taxrate2 AND $taxlabel2 eq 'SGST'}
                                                {$tax2}{else}&nbsp;{/if}</td>
                                            <td width="33.3%">{if $taxrate AND $taxlabel1 eq 'IGST'}
                                                {$tax}{else}&nbsp;{/if}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td style="vertical-align: middle;">{$total_gst_tax}</td>
                        </tr>
                        <tr style="font-weight:bold;">
                            <td class="background-gray" colspan="7" align="right">Total Amount Incl. GST :</td>
                            <td class="background-gray" colspan="2" align="right">&nbsp;</td>
                            <td class="background-gray" align="left">
                                {if $wgs_gst_credit and $wgs_gst_invoicetotal}
                                {$wgs_gst_invoicetotal}
                                {else}
                                {$total}
                                {/if}
                            </td>
                        </tr>
                        {if $totalinwords AND $currency_code == 'INR'}
                        <tr style="font-weight:bold;">
                            <td class="background-gray" colspan="7" align="right">Total Amount Incl. GST (in words):
                            </td>
                            <td class="background-gray" colspan="3" align="right">{$totalinwords}</td>
                        </tr>
                        {/if}
                        <tr style="font-weight:bold;">
                            <td class="background-gray" colspan="7" align="right">Funds Applied</td>
                            <td class="background-gray" colspan="2"></td>
                            <td class="background-gray">{$credit}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            {else}
            <div class="table-responsive">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <td><strong>{lang key='invoicesdescription'}</strong></td>
                            <td width="20%" class="text-center"><strong>{lang key='invoicesamount'}</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $invoiceitems as $item}
                        <tr>
                            <td>{$item.description}{if $item.taxed eq "true"} *{/if}</td>
                            <td class="text-center">{$item.amount}</td>
                        </tr>
                        {/foreach}
                        <tr>
                            <td class="total-row text-right"><strong>{lang key='invoicessubtotal'}</strong></td>
                            <td class="total-row text-center">{$subtotal}</td>
                        </tr>
                        {if $taxname}
                        <tr>
                            <td class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
                            <td class="total-row text-center">{$tax}</td>
                        </tr>
                        {/if}
                        {if $taxname2}
                        <tr>
                            <td class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
                            <td class="total-row text-center">{$tax2}</td>
                        </tr>
                        {/if}
                        <tr>
                            <td class="total-row text-right"><strong>{lang key='invoicescredit'}</strong></td>
                            <td class="total-row text-center">{$credit}</td>
                        </tr>
                        <tr>
                            <td class="total-row text-right"><strong>{lang key='invoicestotal'}</strong></td>
                            <td class="total-row text-center">
                                {if $partailamount gt 0.00}
                                {$prefixsubfix['prefix']}{$totalamount} {$prefixsubfix['suffix']}
                                {else}
                                {$total}
                                {/if}
                            </td>
                        </tr>
                        {if $partialOn eq "on" AND $partailamount gt 0.00}
                        <tr>
                            <td class="total-row text-right "><strong>Payable Amount</strong></td>
                            <td class="total-row text-center partial-amount">{$prefixsubfix['prefix']}{$partailamount}
                                {$prefixsubfix['suffix']}</td>
                        </tr>
                        <tr>
                            <td class="total-row text-right "><strong>Total Due Amount</strong></td>
                            <td class="total-row text-center partial-due-amount">{if $partailamount gt 0.00}
                                {assign var=tblbalance value=$totalbalance - $partailamount}
                                {$prefixsubfix['prefix']}{$tblbalance|string_format:"%.2f"} {$prefixsubfix['suffix']}
                                {else}
                                {$total}
                                {/if}
                            </td>
                        </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
            {/if}
        </div>
        {if $taxrate}
        <p>* {lang key='invoicestaxindicator'}</p>
        {/if}

        <div class="transactions-container small-text">
            <div class="table-responsive">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <td class="text-center"><strong>{lang key='invoicestransdate'}</strong></td>
                            <td class="text-center"><strong>{lang key='invoicestransgateway'}</strong></td>
                            <td class="text-center"><strong>{lang key='invoicestransid'}</strong></td>
                            <td class="text-center"><strong>{lang key='invoicestransamount'}</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        {if $transactions or $wgs_gst_transactions}
                        {if $wgs_gst_transactions}
                        {foreach from=$wgs_gst_transactions item=transaction}
                        <tr>
                            <td class="text-center">{$transaction.date}</td>
                            <td class="text-center">{$transaction.gateway}</td>
                            <td class="text-center">{$transaction.transid}</td>
                            <td class="text-center">{$transaction.amount}</td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
                        </tr>
                        {/foreach}
                        {else}
                        {foreach from=$transactions item=transaction}
                        <tr>
                            <td class="text-center">{$transaction.date}</td>
                            <td class="text-center">{$transaction.gateway}</td>
                            <td class="text-center">{$transaction.transid}</td>
                            <td class="text-center">{$transaction.amount}</td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
                        </tr>
                        {/foreach}
                        {/if}
                        {/if}
                        {if $transactions or $wgs_gst_transactions}
                        <tr>
                            <td class="text-right" colspan="3"><strong>{$LANG.invoicesbalance}</strong></td>
                            <td class="text-center">{if $partialOn eq "on" AND $partailamount gt 0.00}
                                {$prefixsubfix['prefix']}{$totalbalance} {$prefixsubfix['suffix']}
                                {else}
                                {$balance}
                                {/if}</td>
                        </tr>
                        {else}
                        <tr>
                            <td class="text-left"><strong>{$LANG.invoicesbalance}</strong></td>
                            <td class="text-right">
                                {if $partialOn eq "on" AND $partailamount gt 0.00}
                                {$prefixsubfix['prefix']}{$totalbalance} {$prefixsubfix['suffix']}
                                {else}
                                {$balance}
                                {/if}
                            </td>
                        </tr>
                        {/if}

                        {if $sign_img}

                        <tr>
                            <td class="text-right" colspan="4"><img width="170px" height="70px"
                                    src="{$sign_img}"><br />Authorized Signatory</td>
                        </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
        </div>

        <div class="float-right btn-group btn-group-sm d-print-none">
            <a href="javascript:window.print()" class="btn btn-default"><i class="fas fa-print"></i> {lang
                key='print'}</a>
            <a href="dl.php?type=i&amp;id={$invoiceid}" class="btn btn-default"><i class="fas fa-download"></i> {lang
                key='invoicesdownload'}</a>
        </div>

        {/if}

    </div>

    <p class="text-center d-print-none"><a href="clientarea.php?action=invoices">{lang
            key='invoicesbacktoclientarea'}</a></a></p>

    <div id="fullpage-overlay" class="w-hidden">
        <div class="outer-wrapper">
            <div class="inner-wrapper">
                <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg">
                <br>
                <span class="msg"></span>
            </div>
        </div>
    </div>

</body>

</html>