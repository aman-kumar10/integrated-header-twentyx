<form method="post" action="domainchecker.php" id="frmDomainHomepage">
    <div class="home-domain-search bg-white">
        <div class="container">
            <div class="p-5 clearfix">
                <h2 class="text-center">{lang key="secureYourDomainShort"}</h2>
                <input type="hidden" name="transfer" />
                <div class="input-group-wrapper">
                    <div class="input-group">
                        <input type="text" class="form-control" name="domain" placeholder="{lang key="exampledomain"}" autocapitalize="none">
                        <span class="input-group-append d-none d-sm-block">
                            {if $registerdomainenabled}
                                <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch">
                                    {lang key="search"}
                                </button>
                            {/if}
                            {if $transferdomainenabled}
                                <button type="submit" id="btnTransfer" data-domain-action="transfer" class="btn btn-success{$captcha->getButtonClass($captchaForm)}">
                                    {lang key="domainstransfer"}
                                </button>
                            {/if}
                        </span>
                    </div>
					<a href="{routePath('domain-pricing')}" class="btn btn-link btn-sm float-right">{lang key='viewAllPricing'}</a>
                </div>
                <div class="row d-sm-none">
                    {if $registerdomainenabled}
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)} btn-block" id="btnDomainSearch2">
                                {lang key="search"}
                            </button>
                        </div>
                    {/if}
                    {if $transferdomainenabled}
                        <div class="col-6">
                            <button type="submit" id="btnTransfer2" data-domain-action="transfer" class="btn btn-success{$captcha->getButtonClass($captchaForm)} btn-block">
                                {lang key="domainstransfer"}
                            </button>
                        </div>
                    {/if}
                </div>
                {if $featuredTlds}
                    <ul class="tld-logos">
                        {foreach $featuredTlds as $num => $tldinfo}
                            {if $num < 4}
                                <li>
									<span class="tld-hm-20i">{$tldinfo.tld}</span>
                                    {if is_object($tldinfo.register)}
                                     <span class="price-hm-20i">{$tldinfo.register->toFull()}</span>
                                    {else}
                                     <span class="price-hm-20i">   {lang key="domainregnotavailable"}</span>
                                    {/if}
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
                {include file="$template/includes/captcha.tpl"}
            </div>
        </div>
    </div>
</form>
