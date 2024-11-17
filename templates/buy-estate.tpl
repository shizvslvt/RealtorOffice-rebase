<link rel="stylesheet" href="../assets/style/buy-estate.css">

<div class="buy-estate-process">
    <h2>Process of buying</h2>
    <div class="buy-estate-attribute-row">
        <div class="buy-estate-attributes">Current Balance:</div>
        <div class="buy-estate-value">{$balance}</div>
    </div>
    <div class="buy-estate-attribute-row">
        <div class="buy-estate-attributes">Estate Cost:</div>
        <div class="buy-estate-value">{$estate_cost}</div>
    </div>

    <div class="buy-estate-attribute-row">
        <div class="buy-estate-attributes">Balance after:</div>
        <div class="buy-estate-value">
            {if isset($error)}
                {$error}
            {else}
                {$balance_new}
            {/if}
        </div>
    </div>

    {if !isset($error)}
        <form action="?p=buy-estate&id={$estate_id}&a=buy" method="post">
            <input type="hidden" name="id" value="{$estate_id}">
            <button type="submit">Buy</button>
        </form>
    {else}
        <form action="?p=top-up-balance" method="post">
            <button type="submit">Поповнити рахунок</button>
        </form>
    {/if}
</div>
