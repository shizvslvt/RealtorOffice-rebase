<div class="edit-realtor-block">
    <form action="?p=control-panel&c=realtors-panel&a=edit&id={$realtor.id}" method="POST">
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
            <tr>
                <td>{$realtor.id}</td>
                <td><input type="text" name="name" required="" value="{$realtor.name}"></td>
                <td><input type="email" name="mail" required="" value="{$realtor.mail}"></td>
                <td><input type="number" name="percent" required="" value="{$realtor.percent}"></td>
                <td><input type="date" name="experience" required="" value="{$realtor.experience}"></td>
                <td><input type="number" name="balance" required="" value="{$realtor.balance}"></td>
                <td><input type="datetime-local" name="time" required="" value="{$realtor.time}"></td>
                <td>
                    <button type="submit">Save</button>
                </td>
            </tr>
        </table>
    </form>
</div>
