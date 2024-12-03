
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Mail</th>
        <th>Birthday</th>
        <th>Pid</th>
        <th>Balance</th>
        <th>Time</th>
    </tr>
    {foreach $users as $user}
        <tr>
            <td>{$user.id}</td>
            <td>{$user.name}</td>
            <td>{$user.mail}</td>
            <td>{$user.birthday}</td>
            <td>{$user.pid}</td>
            <td>{$user.balance}</td>
            <td>{$user.time}</td>
        </tr>
    {/foreach}
</table>
