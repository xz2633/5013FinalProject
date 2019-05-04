<autism>
  <img src="img/{ autism1 }.gif">

  <div>
    <div class="happniess level">
      <div style="width:{ happniess }%;">&nbsp;</div>
    </div>
    <p>The Happiness level of an Autistic child: { happniess }</p>
  </div>

  <button onclick={ ignore }>ignore the child</button>
  <button onclick={ treat }>treat the child</button>
  <br><br><br>
  <h3>When they talk</h3>
  <p>The Autistic child hears: { data }</p>
	<button onclick={ talkToCool }>Talk to the peers</button>

  <script>
    var that  = this;
    this.happniess = 50;
    this.autism1 = "normal1";
    decHappniess() {
      this.happniess = this.happniess - 10 < 30 ? 30 : this.happniess - 10;
    }
    incHappniess() {
      console.log(this.happniess);
      this.happniess = this.happniess + 10 > 70 ? 70 : this.happniess + 10;
    }
    checkStatus() {
      if (this.happniess >= 60){
        this.autism1 = "happy1";
      } else if (this.happniess <= 40){
        this.autism1 = "sad1";
      }else{
        this.autism1 = "normal1";
      }
    }
    ignore(e) {
      this.decHappniess();
      this.checkStatus();
    }

    treat(e) {
      this.incHappniess();
      this.checkStatus();
    }

    this.data = "Nothing";
    talkToCool(event) {
      var fitMsg = "Hi, how is your day going so far? ~From the autism";
      observable.trigger('exerice', fitMsg);
    }

    observable.on('fatDance', function(passedData){
		  that.data = passedData;
			that.update();
		});

    observable.on('reset', function(){
      that.data = "Nothing";
    });
  </script>

  <style>
    :scope{
      margin:auto;
    }

    img{
      weight:auto;
      height:200px;
    }
  </style>
</autism>
