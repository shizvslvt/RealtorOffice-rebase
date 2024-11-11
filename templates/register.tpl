
<link rel="stylesheet" href="../assets/style/login.css">
<div class="login">
    <h2>Register</h2>
    <form action="?p=register" method="post">
        <div class="user-box">
            <input type="text" name="name" required="" aria-label="Name" autocomplete="off" placeholder=" ">
            <label>Name</label>
        </div>
        <div class="user-box">
            <input type="email" name="mail" required="" aria-label="Email" autocomplete="off" placeholder=" ">
            <label>Mail</label>
        </div>
        <div class="user-box">
            <input type="password" name="password" required="" aria-label="Password" autocomplete="off" placeholder=" ">
            <label>Password</label>
        </div>
        <div class="user-box">
            <input type="password" name="repeat_password" required="" aria-label="Repeat password" autocomplete="off" placeholder=" ">
            <label>Repeat password</label>
        </div>
        <div class="user-box">
            <input type="date" name="birthday" required="" aria-label="Birthday" autocomplete="on" placeholder=" ">
            <label>Birthday</label>
        </div>
        <div class="user-box">
            <input type="number" name="pid" required="" aria-label="PID" autocomplete="off" placeholder=" ">
            <label>PID</label>
        </div>
        <div class="buttons">
            <button type="submit">Sign Up</button>
            <a href="?p=register-realtor"><button type="button" class="realtor">Sign Up as Realtor</button></a>
        </div>
    </form>
</div>