<style>
    .main_cont_principal {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        text-align: center;
        margin-bottom: 30px;
        background-color: white;
    }

    .main_cont_principal .cont_error {
        text-align: center;
    }

    .main_cont_principal .card-body {
        font-size: 18px;
        padding: 30px 0px;
    }

    .main_cont_principal .card-body h1 {
        font-weight: 500;
        color: #8e3729
    }

    .main_cont_principal .card-body .pb-2 {
        padding-bottom: 0.5rem !important;
    }
</style>
{if $errorMsg eq 'expire'}
    <div class="main_cont_principal">
        <div class="cont_principal">

            <div class="cont_error">

                <div class="card-body">

                    <h1>{$lang['Oops']}</h1>

                    <div class="pb-2">{$lang['linkExpiredError']}</div>

                </div>

            </div>
        </div>
    </div>
{else}
    <div class="main_cont_principal">
        <div class="cont_principal">

            <div class="cont_error">

                <div class="card-body">

                    <h1>{$lang['Oops']}</h1>

                    <div class="pb-2">{$lang['requiredPermissionstoaccess']}</div>

                    <div>{$lang['contactMasterAccountOwner']}</div>

                </div>

            </div>
        </div>
    </div>
{/if}