<link rel="stylesheet" href="../assets/style/estate.css">
<div class="estate">
    <a href="?p=estate&id={$estate.id}">
        <div class="estate-title">{$estate.title}</div>
        <div class="estate-rows">
            <div class="estate-attribute-row">
                <div class="estate-attributes">Стоимость:</div>
                <div class="estate-value">{$estate.cost}</div>
            </div>
            {if $status != "home"}
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Id:</div>
                    <div class="estate-value">{$estate.id}</div>
                </div>
            {/if}
        </div>
        <div class="estate-attributes">Описание:</div>
        <div class="estate-value">{$estate.description}</div>
        <div class="estate-rows">
            <div class="estate-attribute-row">
                <div class="estate-attributes">Город:</div>
                <div class="estate-value">{$estate.city_name}</div>
            </div>
            <div class="estate-attribute-row">
                <div class="estate-attributes">Тип:</div>
                <div class="estate-value">{$estate.type_name}</div>
            </div>
            {if $status != "home"}
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Местность:</div>
                    <div class="estate-value">{$estate.locality_name}</div>
                </div>
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Спальни:</div>
                    <div class="estate-value">{$estate.bedrooms}</div>
                </div>
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Площадь:</div>
                    <div class="estate-value">{$estate.area}</div>
                </div>
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Этажи:</div>
                    <div class="estate-value">{$estate.floors}</div>
                </div>
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Id продавца:</div>
                    <div class="estate-value">{$estate.seller_id}</div>
                </div>
                <div class="estate-attribute-row">
                    <div class="estate-attributes">Id риелтора:</div>
                    <div class="estate-value">{$estate.realtor_id}</div>
                </div>
            {/if}
        </div>
        <div class="estate-bottom-row">
            <div class="estate-attributes">Время:</div>
            <div class="estate-value">{$estate.time}</div>
        </div>
    </a>

    {if $status != "realtor" || isset($status)}
        {if $status == "by-id"}
            <div class="estate-button-container">
                {if $chat_id}
                    <a href="?p=chats&c=buy&id={$chat_id}">
                        <button>Chat</button>
                    </a>
                {else}
                    <a href="?p=chats&a=create-chat&id={$estate.id}">
                        <button>Create Chat</button>
                    </a>
                {/if}
            </div>
        {elseif $status == "for-accept"}
            <div class="estate-button-container">
                <a href="?p=accept-estate&id={$estate.id}">
                    <button>Accept</button>
                </a>
            </div>
        {elseif $status == "buy" && $buyer && !$checksold}
            <div class="estate-button-container">
                <a href="?p=buy-estate&id={$estate.id}">
                    <button>Buy</button>
                </a>
            </div>
        {/if}
    {/if}
</div>


