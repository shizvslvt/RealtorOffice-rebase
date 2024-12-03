<link rel="stylesheet" href="../assets/style/estate.css">

<div class="estate-div">
    <h2>Add Estate</h2>
    <form action="?p=add-estate" method="post">
        <div class="user-box"><input type="text" name="title" required=""><label>title</label></div>
        <div class="user-box"><input type="text" name="description" required=""><label>description</label></div>
        <div class="user-box"><input type="number" name="cost" required=""><label>cost</label></div>
        <div class="user-box"><select name="type" required="">{foreach $locations.types as $type}<option value="{$type.id}">{$type.name}</option>{/foreach}</select><label>type</label></div>
        <div class="user-box"><select name="city" required="">{foreach $locations.cities as $city}<option value="{$city.id}">{$city.name}</option>{/foreach}</select><label>city</label></div>
        <div class="user-box"><select name="locality" required="">{foreach $locations.localities as $locality}<option value="{$locality.id}">{$locality.name}</option>{/foreach}</select><label>locality</label></div>
        <div class="user-box"><input type="number" name="area" required=""><label>area</label></div>
        <div class="user-box"><input type="number" name="bedrooms" required=""><label>bedrooms</label></div>
        <div class="user-box"><input type="number" name="floors" required=""><label>floors</label></div>
        <button type="submit">Add Estate</button>
    </form>
</div>

