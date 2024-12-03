 <div class="control-panel-block">
             <div class="title">Messages By Month And User ID</div>
    <div class="control-panel-block-item">

        <table>
    <tr>
        <th>ID</th>
        <th>Chat ID</th>
        <th>User ID</th>
        <th>Message</th>
        <th>Time</th>
    </tr>
    {foreach $messages as $message}
        <tr>
            <td>{$message.id}</td>
            <td>{$message.chat_id}</td>
            <td>{$message.user_id}</td>
            <td>{$message.message}</td>
            <td>{$message.time}</td>
        </tr>
    {/foreach}
</table>

<div class="input">
    <form action="?p=control-panel&c=messages-users-panel" method="post">
        <label>Month</label>
        <div class="input-box">
            <input type="number" name="month" required="" aria-label="Month" autocomplete="off" placeholder=" "
                   value="{$month}">
        </div>
        <label>Id</label>
        <div class="input-box">
            <input type="number" name="user_id" required="" aria-label="User ID" autocomplete="off" placeholder=" "
                   value="{$user_id}">
        </div>
        <button type="submit">Go</button>
    </form>
</div>

    </div>
</div>