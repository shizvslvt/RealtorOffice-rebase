<link rel="stylesheet" href="../assets/style/messages.css">


<div class="chat">
    <div class="chat-title">Chat</div>
<div class="chat-messages">
    {foreach $messages as $message}
        <div class="chat-message-wrapper {if $message.user_id != $uid}left{else}right{/if}">
            <div class="chat-message">
                {$message.message}
            </div>
            <span class="small">{$message.time} | {$message.user_id}</span>
        </div>
    {/foreach}
</div>



    <div class="chat-input">
        <form action="?p=chats&c={$c}" method="post">
            <input type="text" name="message" placeholder="Type your message...">
            <input type="hidden" name="user_id" value="{$uid}">
                <input type="hidden" name="chat_id" value="{$chat_id}">
            <button type="submit">Send</button>
        </form>
    </div>

</div>


