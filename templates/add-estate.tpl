<link rel="stylesheet" href="../assets/style/estate.css">

<div class="estate-div">
    <h2>Add Estate</h2>
    <form action="?p=add-estate" method="post">
        <div class="user-box">
            <div class="item"><input type="text" name="title" required=""><label>title</label></div>
        </div>
        <div class="user-box">
            <div class="item">
                <textarea name="description" required=""></textarea><label>description</label></div>
        </div>

        <div class="user-box">
            <div class="item third"><select name="city" required="">{foreach $locations.cities as $city}
                        <option value="{$city.id}">{$city.name}</option>{/foreach}</select><label>city</label></div>
            <div class="item third"><select name="locality" required="">{foreach $locations.localities as $locality}
                        <option value="{$locality.id}">{$locality.name}</option>{/foreach}
                </select><label>locality</label></div>
            <div class="item third"><select name="type" required="">{foreach $locations.types as $type}
                        <option value="{$type.id}">{$type.name}</option>{/foreach}</select><label>type</label></div>
        </div>


        <div class="user-box">
            <div class="item third"><input type="number" name="area" required=""><label>area</label></div>
            <div class="item third"><input type="number" name="floors" required=""><label>floors</label></div>
            <div class="item third"><input type="number" name="bedrooms" required=""><label>bedrooms</label></div>
        </div>

        <div class="user-box">
            <div class="item"><input type="number" name="cost" required=""><label>cost</label></div>
        </div>
        <button type="submit">Add Estate</button>
    </form>
</div>

