<pastsentence>
	<p> {currentUser.email} thought: <br> { msg.body }</p>

	<script>
		var tag= this;
		this.currentUser = firebase.auth().currentUser;
	</script>
	
	<style>
		:scope {
			display: block;
			border: 1px solid black;
      margin-top: 30px;
			background: white;
		}
	</style>
</pastsentence>
