
<div class="control-panel-block">
        <div class="title">Chats By users ID</div>
    <div class="control-panel-block-item">
        <table>
            <tr>
                <th>ID</th>
                <th>Estate ID</th>
                <th>Seller ID</th>
                <th>Realtor ID</th>
                <th>Buyer ID</th>
                <th>Time</th>
                <th>Sold</th>
            </tr>
            {foreach $chats as $chat}
                <tr>
                    <td>{$chat.id}</td>
                    <td>{$chat.estate_id}</td>
                    <td>{$chat.seller_id}</td>
                    <td>{$chat.realtor_id}</td>
                    <td>{$chat.buyer_id}</td>
                    <td>{$chat.time}</td>
                    <td>{$chat.sold}</td>
                </tr>
            {/foreach}
        </table>

        <div class="input">
            <form action="?p=control-panel&c=chats-users-panel" method="post">
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