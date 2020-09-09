<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner" role="listbox">

    <div class="item active">
      <img class="first-slide" src="/Shoot_Idiot/public/img/slide1.png" alt="First slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>眼观古今中外，耳需一时清醒</h1>
          <p>带走满腹知识，留下一架好书</p>
          <p>
            <a class="btn btn-lg btn-primary" href="<?php echo site_url('Login/login1'); ?>" role="button">Sign in now</a>
          </p>
        </div>
      </div>
    </div>

    <div class="item">
      <img class="second-slide" src="/Shoot_Idiot/public/img/slide2.png" alt="Second slide">
      <div class="container">
        <div class="carousel-caption">
            <h1>人的知识愈多，人的本身也愈臻完善</h1>
          <p>学习这件事，不是缺乏时间，而是缺乏努力</p>
          <p>
            <a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a>
          </p>
        </div>
      </div>
    </div>

    <div class="item">
      <img class="third-slide" src="/Shoot_Idiot/public/img/slide3.png" alt="Third slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>书山之高，学海之深</h1>
          <p>来图书馆一看便知，人类的文明就这样耸立在你的面前</p>
          <p>
            <a class="btn btn-lg btn-primary" href="<?php echo site_url('BookList/book'); ?>" role="button">Browse list</a>
          </p>
        </div>
      </div>
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
