<private>
	<div class="login" if={currentUser} style="width:1000px;" align="center">
		<h2>Discussion Forum</h2>
		<h3>Welcome to the forum, {currentUser.email}!!!</h3>
		<div style="width:1000px">
				<h3>Please type in what you would like to say!</h3>
				<textarea ref="sentenceBody" rows="8" cols="50"></textarea>
				<button type="button" onclick={ sendMessage }>Publish!</button>
		</div>
		<pastsentence each={ msg in teachList }></pastsentence>
		<button type="button" onclick={ logOut}>Log Out</button>
	</div>

	<script>
		var tag= this;
	  this.currentUser = firebase.auth().currentUser;
	  this.logOut = this.parent.logOut;

		var that = this;
		that.total = "";

		this.teachList = [];
		this.remove = function(event) {
			var trainObj = event.item;
			var index = that.teachList.indexOf(trainObj);
			that.teachList.splice(index, 1);
			that.update();
		};

		this.unmountPastsentence = function(event) {
		this.unmount();
		};

		var messagesRef = rootRef.child('teachList');
		this.sendMessage = function(){
			var key = messagesRef.push().key;
			var msg = {
				body: this.refs.sentenceBody.value
			};

			messagesRef.push(msg);
		}

		messagesRef.on('value', function(snap){
			let dataAsObj = snap.val();
			var tempData = [];
			for (key in dataAsObj) {
				tempData.push(dataAsObj[key]);
			}
			that.teachList = tempData;
			that.update();
		});
	</script>
</private>
