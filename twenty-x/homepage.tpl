{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
	<div class="product-section-20i">
    <h2 class="text-center m-4 Myhomepage">{lang key='clientHomePanels.productsAndServices'}</h2>
    <div class="card-columns home">
        {foreach $productGroups as $productGroup}
            <div class="card mb-3">
                <div class="card-body p-lg-4 p-xl-5 text-center">
					<div class="home-icon-fa">
						<figure class="ico-container">
							<i class="fas fa-server"></i>
						</figure>
					</div>
                    <h3 class="card-title pricing-card-title">
                        {$productGroup->name}
                    </h3>
                    <p>{$productGroup->tagline}</p>
                    <a href="{$productGroup->getRoutePath()}" class="btn btn-block btn-outline-primary">
                        {lang key='browseProducts'}
                    </a>
                </div>
            </div>
        {/foreach}
        {if $registerdomainenabled}
            <div class="card mb-3">
                <div class="card-body p-lg-4 p-xl-5 text-center">
                    <h3 class="card-title pricing-card-title">
                        {lang key='orderregisterdomain'}
                    </h3>
                    <p class="register-20i">{lang key='secureYourDomain'}</p>
                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-block btn-outline-primary">
                        {lang key='navdomainsearch'}
                    </a>
                </div>
            </div>
        {/if}
        {if $transferdomainenabled}
            <div class="card mb-3">
                <div class="card-body p-lg-4 p-xl-5 text-center">
                    <h3 class="card-title pricing-card-title">
                        {lang key='transferYourDomain'}
                    </h3>
                    <p class="transfer-20i">{lang key='transferExtend'}</p>
                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-block btn-outline-primary">
                        {lang key='transferYourDomain'}
                    </a>
                </div>
            </div>
        {/if}
    </div>
	</div>
	
	</div>
	</div>
	</div>
{/if}
<div class="account-section-main-20i">
	<div class="container">
		<div class="account-section-20i">
			<h2 class="text-center m-4">{lang key='homepage.yourAccount'}</h2>
			<div class="row my-5 action-icon-btns">
				<div class="col-6 col-md-4 col-lg">
					<a href="clientarea.php" class="card-accent-midnight-blue">
						<div class="account-sec-icon-div">
							<figure class="ico-container">
								<i class="fal fa-home"></i>
							</figure>
							{lang key='homepage.yourAccount'}
						</div>
					</a>
				</div>
				<div class="col-6 col-md-4 col-lg">
					<a href="clientarea.php?action=services" class="card-accent-midnight-blue">
						<div class="account-sec-icon-div">
							<figure class="ico-container">
								<i class="far fa-cubes"></i>
							</figure>
							{lang key='homepage.manageServices'}
						</div>
					</a>
				</div>
				<div class="col-6 col-md-4 col-lg">
					<a href="clientarea.php?action=domains" class="card-accent-midnight-blue">
						<div class="account-sec-icon-div">
							<figure class="ico-container">
								<i class="fal fa-globe"></i>
							</figure>
							{lang key='homepage.manageDomains'}
						</div>
					</a>
				</div>
				<div class="col-6 col-md-4 offset-md-2 offset-lg-0 col-lg">
					<a href="supporttickets.php" class="card-accent-midnight-blue">
						<div class="account-sec-icon-div">
							<figure class="ico-container">
								<i class="fal fa-comments"></i>
							</figure>
							{lang key='homepage.supportRequests'}
						</div>
					</a>
				</div>
				<div class="col-6 offset-3 offset-md-0 col-md-4 col-lg">
					<a href="clientarea.php?action=masspay&all=true" class="card-accent-midnight-blue">
						<div class="account-sec-icon-div">
							<figure class="ico-container">
								<i class="fal fa-credit-card"></i>
							</figure>
							{lang key='homepage.makeAPayment'}
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>