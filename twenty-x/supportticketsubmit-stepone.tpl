<div class="card sub-ticket">
    <div class="card-body extra-padding">
		<div class="row">
		<div class="w-100 mb-4">
            <h3 class="card-title">{lang key="createNewSupportRequest"}</h3>
            <p class="text-muted mb-0">{lang key='supportticketsheader'}</p>
		</div>
		</div>
		<div class="row cs-ticket">
			{foreach $departments as $num => $department}
				<div class="col-md-4">
					<div class="ticket-div-20i">
						<div class="ticket-top-cont">
							<a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">
								<i class="fas fa-envelope"></i>
								<h5>&nbsp;{$department.name}</h5>
							</a>
						</div>
						{if $department.description}
							<p class="text-muted">{$department.description}</p>						
						{/if}
					</div>
				</div>
			{foreachelse}
				<div class="col-sm-10 offset-sm-1">
				{include file="$template/includes/alert.tpl" type="info" msg="{lang key='nosupportdepartments'}" textcenter=true}
				</div>
			{/foreach}
		</div>
    </div>
</div>
