<link rel="stylesheet" href="../assets/style/chats.css">
<script>
    window.onload = function () {
        var messagesDiv = document.querySelector('.chat-messages');
        messagesDiv.scrollTop = messagesDiv.scrollHeight;
    }
</script>
<div class="chats-page-main-div">
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
            <div class="chat-grid-items">
                {foreach $chats as $chat}
                    <div class="chats-grid-item  {if $chat.sold}sold{else}not-sold{/if}">
                        <a href="?p=chats&c={$c}&id={$chat.chat_id}">
                            <div class="chat-estate-title">{$chat.title}</div>
                            <div class="chat-attributes">
                                <div><span>Chat ID:</span> {$chat.chat_id}</div>
                                <div><span>Estate ID:</span> {$chat.estate_id}</div>
                                <div><span>Buyer ID:</span> {$chat.buyer_id}</div>
                                <div><span>Seller ID:</span> {$chat.seller_id}</div>
                                <div><span>Realtor ID:</span> {$chat.realtor_id}</div>
                                <div><span>Time:</span> {$chat.time}</div>
                            </div>
                        </a>
                    </div>
                {/foreach}

            </div>
        {else}
            <div class="chat-grid-items">
                <div class="chats-grid-item sold">
                    <div class="chat-estate-title">
                        No chats available.
                    </div>
                </div>
            </div>
        {/if}
    </div>
