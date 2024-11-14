<link rel="stylesheet" href="../assets/style/chats.css">

<div class="chats-grid">
    <div class="chats-grid-title">
        {if $accessLevel == 1}
            <a href="?p=chats&c=buy">
                <div class="chats-grid-title-item {if $c == 'buy'}active{/if}">Buy</div>
            </a>
        {/if}
        <a href="?p=chats&c=sell">
            <div class="chats-grid-title-item {if $c == 'sell'}active{/if}">Sell</div>
        </a>
    </div>

    {if $chats}
        {foreach $chats as $chat}
            <div class="chats-grid-item">
                <div>Deal ID: {$chat.deal_id}</div>
                <div>Estate ID: {$chat.estate_id}</div>
                <div>Buyer ID: {$chat.buyer_id}</div>
                <div>Time: {$chat.time}</div>
                <div>Sold: {if $chat.sold}Yes{else}No{/if}</div>
            </div>
        {/foreach}
    {else}
        <div class="no-chats-message">
            No chats available.
        </div>
    {/if}
</div>
