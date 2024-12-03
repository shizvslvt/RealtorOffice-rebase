<table>
    <tr>
        <th>ID</th>
        <th>Type</th>
        <th>Link</th>
        <th>Chat ID</th>
        <th>User ID</th>
        <th>Description</th>
        <th>Amount</th>
        <th>Time</th>
    </tr>
    {foreach $logs as $log}
        <tr>
            <td>{$log.id}</td>
            <td>{$log.type}</td>
            <td>{$log.link}</td>
            <td>{$log.chat_id}</td>
            <td>{$log.user_id}</td>
            <td>{$log.desc}</td>
            <td>{$log.amount}</td>
            <td>{$log.time}</td>
        </tr>
    {/foreach}
</table>

