{extends file='checkout/checkout-step.tpl'}

{block name='step_content'}
  {if $logged_in}
    <p class="identity">{l s='Connected as %1$s %2$s.' sprintf=[$customer.firstname, $customer.lastname]}</p>
    <p>{l s='Not you? [1]Log out[/1]' tags=["<a href='{$urls.actions.logout}'>"]}</p>
  {elseif $show_login_form}
    <a href="{$urls.pages.order}" class="sub-link">{l s='No account?'}</a>
    {render file='checkout/_partials/login-form.tpl' ui=$login_form}
  {else}
    <a data-link-action="show-login-form" href="{$urls.pages.order_login}" class="sub-link">{l s='Already have an account?'}</a>
    {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
  {/if}
{/block}
