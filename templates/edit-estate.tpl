<link rel="stylesheet" href="../assets/style/estate.css">

<div class="estate-div">
    <h2>Edit Estate</h2>
    <form action="?p=edit-estate&id={$estate.id}" method="POST">
        <div class="user-box">
            <div class="item"><input type="text" name="title" required value="{$estate.title}"><label>title</label>
            </div>
        </div>
        <div class="user-box">
            <div class="item"><textarea name="description"
                                        required>{$estate.description}</textarea><label>description</label></div>
        </div>

        <div class="user-box">
            <div class="item third">
                <select name="city" required>
                    {foreach $locations.cities as $city}
                        <option value="{$city.id}" {if $city.id == $estate.city_id}selected{/if}>{$city.name}</option>
                    {/foreach}
                </select>
                <label>city</label>
            </div>
            <div class="item third">
                <select name="locality" required>
                    {foreach $locations.localities as $locality}
                        <option value="{$locality.id}"
                                {if $locality.id == $estate.locality_id}selected{/if}>{$locality.name}</option>
                    {/foreach}
                </select>
                <label>locality</label>
            </div>
            <div class="item third">
                <select name="type" required>
                    {foreach $locations.types as $type}
                        <option value="{$type.id}" {if $type.id == $estate.type_id}selected{/if}>{$type.name}</option>
                    {/foreach}
                </select>
                <label>type</label>
            </div>
        </div>
        <div class="user-box">
            <div class="item third">
                <input type="number" name="area" required value="{$estate.area}"><label>area</label>
            </div>
            <div class="item third">
                <input type="number" name="bedrooms" required value="{$estate.bedrooms}"><label>bedrooms</label>
            </div>
            <div class="item third">
                <input type="number" name="floors" required value="{$estate.floors}"><label>floors</label>
            </div>
        </div>

        <div class="user-box">
            <div class="item half"><input type="number" name="cost" required value="{$estate.cost}"><label>cost</label>
            </div>
            <div class="checkbox-wrapper-4">
                <input type="hidden" name="archived" value="1">
                <input name="archived" class="inp-cbx" id="labelcbx" type="checkbox" value="0"
                       {if $estate.archived == 0}checked{/if}><label class="cbx" for="labelcbx"><span></span><span>Active</span></label>
            </div>

        </div>

        <button type="submit">Save</button>
    </form>
</div>




