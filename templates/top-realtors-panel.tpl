<div class="control-panel-block">
        <div class="title">Top Realtors by Year</div>
    <div class="control-panel-block-item">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Count</th>
                <th>Year</th>
            </tr>
            {foreach $realtors_by_year as $realtor}
                <tr>
                    <td>{$realtor.id}</td>
                    <td>{$realtor.name}</td>
                    <td>{$realtor.count}</td>
                    <td>{$realtor.year}</td>
                </tr>
            {/foreach}
        </table>

        <div class="input">
            <form action="?p=control-panel&c=top-realtors-panel&a=year" method="post">
                    <label>Year</label>
                <div class="input-box">
                    <input type="number" name="year" required="" aria-label="Year" autocomplete="off" placeholder=" "
                           value="{$year}">
                </div>
                <button type="submit">Go</button>
            </form>
        </div>
    </div>

        <div class="title">Top Realtors by Between Dates</div>

    <div class="control-panel-block-item">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Count</th>
                <th>Start Date</th>
                <th>Finish Date</th>
            </tr>
            {foreach $realtors_between_dates as $realtor}
                <tr>
                    <td>{$realtor.id}</td>
                    <td>{$realtor.name}</td>
                    <td>{$realtor.count}</td>
                    <td>{$realtor.start_date}</td>
                    <td>{$realtor.finish_date}</td>
                </tr>
            {/foreach}
        </table>

        <div class="input">
            <form action="?p=control-panel&c=top-realtors-panel&a=between-dates" method="post">
                <label>Between Dates</label>
                <div class="input-box">
                    <input type="date" name="start_date" required="" aria-label="Start date" autocomplete="off" placeholder=" " value="{$start_date}">
                    <input type="date" name="finish_date" required="" aria-label="Finish date" autocomplete="off" placeholder=" " value="{$finish_date}">

                </div>
                <button type="submit">Go</button>
            </form>
        </div>
    </div>
</div>