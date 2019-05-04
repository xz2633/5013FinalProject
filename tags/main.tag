<main>
  <div style="height:850px; width:1000px;" align="center">
    <br>
    <h2>Rise Autism Awareness!</h2>
    <br>
    <p>Autism is a developmental disorder characterized by difficulties with social interaction and communication, and by restricted and repetitive behavior.Parents usually notice signs during the first three years of their child's life.These signs often develop gradually, though some children with autism reach their developmental milestones at a normal pace before worsening.</p>
    <br><br>
    <h2>Feel the difference</h2>
    <div style="width:500px; float:left">
          <autism></autism>
    </div>
    <div style="width:500px; float:left">
          <cool></cool>
    </div>
    <div style="height:50px; width:1000px;" align="center">
        <button onclick={ resetAll }>RESET THE CONVERSATION</button>
    </div>
  </div>

  <div style="width:1000px;" align="center">
    <h2>How many are them in the United States</h2>
    <p>According to the Center for Disease Control and Prevention (CDC), around one percent of world population are on the autism spectrum or having autism spectrum disorder (ASD) (CDC, 2014). In the United States, more than 3.5 million population are on the spectrum or live with ASD (Buescher et at, 2014).</p>
    <br>
    <p>Between 2009 and 2011, New York City saw a staggering nearly <strong>28</strong> percent increase in the number of autistic students between the ages of 3 and 21</p>
    <br>
    <h3>Database for autistic population in NYC (Fake Data)</h3>
    <p>Gender:</p>
    <select ref="gender" value="" onchange={ getResults }>
      <option value="">GENDER</option>
      <option value="male">Male</option>
      <option value="female">Female</option>
      <option value="unknown">Unknown</option>
    </select>
    <p>Age:</p>
    <select ref="age" value="" onchange={ filterResults }>
      <option value="">AGE</option>
      <option value="0-10">0-10</option>
      <option value="10-20">10-20</option>
      <option value="20-30">20-30</option>
    </select>
    <h2>Result</h2>
    <pre>
      <strong>Total Count of Autism in NYC</strong> = { total }
      <br>
      <strong>The number of people in your selected category</strong> = { candidates.length }
      <br>
      <strong>Their details</strong>
       = { JSON.stringify(candidates, null, 2) }
    </pre>
  </div>

  <br><br>
  <div class="login" if={!currentUser} align="center" style="width:1000px;">
    <h2>Disscussion Forum</h2>
    <h3>In order to proceed to the forum, and be responsible for what you say, please login through Google.</h3>
    <button type="button" onclick={ logIn }>Login</button>
  </div>
  <private if={currentUser}></private>

	<script>
		var that = this;
	  that.total = "";
    var tag = this;

    var database = firebase.database();
    var candidatesRef = database.ref('candidates');

    resetAll(event) {
      observable.trigger('reset');
    }
    this.candidates = [];

    candidatesRef.once('value', function(snap) {
      var data = snap.val();
      that.total = Object.keys(data).length;

      var listOfUsers = [];
      for (var key in data) {
        listOfUsers.push(data[key]);
      }

      that.candidates = listOfUsers;
      that.update();
    });

    getResults(event) {
      var gender = this.refs.gender.value;
      var query = candidatesRef.orderByChild('gender');
      if (gender) {
        query = query.equalTo(gender);
      }

      query.once('value', function(snap) {
        var data = snap.val();
        var listOfUsers = [];
        for (var key in data) {
          listOfUsers.push(data[key]);
        }
        that.candidates = listOfUsers;
        that.update();
      });
    }

    filterResults(event) {
      var gender = this.refs.gender.value;
      var query = candidatesRef.orderByChild('gender');

      if (gender) {
        query = query.equalTo(gender);
      }

      query.once('value', function(snap) {
        var data = snap.val();
        var listOfUsers = [];
        for (var key in data) {
          listOfUsers.push(data[key]);
        }
        var selectedEat = that.refs.age.value;
        var filteredList = listOfUsers.filter(function(user){
          return user.age === selectedEat;
        });
        that.candidates = filteredList;
        that.update();
      });
    }

    this.currentUser = firebase.auth().currentUser;

    user.onAuthStateChanged(function (userObj) {
      tag.currentUser = firebase.auth().currentUser;
      tag.update();
    });

    this.logIn = function () {
      var provider = new firebase.auth.GoogleAuthProvider();
      user.signInWithPopup(provider);
    }

    this.logOut = function () {
      user.signOut();
    }
	</script>


</main>
