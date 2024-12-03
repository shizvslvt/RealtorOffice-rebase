<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Mail</th>
        <th>Percent</th>
        <th>Experience</th>
        <th>Balance</th>
        <th>Time</th>
        <th>Action</th>
    </tr>
    {foreach $realtors as $realtor}
        <tr>
            <td>{$realtor.id}</td>
            <td>{$realtor.name}</td>
            <td>{$realtor.mail}</td>
            <td>{$realtor.percent}</td>
            <td>{$realtor.experience}</td>
            <td>{$realtor.balance}</td>
            <td>{$realtor.time}</td>
            <td><a href="?p=control-panel&c=realtors-panel&a=edit&id={$realtor.id}"><button>Edit</button></a></td>
        </tr>
    {/foreach}
</table>