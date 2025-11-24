<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Netflix Clone</title>
</head>
<body>
  <header>
    <div class="logo">Netflix</div>
    <nav>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="movie.html">Movies</a></li>
        <li><a href="plan.html">Plan</a></li>
      </ul>
    </nav>
  </header>
  <section class="hero">
    <h1>Unlimited movies, TV shows, and more.</h1>
    <p>Watch anywhere. Cancel anytime.</p>
    <a href="signin.html">
      <button class="btn">Get Started</button>
    </a>
  </section>
  <section class="section">
    <h2>Trending Now</h2>
    <form action="movie.jsp">
    <div class="card-container">
      <div class="card">
        <button type="submit" name="movie" value="Leo">
          <img src="poster/Leo.jpg" alt="Movie Thumbnail">
        </button>
        <p>Leo</p>
      </div>
      <div class="card">
        <button type="submit" name="movie" value="Tourist Family">
        <img src="poster/Tourist family.jpg" alt="Movie Thumbnail">
        </button>
        <p>Tourist Family</p>
      </div>
      <div class="card">
        <button type="submit" name="movie" value="Good Bad Ugly">
        <img src="poster/Good bad ugly.jpg" alt="Movie Thumbnail">
        </button>
        <p>Good Bad Ugly</p>
      </div>
    </div>
  </form>
  </section>
</body>
<style>
  * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  background-image: url('images/bg.jpg');
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-repeat: no-repeat;
  font-family: Arial, sans-serif;
  background-color: #141414;
  color: #fff;
  /* overflow-x: hidden; */
}
header {
  display: flex;
  align-items: center;
  padding: 20px 40px;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 10;  
  background: transparent;
}
header .logo {
  font-size: 28px;
  font-weight: bold;
  color: #e50914;
  margin-right: 50px;
}
nav ul {
  list-style: none;
  display: flex;
  gap: 20px;
}
nav ul li a {
  text-decoration: none;
  color: #fff;
  font-size: 16px;
  transition: color 0.3s;
}
nav ul li a:hover {
  color: #e50914;
}
.hero {
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding-top: 80px; /* Offset for fixed header */
}
.hero h1 {
  font-size: 4em;
  margin-bottom: 20px;
}
.hero p {
  font-size: 1.5em;
  margin-bottom: 30px;
}
.hero .btn {
  padding: 15px 30px;
  background-color: #e50914;
  border: none;
  border-radius: 3px;
  font-size: 1.2em;
  color: #fff;
  cursor: pointer;
  transition: background 0.3s;
}
.hero .btn:hover {
  background-color: #f40612;
}
/* .section {
  padding: 60px 40px;
  background-color: #141414;
} */
.section h2 {
  font-size: 40px;
  margin-bottom: 20px;
}
.card-container {
  display: flex;
  overflow-x: auto;
  gap: 40px;
  padding-bottom: 20px;
}
.card-container::-webkit-scrollbar {
  height: 8px;
}
.card-container::-webkit-scrollbar-thumb {
  background: #555;
  border-radius: 10px;
}
.card {
  flex: none;
  width: 200px;
  background-color: #222;
  border-radius: 5px;
  overflow: hidden;
  transition: transform 0.3s;
}
.card img {
  width: 100%;
  height: 90%;
  display: block;
}
.card p {
  padding: 10px;
  font-size: 0.9em;
}
.card:hover {
  transform: scale(1.05);
}
</style>
</html>