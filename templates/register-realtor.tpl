
<link rel="stylesheet" href="../assets/style/login.css">
<div class="login">
    <h2>Register</h2>
    <form action="?p=register-realtor" method="post">
        <div class="user-box">
            <input type="text" name="name" aria-label="Name" placeholder=" ">
            <label>Name</label>
        </div>
        <div class="user-box">
            <input type="email" name="mail" aria-label="Email"placeholder=" ">
            <label>Mail</label>
        </div>
        <div class="user-box">
            <input type="password" name="password" aria-label="Password" placeholder=" ">
            <label>Password</label>
        </div>
        <div class="user-box">
            <input type="repeat_password" name="repeat_password" aria-label="Repeat password" placeholder=" ">
            <label>Repeat password</label>
        </div>
        <div class="user-box">
            <input type="date" name="birthday" aria-label="Birthday">
            <label>Birthday</label>
        </div>
        <div class="user-box">
            <input type="number" name="pid" aria-label="PID" placeholder=" ">
            <label>PID</label>
        </div>
        <div class="user-box">
            <input type="date" name="experience" aria-label="Experience">
            <label>Experience</label>
        </div>
            <button type="submit">Sign Up as Realtor</button>
    </form>
</div>