<link rel="stylesheet" href="../assets/style/style.css">
<link rel="stylesheet" href="../assets/style/header.css">

<header>
    <div class="header-left">
        <a href="?p=home"><div class="header-item">Home</div></a>
    </div>
    <div class="header-center">
        {if $access_level == 1 || $access_level == 2}
            <a href="?p=chats"><div class="header-item">Chats</div></a>
        {/if}
        {if $access_level == 1}
            <a href="?p=add-estate"><div class="header-item">Add estate</div></a>
            {/if}
        {if $access_level == 2}
            <a href="?p=for-accept"><div class="header-item">For Accept</div></a>
            <a href="?p=waiting-deals"><div class="header-item">Accepted</div></a>
        {/if}
        {if $access_level == 3}
            <a href="?p=control-panel"><div class="header-item">Control panel</div></a>
        {/if}
    </div>
    <div class="header-right">
        {if $access_level == 0}
            <a href="?p=login"><div class="header-item">Login</div></a>
            <a href="?p=register"><div class="header-item">Register</div></a>
        {else}
            <a href="?p=profile"><div class="header-item">Profile</div></a>
            <a href="?p=logout"><div class="header-item red">Logout</div></a>
        {/if}
    </div>
</header>