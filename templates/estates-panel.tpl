<link rel="stylesheet" href="../assets/style/estate.css">

<div class="estates-grid">
    {foreach $estates as $estate}
        <div class="estate">
            <a href="?p=estate&id={$estate.id}">
                <div class="estate-title">{$estate.title}</div>

                <div class="estate-rows">
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Id:</div>
                        <div class="estate-value">{$estate.id}</div>
                    </div>
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Стоимость:</div>
                        <div class="estate-value">{$estate.cost}</div>
                    </div>
                </div>
                <div class="estate-attributes">Продавец:</div>
                <div class="estate-value">{$estate.seller_name} ({$estate.seller_id})</div>
                <div class="estate-value">{$estate.seller_mail}</div>

                <div class="estate-attributes">Риелтор:</div>
                <div class="estate-value">{$estate.realtor_name} ({$estate.realtor_id})</div>
                <div class="estate-value">{$estate.realtor_mail}</div>

                <div class="estate-rows">
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Город:</div>
                        <div class="estate-value">{$estate.city_name}</div>
                    </div>
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Местность:</div>
                        <div class="estate-value">{$estate.locality_name}</div>
                    </div>
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Тип:</div>
                        <div class="estate-value">{$estate.type_name}</div>
                    </div>
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Площадь:</div>
                        <div class="estate-value">{$estate.area} м²</div>
                    </div>
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Этажи:</div>
                        <div class="estate-value">{$estate.floors}</div>
                    </div>
                    <div class="estate-attribute-row">
                        <div class="estate-attributes">Спальни:</div>
                        <div class="estate-value">{$estate.bedrooms}</div>
                    </div>
                </div>


                <div class="estate-bottom-row">
                    <div class="estate-attributes">Время:</div>
                    <div class="estate-value">{$estate.time}</div>
                </div>
            </a>
        </div>
    {/foreach}
</div>
