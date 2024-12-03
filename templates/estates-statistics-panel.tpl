<link rel="stylesheet" href="../assets/style/estate.css">

 <div class="control-panel-block">
             <div class="title"> Sum Area All Estates by Type </div>
    <div class="control-panel-block-item">
        <table>
            <tr>
                <th>Estates Count</th>
                <th>Area Sum Of Estates</th>
                <th>Type</th>
            </tr>
            {foreach $estates_by_type as $estate}
                <tr>
                    <td>{$estate.EstatesCount}</td>
                    <td>{$estate.AreaCount}</td>
                    <td>{$estate.name}</td>
                </tr>
            {/foreach}
        </table>

        <div class="input">
            <form action="?p=control-panel&c=estates-statistics-panel&a=type_area" method="post">
                <label>Type</label>
                <div class="input-box">
                    <div class="user-box">
                        <select name="type" required="">
                            {foreach $types as $item}
                                <option value="{$item.id}" {if $item.id == $type}selected{/if}>
                                    {$item.name}
                                </option>
                            {/foreach}</select>
                    </div>
                </div>
                <button type="submit">Go</button>
            </form>
        </div>
    </div>


             <div class="title"> Estates with Max Area by Type </div>
        <div class="control-panel-block-item">
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Cost</th>
                <th>Seller ID</th>
                <th>Realtor ID</th>
                <th>Type</th>
                <th>City</th>
                <th>Locality</th>
                <th>Bedrooms</th>
                <th>Floors</th>
                <th>Time</th>
                <th>Area</th>
            </tr>
            {foreach $estates_by_type_with_max_area as $estate}
                <tr>
                    <td>{$estate.id}</td>
                    <td>{$estate.title}</td>
                    <td>{$estate.cost}</td>
                    <td>{$estate.seller_id}</td>
                    <td>{$estate.realtor_id}</td>
                    <td>{$estate.type}</td>
                    <td>{$estate.city}</td>
                    <td>{$estate.locality}</td>
                    <td>{$estate.bedrooms}</td>
                    <td>{$estate.floors}</td>
                    <td>{$estate.time}</td>
                    <td>{$estate.max_area}</td>
                </tr>
            {/foreach}
        </table>

    </div>
</div>