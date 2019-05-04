<cool>
  <img src="img/{ cool2 }.gif">
  <div>
    <div class="happiness level">
      <div style="width:{ happiness }%;">&nbsp;</div>
    </div>
    <p>The Happiness level of a Normal child: { happiness }</p>
  </div>

  <button onclick={ ignore }>ignore the child</button>
  <button onclick={ treat }>treat the child</button>
  <br><br><br><br><br><br>
  <p>The cool girl hears: { data }</p>
	<button onclick={ talkToAut }>Respond to the autistic child</button>

  <script>
    var that  = this;

    this.happiness = 50;
    this.cool2 = "normal2";
    decHappiness() {
      this.happiness = this.happiness - 10 < 30 ? 30 : this.happiness - 10;
    }
    incHappiness() {
      console.log(this.happiness);
      this.happiness = this.happiness + 10 > 70 ? 70 : this.happiness + 10;
    }
    checkStatus() {
      if (this.happiness >= 60){
        this.cool2 = "happy2";
      } else if (this.happiness <= 40){
        this.cool2 = "sad2";
      }else{
        this.cool2 = "normal2";
      }
    }

    ignore(e) {
      this.decHappiness();
      this.checkStatus();
    }

    treat(e) {
      this.incHappiness();
      this.checkStatus();
    }

    this.data = "Nothing";
  	talkToAut(event) {
  		var fatMsg = "Sorry buddy, I don't have time. ~From the Cool Girl";
  		observable.trigger('fatDance', fatMsg);
  	}

    observable.on('exerice', function(passedData){
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
      margin-left: auto;
      height:200px;
    }
    p{
      margin-left: auto;
    }
  </style>
</cool>
